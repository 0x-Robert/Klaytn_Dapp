//import fs from "fs"
const webpack = require('webpack')
const path = require('path')
const fs = require('fs')
const CopyWebpackPlugin = require("copy-webpack-plugin");


module.exports = {
  entry: "./src/index.js",
  mode: 'development',
  //"fs" resolve error 발견 후 아래 내용을 추가하고 에러 해결했음
  node: {
    fs: "empty"
  },
  output: {
    filename: "index.js",
    path: path.resolve(__dirname, 'dist') 

  },
  //  devtool: 'source-map ./src', 콘솔에 source-map 에러가 있어서 하단에 추가했음
  devtool: 'source-map ./node_modules',
  plugins: [   
    new webpack.DefinePlugin({
      DEPLOYED_ADDRESS: JSON.stringify(fs.readFileSync('deployedAddress', 'utf8').replace(/\n|\r/g, "")),
      DEPLOYED_ABI: fs.existsSync('deployedABI') && fs.readFileSync('deployedABI', 'utf8'),
    }),
    new CopyWebpackPlugin([{ from: "./src/index.html", to: "index.html"}])
  ],
  devServer: { contentBase: path.join(__dirname, "dist"), compress: true }
  
}
