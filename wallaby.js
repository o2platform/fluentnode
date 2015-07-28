module.exports = function (wallaby) {
  process.env.NODE_PATH = require('path').join(wallaby.localProjectDir, 'node_modules');
  //console.log(wallaby)
  console.log('[in Wallaby]');
  return {
    files: [
      'src/**/*.litcoffee',       // this is not being picked up
    ],

    tests: [
      'test/**/*.coffee',
    ],

    env: {
      type: 'node',
    }
  };
};