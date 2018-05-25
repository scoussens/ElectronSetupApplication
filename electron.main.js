"use strict";
exports.__esModule = true;
var electron_1 = require("electron");
var path = require("path");
var url = require("url");
var nps_service_1 = require("./electron/nps.service");
var client = require('electron-connect').client;
var win = null;
var serve = process.argv.slice(1).some(function (val) { return val === '--serve'; });
electron_1.app.setName('Control Center Setup');
var createWindow = function () {
    win = new electron_1.BrowserWindow({
        width: 800,
        height: 600,
        autoHideMenuBar: true,
        useContentSize: true,
        resizable: false,
        maximizable: false,
        show: true,
        title: electron_1.app.getName() + " v0.0.0"
    });
    if (serve) {
        require('electron-reload')(__dirname, {});
        win.loadURL('http://localhost:4200');
    }
    else {
        // Tell Electron where to load the entry point from
        win.loadURL(url.format({
            pathname: path.join(__dirname, 'dist/index.html'),
            protocol: 'file:',
            slashes: true
        }));
    }
    // Open the DevTools.
    win.webContents.openDevTools();
    var powershell = new nps_service_1.NodePowerShellService(electron_1.ipcMain);
    win.on('closed', function () {
        win = null;
        console.log("Main windows closed, application quit.");
    });
};
electron_1.app.on('ready', function () {
    if (win === null) {
        createWindow();
        client.create(win);
    }
});
