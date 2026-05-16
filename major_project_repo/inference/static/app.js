/* ═══════════════════════════════════════════════════════════
   Automotive ML Inference UI — Frontend Logic
   ═══════════════════════════════════════════════════════════ */

// ── DOM references ───────────────────────────────────────────────────────────
const dropzone      = document.getElementById("dropzone");
const dropInner     = document.getElementById("dropzone-inner");
const fileInput     = document.getElementById("file-input");
const previewImg    = document.getElementById("preview-img");
const inferBtn      = document.getElementById("infer-btn");
const btnText       = document.getElementById("btn-text");
const btnSpinner    = document.getElementById("btn-spinner");
const stepsPanel    = document.getElementById("steps-panel");
const dzIconImage   = document.getElementById("dz-icon-image");
const dzIconAudio   = document.getElementById("dz-icon-audio");
const dzIconCsv     = document.getElementById("dz-icon-csv");
const dzText        = document.getElementById("dz-text");

// Result panel
const resultWaiting    = document.getElementById("result-waiting");
const resultContent    = document.getElementById("result-content");
const predDigit        = document.getElementById("pred-digit");
const predMetaLabel    = document.getElementById("pred-meta-label");
const predLabelText    = document.getElementById("pred-label-text");
const confValue        = document.getElementById("conf-value");
const ringFill         = document.getElementById("ring-fill");
const modelBadgeWrap   = document.getElementById("model-badge-wrap");
const aiVisionBlock    = document.getElementById("ai-vision-block");
const aiVisionImg      = document.getElementById("ai-vision-img");
const aiVisionLabelTxt = document.getElementById("ai-vision-label-text");
const audioWave        = document.getElementById("audio-wave");
const csvFeatureBlock  = document.getElementById("csv-feature-block");
const featureTbody     = document.getElementById("feature-tbody");

// Metrics panel
const metricsWaiting = document.getElementById("metrics-waiting");
const metricsContent = document.getElementById("metrics-content");

// Prob section
const probSection       = document.getElementById("prob-section");
const probSectionTitle  = document.getElementById("prob-section-title");
const dualResultWrap    = document.getElementById("dual-result-wrap");
const cnnTop5Grid       = document.getElementById("cnn-top5-grid");
const bnnBinaryGrid     = document.getElementById("bnn-binary-grid");
const binaryResultWrap  = document.getElementById("binary-result-wrap");
const binaryProbGrid    = document.getElementById("binary-prob-grid");

// Confidence ring circumference (r=52)
const CIRC = 2 * Math.PI * 52;  // ≈ 326.73

let selectedFile = null;
let currentFileType = null;  // 'image' | 'audio' | 'csv'

// ── Step helper ──────────────────────────────────────────────────────────────
const STEP_COUNT = 5;
function setStep(n) {
  for (let i = 1; i <= STEP_COUNT; i++) {
    const el = document.getElementById(`step-${i}`);
    if (!el) continue;
    if (i < n)        el.className = "step done";
    else if (i === n) el.className = "step active";
    else              el.className = "step";
  }
}

async function simulateSteps() {
  setStep(1); await delay(350);
  setStep(2); await delay(400);
  setStep(3); await delay(600);
  setStep(4); await delay(350);
  setStep(5);
}

function delay(ms) { return new Promise(r => setTimeout(r, ms)); }

// ── File-type detection ──────────────────────────────────────────────────────
function detectFileType(filename) {
  const ext = filename.toLowerCase().split('.').pop();
  if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].includes(ext)) return 'image';
  if (['wav', 'mp3', 'ogg', 'flac', 'm4a'].includes(ext)) return 'audio';
  if (ext === 'csv') return 'csv';
  if (ext === 'zip') return 'zip';
  return 'unknown';
}

// ── Dropzone icon / text update ──────────────────────────────────────────────
function updateDropzoneIcon(type) {
  dzIconImage.classList.add('hidden');
  dzIconAudio.classList.add('hidden');
  dzIconCsv.classList.add('hidden');
  if (type === 'image') {
    dzIconImage.classList.remove('hidden');
    dzText.innerHTML = 'Traffic sign or pothole image loaded<br/><span>click to change</span>';
  } else if (type === 'audio') {
    dzIconAudio.classList.remove('hidden');
    dzText.innerHTML = 'Audio file loaded<br/><span>click to change</span>';
  } else if (type === 'csv') {
    dzIconCsv.classList.remove('hidden');
    dzText.innerHTML = 'CSV file loaded<br/><span>click to change</span>';
  } else if (type === 'zip') {
    dzIconCsv.classList.remove('hidden');
    dzText.innerHTML = 'ZIP batch loaded<br/><span>click to change</span>';
  } else {
    dzIconImage.classList.remove('hidden');
    dzText.innerHTML = 'Drag &amp; drop file here<br/><span>or click to browse</span><br/><small style="color:var(--text-muted);font-size:11px">image / audio / .csv / .zip burst</small>';
  }
}

// ── Dropzone interactions ────────────────────────────────────────────────────
dropzone.addEventListener("click", () => fileInput.click());

dropzone.addEventListener("dragover", e => {
  e.preventDefault();
  dropzone.classList.add("drag-over");
});
dropzone.addEventListener("dragleave", () => dropzone.classList.remove("drag-over"));
dropzone.addEventListener("drop", e => {
  e.preventDefault();
  dropzone.classList.remove("drag-over");
  const file = e.dataTransfer.files[0];
  if (file) loadFile(file);
});

fileInput.addEventListener("change", () => {
  if (fileInput.files[0]) loadFile(fileInput.files[0]);
});

function loadFile(file) {
  selectedFile   = file;
  currentFileType = detectFileType(file.name);

  updateDropzoneIcon(currentFileType);

  if (currentFileType === 'image') {
    const url = URL.createObjectURL(file);
    previewImg.src = url;
    previewImg.classList.remove("hidden");
    dropInner.classList.add("hidden");
  } else {
    // For audio/csv: hide preview image, show updated text in dropzone-inner
    previewImg.classList.add("hidden");
    dropInner.classList.remove("hidden");
  }

  inferBtn.disabled = false;
}

// ── Sample input buttons ─────────────────────────────────────────────────────
document.querySelectorAll('.btn-sample').forEach(btn => {
  btn.addEventListener('click', async () => {
    const samplePath = btn.dataset.sample;
    const label      = btn.dataset.label || samplePath;
    const url        = `/sample/${samplePath}`;

    try {
      const resp = await fetch(url);
      if (!resp.ok) throw new Error(`HTTP ${resp.status}`);
      const blob     = await resp.blob();
      const filename = samplePath.split('/').pop();
      const file     = new File([blob], filename, { type: blob.type });
      loadFile(file);
      // Show a visual cue on the button
      const orig = btn.textContent;
      btn.textContent = '✓ ' + orig;
      btn.style.borderColor = 'var(--green)';
      btn.style.color = 'var(--green)';
      setTimeout(() => {
        btn.textContent = orig;
        btn.style.borderColor = '';
        btn.style.color = '';
      }, 1800);
    } catch (err) {
      console.error('Failed to load sample:', err);
    }
  });
});

// ── Inference ────────────────────────────────────────────────────────────────
inferBtn.addEventListener("click", async () => {
  if (!selectedFile) return;

  // Lock UI
  inferBtn.disabled = true;
  btnText.textContent = "Running…";
  btnSpinner.classList.remove("hidden");
  stepsPanel.classList.remove("hidden");

  // Reset panels to waiting state
  resultWaiting.classList.remove("hidden");
  resultContent.classList.add("hidden");
  metricsWaiting.classList.remove("hidden");
  metricsContent.classList.add("hidden");
  probSection.classList.add("hidden");
  dualResultWrap.classList.add("hidden");
  binaryResultWrap.classList.add("hidden");

  // Animate steps while fetch is in flight
  const stepPromise = simulateSteps();

  // Build multipart form and POST
  const formData = new FormData();
  formData.append("file", selectedFile);

  let data;
  try {
    const res = await fetch("/infer", { method: "POST", body: formData });
    data      = await res.json();
    if (!res.ok) throw new Error(data.error || `HTTP ${res.status}`);
  } catch (err) {
    await stepPromise;
    showError(err.message);
    resetBtn();
    return;
  }

  await stepPromise;
  await delay(200);

  // ── Populate result panel ─────────────────────────────────
  const inputType = data.input_type;

  // Model badge
  modelBadgeWrap.innerHTML = buildModelBadge(data);

  // Determine top-level prediction label & confidence
  const label = data.label || String(data.prediction);
  const conf  = data.confidence || 0;
  const isBatch = data.batch_size && data.batch_size > 1;

  // Confidence ring — short abbreviation inside ring
  let ringText = label.length > 8 ? label.substring(0, 7) + '…' : label;
  if (isBatch) {
    ringText = "Burst";
  } else if (inputType === 'image' && !isBatch) {
    // Use the CNN top1 class abbreviated
    ringText = (data.cnn && data.cnn.label) ? abbreviate(data.cnn.label, 9) : abbreviate(label, 9);
  }
  predDigit.textContent  = ringText;
  predDigit.style.fontSize = ringText.length > 6 ? '13px' : (ringText.length > 3 ? '15px' : '22px');
  confValue.textContent  = isBatch ? data.batch_size + " items" : conf.toFixed(1) + "%";

  const offset = CIRC * (1 - conf / 100);
  ringFill.style.strokeDashoffset = offset;
  if      (conf >= 85) ringFill.style.stroke = "var(--green)";
  else if (conf >= 60) ringFill.style.stroke = "var(--amber)";
  else                  ringFill.style.stroke = "var(--red)";

  // Full label below ring
  predLabelText.textContent = label;
  predLabelText.classList.remove("hidden");
  predMetaLabel.textContent = isBatch ? "Batch Status" : "Predicted Class";

  const expectedText = document.getElementById("pred-expected-text");
  if (expectedText) {
    if (data.expected_label) {
      const match = (data.expected_label === label);
      const icon = match ? "✅" : "❌";
      const color = match ? "var(--green)" : "var(--red)";
      expectedText.innerHTML = `<span style="color:var(--text-muted);font-weight:400;">Expected:</span> <span style="color:${color}">${data.expected_label} ${icon}</span>`;
      expectedText.classList.remove("hidden");
    } else {
      expectedText.classList.add("hidden");
    }
  }

  // "What the model sees"
  aiVisionImg.classList.add('hidden');
  audioWave.classList.add('hidden');
  csvFeatureBlock.classList.add('hidden');

  if (inputType === 'image' && data.preprocessed_img) {
    aiVisionLabelTxt.textContent = "What the model sees (32×32)";
    aiVisionImg.src = `data:image/png;base64,${data.preprocessed_img}`;
    aiVisionImg.classList.remove('hidden');
    aiVisionBlock.classList.remove('hidden');
  } else if (inputType === 'audio') {
    aiVisionLabelTxt.textContent = "Audio feature representation (MFCC)";
    audioWave.classList.remove('hidden');
    aiVisionBlock.classList.remove('hidden');
  } else if (inputType === 'csv') {
    aiVisionLabelTxt.textContent = "Lane sensor features";
    if (data.feature_preview && Object.keys(data.feature_preview).length > 0) {
      featureTbody.innerHTML = Object.entries(data.feature_preview)
        .map(([k, v]) => `<tr><td>${k}</td><td>${v}</td></tr>`)
        .join('');
      csvFeatureBlock.classList.remove('hidden');
    }
    aiVisionBlock.classList.remove('hidden');
  } else {
    aiVisionBlock.classList.add('hidden');
  }

  resultWaiting.classList.add("hidden");
  resultContent.classList.remove("hidden");
  resultContent.classList.add("fade-in");

  // ── Populate metrics panel ────────────────────────────────
  const latMs  = data.latency_mean_ms  || 0;
  const minMs  = data.latency_min_ms   || 0;
  const maxMs  = data.latency_max_ms   || 0;
  const p95Ms  = data.latency_p95_ms   || 0;
  const p99Ms  = data.latency_p99_ms   || 0;
  const fps    = data.throughput_fps   || 0;
  const cpu    = data.cpu_percent      || 0;
  const ram    = data.ram_mb           || 0;
  const nRuns  = data.n_runs           || 100;

  document.getElementById("v-latency").textContent       = latMs.toFixed(3) + " ms";
  document.getElementById("v-latency-range").textContent = `min ${minMs.toFixed(3)} / max ${maxMs.toFixed(3)} ms`;
  document.getElementById("v-fps").textContent           = fps.toFixed(1) + " /s";
  document.getElementById("v-cpu").textContent           = cpu.toFixed(1) + "%";
  document.getElementById("v-ram").textContent           = ram.toFixed(1) + " MB";
  document.getElementById("v-p95").textContent           = p95Ms.toFixed(3) + " ms";
  document.getElementById("v-p99").textContent           = p99Ms.toFixed(3) + " ms";
  document.getElementById("v-runs").textContent          = nRuns;
  document.getElementById("v-cpu-bar").style.width       = Math.min(cpu, 100) + "%";

  metricsWaiting.classList.add("hidden");
  metricsContent.classList.remove("hidden");
  metricsContent.classList.add("fade-in");

  // ── Probability output section ────────────────────────────
  if (isBatch) {
    probSectionTitle.textContent = "Burst Inference Classification Results";
    dualResultWrap.classList.add("hidden");
    binaryResultWrap.classList.remove("hidden");
    
    let html = `<div style="text-align:center;padding:10px;color:var(--text-muted);">Processed ${data.batch_size} samples in burst mode.</div>`;
    
    if (data.batch_counts && Object.keys(data.batch_counts).length > 0) {
      html += `<div style="max-height: 250px; overflow-y: auto; margin-top: 10px; border: 1px solid var(--border); border-radius: 6px;">`;
      html += `<table style="width:100%; text-align:left; border-collapse: collapse; font-size: 14px;">`;
      html += `<tr><th style="border-bottom:1px solid var(--border); padding:8px; background:var(--bg-card); position: sticky; top: 0;">Predicted Class</th><th style="border-bottom:1px solid var(--border); padding:8px; text-align:right; background:var(--bg-card); position: sticky; top: 0;">Count</th></tr>`;
      
      for (const [cls, count] of Object.entries(data.batch_counts)) {
        html += `<tr><td style="padding:8px; border-bottom:1px solid #333;">${cls}</td><td style="padding:8px; text-align:right; border-bottom:1px solid #333; font-weight:bold; color:var(--text-primary);">${count}</td></tr>`;
      }
      
      html += `</table></div>`;
    }
    
    binaryProbGrid.innerHTML = html;
  } else if (inputType === 'image') {
    probSectionTitle.textContent = "Softmax Distribution — CNN Top-5 Traffic Signs + BNN Pothole";
    buildCNNTop5(data.cnn);
    buildBinaryBars(data.bnn.class_probs, bnnBinaryGrid);
    dualResultWrap.classList.remove("hidden");
    binaryResultWrap.classList.add("hidden");
  } else if (inputType === 'audio') {
    probSectionTitle.textContent = "Softmax Distribution — Siren vs Non-Siren";
    buildBinaryBars(data.class_probs, binaryProbGrid);
    dualResultWrap.classList.add("hidden");
    binaryResultWrap.classList.remove("hidden");
  } else if (inputType === 'csv') {
    probSectionTitle.textContent = "Decision Score — Lane Keep vs Lane Change";
    buildBinaryBars(data.class_probs, binaryProbGrid);
    dualResultWrap.classList.add("hidden");
    binaryResultWrap.classList.remove("hidden");
  }

  probSection.classList.remove("hidden");
  probSection.classList.add("fade-in");

  // Animate bars after paint
  requestAnimationFrame(() => {
    requestAnimationFrame(() => animateBars());
  });

  resetBtn();
});

// ── Build CNN top-5 probability items ────────────────────────────────────────
function buildCNNTop5(cnn) {
  if (!cnn || !cnn.top5_indices) return;
  cnnTop5Grid.innerHTML = "";
  const topIdx = cnn.top5_indices[0];

  cnn.top5_indices.forEach((idx, rank) => {
    const name = cnn.top5_names[rank];
    const pct  = cnn.top5_probs[rank];
    const isTop = rank === 0;

    const item = document.createElement("div");
    item.className = "prob-item" + (isTop ? " top-pred" : "");

    const shortName = name.length > 16 ? name.substring(0, 15) + '…' : name;
    item.innerHTML = `
      <div class="prob-name" title="${name}">${shortName}</div>
      <div class="prob-bar-wrap">
        <div class="prob-bar-bg">
          <div class="prob-bar-fill" id="cnn-bar-${rank}" style="height:0%"></div>
        </div>
      </div>
      <div class="prob-pct">${pct.toFixed(1)}%</div>
      <div class="prob-label">#${rank + 1}</div>
    `;
    cnnTop5Grid.appendChild(item);

    // Store target height for animation
    item.querySelector(`#cnn-bar-${rank}`).dataset.target = Math.max(pct, 0.5);
  });
}

// ── Build binary (2-class) probability items ─────────────────────────────────
function buildBinaryBars(classProbs, container) {
  if (!classProbs || classProbs.length < 2) return;
  container.innerHTML = "";

  const topIdx = classProbs[0].prob >= classProbs[1].prob ? 0 : 1;

  classProbs.forEach((cls, i) => {
    const isTop = (i === topIdx);
    const item  = document.createElement("div");
    item.className = "binary-prob-item" + (isTop ? " top-pred" : "");

    item.innerHTML = `
      <div class="prob-name" style="font-size:13px;font-weight:700;min-height:auto;margin-bottom:10px;" title="${cls.label}">${cls.label}</div>
      <div class="prob-bar-wrap">
        <div class="prob-bar-bg">
          <div class="prob-bar-fill" id="bin-bar-${i}" style="height:0%"></div>
        </div>
      </div>
      <div class="prob-pct">${cls.prob.toFixed(2)}%</div>
    `;
    container.appendChild(item);
    item.querySelector(`#bin-bar-${i}`).dataset.target = Math.max(cls.prob, 0.5);
  });
}

// ── Animate all bars with stored target heights ───────────────────────────────
function animateBars() {
  document.querySelectorAll('.prob-bar-fill').forEach(bar => {
    if (bar.dataset.target !== undefined) {
      bar.style.height = bar.dataset.target + "%";
    }
  });
}

// ── Build model badge HTML ────────────────────────────────────────────────────
function buildModelBadge(data) {
  const type = data.input_type;
  if (type === 'image') {
    return `<span class="model-badge cnn">CNN + BNN</span>`;
  } else if (type === 'audio') {
    return `<span class="model-badge audio">Audio MLP</span>`;
  } else if (type === 'csv') {
    return `<span class="model-badge svm">SVM</span>`;
  }
  return '';
}

// ── Abbreviate a string to max N chars ───────────────────────────────────────
function abbreviate(str, maxLen) {
  if (!str) return '?';
  return str.length > maxLen ? str.substring(0, maxLen - 1) + '…' : str;
}

// ── Reset button ──────────────────────────────────────────────────────────────
function resetBtn() {
  inferBtn.disabled = false;
  btnText.textContent = "Run Again";
  btnSpinner.classList.add("hidden");
}

// ── Show error ────────────────────────────────────────────────────────────────
function showError(msg) {
  modelBadgeWrap.innerHTML = '';
  predDigit.textContent   = "✗";
  predDigit.style.fontSize = "36px";
  confValue.textContent   = "Error";
  predLabelText.classList.add("hidden");
  aiVisionBlock.classList.add("hidden");
  resultWaiting.classList.add("hidden");
  resultContent.classList.remove("hidden");
  console.error("Inference error:", msg);
  alert(`Inference failed:\n${msg}`);
}
