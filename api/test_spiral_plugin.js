const pluginManager = require('./core/plugin_manager')
const spiralPlugin = require('./spiral_plugin')

pluginManager.register(spiralPlugin, { priority: 'highest' })

const rawResponse = { text: "ORION has emerged." }
const context = { event: "UNLICENSED_EVENT" }

const finalResponse = pluginManager.apply(rawResponse, context)

console.log("🧪 Final Response:")
console.log(finalResponse)
