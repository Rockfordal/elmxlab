import { join } from 'path';

var CleanWebpackPlugin = require('clean-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');
// import CleanPlugin from 'clean-webpack-plugin';

const preLoaders = [
    {
        test: /\.elm$/,
        loader: 'elmx-webpack-preloader',
        include: [join(__dirname, "src/elm")],
        query: {
            sourceDirectories: [join(__dirname, "src/elm")],
            outputDirectory: '.tmp/elm'
        }
    },
]


const loaders = [
        {
          test: /\.html$/,
          exclude: /node_modules/,
          loader: 'file?name=[name].[ext]'
        },
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          loader: 'elm-hot!elm-webpack'
        }
    // {
    //     test: /\.elm$/,
    //     loader: 'elm-webpack',
    //     include: [join(__dirname, "src/elm"), join(__dirname, ".tmp/elm")]
    // },
    // {
    //     test: /\.jsx?$/,
    //     loader: 'babel-loader',
    //     include: [join(__dirname, "src/js")],
    //     query: {
    //         cacheDirectory: true
    //     }
    // },
    // { test: /\.css$/, loader: ExtractTextPlugin.extract("style", "css") },
    // {
    //     test: /\.s[ac]ss$/,
    //     loader: ExtractTextPlugin.extract(
    //         "style",
    //         "css?sourceMap!sass?sourceMap"
    //     )
    // },
    // { test: /\.(jpe?g|png|gif|svg)$/, loader: "file" }
];

module.exports = {
  entry: './src/index.js',

  output: {
    path: './dist',
    filename: 'index.js'
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm']
  },


  // module: {
  //   loaders: [
  //     {
  //       test: /\.html$/,
  //       exclude: /node_modules/,
  //       loader: 'file?name=[name].[ext]'
  //     },
  //     {
  //       test: /\.elm$/,
  //       exclude: [/elm-stuff/, /node_modules/],
  //       loader: 'elm-hot!elm-webpack'
  //     }
  //   ],

  //   noParse: /\.elm$/
  // },

    // module: { preLoaders, loaders, noParse: /\.elmx?$/ },
    module: { loaders, noParse: /\.elmx?$/ },

  plugins: [
    new CleanWebpackPlugin(['dist'], {
      root: __dirname,
      verbose: true,
      dry: false
    }),
    new CopyWebpackPlugin([
      { from: 'src/assets', to: 'assets'}
    ])
  ],

  devServer: {
    stats: 'errors-only',
    historyApiFallback: true,
    publicPath: '/'
  }
};
