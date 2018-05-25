'use strict';

var gulp = require('gulp');
var { spawn, exec } = require('child_process');
var electron = require('electron-connect').server.create();
let waitOn = require('wait-on');

gulp.task('ng-build', (cb) => {
  let ngBuild = spawn('npm.cmd', ['run', 'ng:build']);
  ngBuild.stdout.on('data', (data) => console.log(data.toString()));
  ngBuild.stderr.on('data', (data) => console.log(data.toString()));

  waitOn({
    resources: [
      'dist/index.html'
    ],
    delay: 15000,
    log: true
  }, (err) => {
    cb(err);
  })
})

gulp.task('tsc-build', (cb) => {
  exec('tsc electron.main.ts --lib es6,dom', (err, stdout, stderr) => {
    cb(err);
  })
})

gulp.task('reload-watch', ['tsc-build', 'ng-build'], () => {
  electron.start();

  // Restart browser process
  gulp.watch(['electron.main.js', 'electron/**/*'], ['tsc-build', electron.restart]);

  // Reload renderer process
  gulp.watch(['src/**/*'], ['ng-build', electron.restart]);
})

gulp.task('default', ['reload-watch']);

