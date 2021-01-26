// https://github.com/rails/webpacker/blob/749675d9c035dbc8777f718582e3e4804147e9e5/docs/webpack.md#plugins

const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
