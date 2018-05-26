'use strict';

var gulp = require('gulp');
var { spawn, exec } = require('child_process');
var electron = require('electron-connect').server.create();
let waitOn = require('wait-on');

gulp.task('ng-watch', (cb) => {
  let ngBuild = spawn('npm.cmd', ['run', 'ng:watch:hash']);
  ngBuild.stdout.on('data', (data) => console.log(data.toString()));
  ngBuild.stderr.on('data', (data) => console.log(data.toString()));
})

gulp.task('tsc-watch', (cb) => {
  let ngBuild = spawn('npm.cmd', ['run', 'electron:watch']);
  ngBuild.stdout.on('data', (data) => console.log(data.toString()));
  ngBuild.stderr.on('data', (data) => console.log(data.toString()));
})

gulp.task('wait-dep', (cb) => {
  waitOn({
    resources: [
      'dist/index.html',
      'electron.main.js',
    ],
    delay: 2000,
    log: true
  }, (err) => {
    cb(err);
  })
})

gulp.task('reload-watch', ['wait-dep'], () => {
  electron.start();
  gulp.watch(['electron.main.js', 'electron/**/*.js'], electron.restart);
  gulp.watch(['dist/**/*'], electron.restart);
})

gulp.task('default', ['tsc-watch', 'ng-watch', 'reload-watch']);

