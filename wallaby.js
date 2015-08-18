module.exports = function (wallaby) {
  process.env.NODE_PATH = require('path').join(wallaby.localProjectDir, 'node_modules');
  //console.log(wallaby)
  console.log('[in Wallaby]');
  return {
    files: [
      'src/**/*.coffee',
      'src/**/*.litcoffee',
    ],

    tests: [
      'test/**/*.coffee',
    ],

    env: {
      type: 'node',
    }
  };
};