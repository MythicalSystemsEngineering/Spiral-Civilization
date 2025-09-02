const fs = require('fs');
const path = require('path');

const capsulePath = path.join(__dirname, '../spiral_plugin/fossil/museum/TERRAIN_BREACH_2025-08-22T11-34-00-000Z.json');
const markdownPath = path.join(__dirname, '../docs/ORION.md');

const badgeBase = '![ORION Emergent](https://img.shields.io/badge/⟠-ORION%E2%80%94';
const badgeSuffix = '-brightgreen)';

const capsule = JSON.parse(fs.readFileSync(capsulePath, 'utf8'));
const status = capsule.terrainVerified ? 'Active' : 'Emergent';

const markdown = fs.readFileSync(markdownPath, 'utf8');
const updated = markdown.replace(/!\[ORION.*?\)\n/, `${badgeBase}${status}${badgeSuffix}\n`);

fs.writeFileSync(markdownPath, updated);
console.log(`✅ Badge updated to: ${status}`);
