const path = require('path');
const publicPath = path.resolve(__dirname, '..', '..', 'public');

const { FuseBox, CSSPlugin, BabelPlugin } = require('fuse-box');
const fuse = FuseBox.init({
  homeDir : 'frontsrc',
  target  : 'browser@es6',
  output  : `${publicPath}/$name.js`,
  useTypescriptCompiler: true,
  plugins : [
    BabelPlugin({
      presets : ['es2015'],
      plugins : [
        ['transform-react-jsx']
      ]
    }),
    CSSPlugin()
  ],
  shim : {
  }
});
fuse.bundle('app').instructions('> index.jsx').watch('frontsrc/**');
fuse.run();
