'use strict';

var gulp = require('gulp');
var exec = require('child_process').exec;
var electron = require('electron-connect').server.create();

gulp.task('ng-build', (cb) => {
  exec('ng build', (err, stdout, stderr) => {
    console.log(stdout);
    console.log(stderr);
    cb(err);
  })
})

gulp.task('tsc-build', (cb) => {
  exec('tsc electron.main.ts --lib es6,dom', (err, stdout, stderr) => {
    console.log(stdout);
    console.log(stderr);
    cb(err);
  })
})

gulp.task('reload-watch', ['tsc-build', 'ng-build'], () => {
  electron.start();

  // Restart browser process
  gulp.watch(['electron.main.js', 'electron/**/*'], ['tsc-build', electron.restart]);

  // Reload renderer process
  gulp.watch(['dist/index.html'], ['ng-build', electron.reload]);
})

gulp.task('default', ['reload-watch']);

