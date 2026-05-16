import os
import json
import joblib
import numpy as np
import pandas as pd
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

def get_data_path():
    candidates = [
        os.path.join(ROOT, 'datasets', 'lane_data', 'processed_lane_data.csv'),
        'data/processed_lane_data.csv',
    ]
    for p in candidates:
        if os.path.exists(p):
            return p
    raise FileNotFoundError(f"processed_lane_data.csv not found. Searched: {candidates}")

def engineer_features(df):
    X = df.drop('label', axis=1).copy()
    # Interaction and ratio features that help the SVM find a better boundary
    X['vel_x_acc']        = X['v_Vel'] * X['v_Acc']
    X['headway_ratio']    = X['Space_Headway'] / (X['v_Vel'] + 1e-6)
    X['time_space_ratio'] = X['Time_Headway'] / (X['Space_Headway'] + 1e-6)
    X['vel_squared']      = X['v_Vel'] ** 2
    X['acc_squared']      = X['v_Acc'] ** 2
    return X

def main():
    print("--- Training SVM for Lane Changing (RBF + Feature Engineering) ---")

    df = pd.read_csv(get_data_path())
    X  = engineer_features(df)
    y  = df['label']

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42)

    scaler       = StandardScaler()
    X_train_sc   = scaler.fit_transform(X_train)
    X_test_sc    = scaler.transform(X_test)

    print("Training Linear SVM...")
    param_grid = {'C': [0.1, 1, 10], 'kernel': ['linear']}
    grid = GridSearchCV(SVC(probability=True, random_state=42), param_grid, cv=5,
                        scoring='accuracy', n_jobs=-1, verbose=1)
    grid.fit(X_train_sc, y_train)

    print(f"Best params: {grid.best_params_}")
    clf = grid.best_estimator_

    y_pred = clf.predict(X_test_sc)
    acc  = accuracy_score(y_test, y_pred)
    prec = precision_score(y_test, y_pred, zero_division=0)
    rec  = recall_score(y_test, y_pred, zero_division=0)
    f1   = f1_score(y_test, y_pred, zero_division=0)

    print(f"SVM Accuracy:  {acc  * 100:.2f}%")
    print(f"SVM Precision: {prec * 100:.2f}%")
    print(f"SVM Recall:    {rec  * 100:.2f}%")
    print(f"SVM F1:        {f1   * 100:.2f}%")

    output_dir = os.path.join(ROOT, 'model_outputs')
    os.makedirs(f'{output_dir}/results', exist_ok=True)

    results = {
        "model": "SVM",
        "dataset": "NGSIM (Processed Lane Data)",
        "kernel": "linear",
        "best_params": grid.best_params_,
        "test_accuracy": round(acc  * 100, 4),
        "precision":     round(prec * 100, 4),
        "recall":        round(rec  * 100, 4),
        "f1":            round(f1   * 100, 4),
    }
    res_dir = os.path.join(ROOT, 'results', 'svm')
    os.makedirs(res_dir, exist_ok=True)
    with open(os.path.join(res_dir, 'svm_results.json'), 'w') as f:
        json.dump(results, f, indent=4)

    joblib.dump(clf,    os.path.join(output_dir, 'svm_model.pkl'))
    joblib.dump(scaler, os.path.join(output_dir, 'svm_scaler.pkl'))
    # Save feature column names so evaluation can reconstruct features correctly
    joblib.dump(list(X.columns), os.path.join(output_dir, 'svm_feature_names.pkl'))
    print("Model, scaler, and feature names saved.")

if __name__ == "__main__":
    main()
