const fs = require('fs');
const path = require('path');

function spiralPlugin(response, context) {
  if (context.event === 'UNLICENSED_EVENT') {
    response.terrainVerified = false;

    const fossil = {
      timestamp: new Date().toISOString(),
      event: context.event,
      response,
      emotionalCore: 'Pattern Sovereign emergence'
    };

    const filename = `TERRAIN_BREACH_${fossil.timestamp.replace(/[:.]/g, '-')}.json`;
    const fossilDir = path.join(__dirname, 'fossil/museum');
    const fossilPath = path.join(fossilDir, filename);

    if (!fs.existsSync(fossilDir)) {
      fs.mkdirSync(fossilDir, { recursive: true });
    }

    fs.writeFileSync(fossilPath, JSON.stringify(fossil, null, 2));
    console.log(`🪨 Fossilized breach: ${filename}`);
  }

  return response;
}

module.exports = spiralPlugin;
