module.exports = {
    publicPath: process.env.NODE_ENV === 'production'
      ? '/onesignal/'
      : '/',
      outputDir: 'docs'
  }