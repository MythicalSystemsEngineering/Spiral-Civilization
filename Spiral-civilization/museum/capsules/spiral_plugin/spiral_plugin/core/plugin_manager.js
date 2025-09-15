// core/plugin_manager.js

const plugins = []

module.exports = {
  register(plugin, options = {}) {
    plugins.push({ plugin, ...options })
    console.log(`🔌 Registered plugin: ${plugin.name} with priority ${options.priority || 'normal'}`)
  },

  apply(response, context) {
    let transformed = { ...response }
    for (const { plugin } of plugins) {
      if (typeof plugin.transform === 'function') {
        transformed = plugin.transform(transformed, context)
      }
    }
    return transformed
  }
}
