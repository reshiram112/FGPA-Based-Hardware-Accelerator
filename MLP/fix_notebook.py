"""Patch mnist_mlp_colab.ipynb: remove verbose=True from ReduceLROnPlateau (dropped in PyTorch 2.x)."""
import json, pathlib

nb_path = pathlib.Path(__file__).parent / "mnist_mlp_colab.ipynb"
nb = json.loads(nb_path.read_text(encoding="utf-8"))

FIXED_CELL_6 = [
    "# Cell 6 - Training loop\n",
    "def train(cfg, train_loader, val_loader):\n",
    "    model     = build_model(cfg)\n",
    "    criterion = nn.CrossEntropyLoss()\n",
    "    optimizer = optim.Adam(model.parameters(), lr=cfg['lr'],\n",
    "                           weight_decay=cfg['weight_decay'])\n",
    "    # NOTE: verbose kwarg removed in PyTorch 2.x\n",
    "    scheduler = optim.lr_scheduler.ReduceLROnPlateau(\n",
    "        optimizer, mode='max', factor=0.5, patience=3)\n",
    "\n",
    "    history = defaultdict(list)\n",
    "    best_val, best_state, no_improve = 0.0, None, 0\n",
    "    prev_lr = cfg['lr']\n",
    "\n",
    "    print(f\"{'Epoch':>5} {'TrainLoss':>10} {'TrainAcc':>9} {'ValLoss':>8} {'ValAcc':>8} {'LR':>10}\")\n",
    "    print('-'*60)\n",
    "    t0 = time.time()\n",
    "    for epoch in range(1, cfg['epochs']+1):\n",
    "        tl, ta = run_epoch(model, train_loader, criterion, optimizer)\n",
    "        vl, va = run_epoch(model, val_loader,   criterion)\n",
    "        scheduler.step(va)\n",
    "        cur_lr = optimizer.param_groups[0]['lr']\n",
    "        for k, v in zip(['train_loss','train_acc','val_loss','val_acc'], [tl, ta, vl, va]):\n",
    "            history[k].append(v)\n",
    "        lr_tag = f\"{cur_lr:.2e}\" + (\" ↓\" if cur_lr < prev_lr else \"\")\n",
    "        prev_lr = cur_lr\n",
    "        print(f\"{epoch:>5} {tl:>10.4f} {ta*100:>8.2f}% {vl:>8.4f} {va*100:>7.2f}% {lr_tag:>10}\")\n",
    "        if va > best_val:\n",
    "            best_val   = va\n",
    "            best_state = {k: v.clone() for k, v in model.state_dict().items()}\n",
    "            no_improve = 0\n",
    "        else:\n",
    "            no_improve += 1\n",
    "            if no_improve >= cfg['patience']:\n",
    "                print(f'Early stop at epoch {epoch}'); break\n",
    "    elapsed = time.time() - t0\n",
    "    print(f'Done in {elapsed:.1f}s  |  Best val {best_val*100:.2f}%')\n",
    "    model.load_state_dict(best_state)\n",
    "    return model, history, best_val\n",
]

patched = False
for cell in nb["cells"]:
    src = "".join(cell.get("source", []))
    if "verbose=True" in src and "ReduceLROnPlateau" in src:
        cell["source"] = FIXED_CELL_6
        patched = True
        print("[OK] Patched Cell 6 - removed verbose=True")

if not patched:
    print("[WARN] verbose=True not found - notebook may already be clean")

nb_path.write_text(json.dumps(nb, indent=1, ensure_ascii=False), encoding="utf-8")
print(f"[SAVED] {nb_path}")
