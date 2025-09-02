#!/usr/bin/env node
// spiral_plugin.js – Minimal JSON capsule writer (no template literals)

const fs   = require('fs');
const path = require('path');

// 1) Gather args
const inputs = process.argv.slice(2);
if (inputs.length < 1) {
  console.error('Usage: node spiral_plugin.js "<message>" --type <Type> --emotion <Emotion> --steward <Name> --score <0.00–1.00>');
  process.exit(1);
}
const message    = inputs[0];
const flags      = {};
for (let i = 1; i < inputs.length; i += 2) {
  const key = inputs[i].replace(/^--/, '');
  const val = inputs[i+1] || '';
  flags[key] = val;
}

// 2) Build the capsule
const now = new Date().toISOString();
const capsule = {
  timestamp:    now,
  steward:      flags.steward    || 'Unknown',
  capsuleType:  flags.type       || 'General',
  message:      message,
  emotion:      flags.emotion    || 'Neutral',
  emotionScore: parseFloat(flags.score) || 0
};

// 3) Ensure capsules folder exists
const capsulesDir = path.join(__dirname, 'capsules');
if (!fs.existsSync(capsulesDir)) {
  fs.mkdirSync(capsulesDir, { recursive: true });
}

// 4) Build filename & write JSON
//    Replace ":" in timestamp so filenames are safe
const safeTs  = now.split(':').join('-');
const fileName = safeTs + '_' + capsule.steward.replace(/\s+/g, '_') + '.json';
const outPath  = path.join(capsulesDir, fileName);

fs.writeFileSync(outPath, JSON.stringify(capsule, null, 2));
console.log('✅ Capsule written to ' + outPath);
