module.exports = {
  plugins: {
    'postcss-prefixer': { prefix: 'nhsuk_' },
    'autoprefixer' : { grid: true },
    'cssnano': { preset: 'default' }
  }
}
