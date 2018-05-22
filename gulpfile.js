'use strict';

var gulp = require('gulp');
var electron = require('electron-connect').server.create();

gulp.task('default', function () {

// Start browser process
 electron.start();

// Restart browser process
 gulp.watch(['electron.main.js', 'electron/**/*'], electron.restart);

// Reload renderer process
 gulp.watch(['dist/index.html'], electron.reload);
});