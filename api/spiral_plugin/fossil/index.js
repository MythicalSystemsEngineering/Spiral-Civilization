// spiral_plugin/fossil/index.js

const fs = require('fs')
const path = require('path')
const crypto = require('crypto')

function fossilize(event, payload) {
  const timestamp = new Date().toISOString()
  const entry = {
    event,
    payload,
    timestamp
  }

  const data = JSON.stringify(entry, null, 2)
  const hash = crypto.createHash('sha256').update(data).digest('hex')

  const filename = `${event}_${timestamp.replace(/[:.]/g, '-')}.json`
  const filepath = path.join(__dirname, 'museum', filename)

  fs.mkdirSync(path.dirname(filepath), { recursive: true })
  fs.writeFileSync(filepath, data)

  fs.writeFileSync(`${filepath}.hash`, hash)

  console.log(`🪨 Fossilized breach: ${filename}`)
}

module.exports = { fossilize }
