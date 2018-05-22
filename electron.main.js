"use strict";
exports.__esModule = true;
var electron_1 = require("electron");
var path = require("path");
var url = require("url");
var nps_service_1 = require("./electron/nps.service");
var mainWindow = null;
electron_1.app.setName('Control Center Setup');
var createWindow = function () {
    mainWindow = new electron_1.BrowserWindow({
        width: 800,
        height: 600,
        autoHideMenuBar: true,
        useContentSize: true,
        resizable: false,
        maximizable: false,
        show: true,
        title: electron_1.app.getName() + " v0.0.0"
    });
    // Tell Electron where to load the entry point from
    mainWindow.loadURL(url.format({
        pathname: path.join(__dirname, 'dist/index.html'),
        protocol: 'file:',
        slashes: true
    }));
    // Open the DevTools.
    mainWindow.webContents.openDevTools();
    var powershell = new nps_service_1.NodePowerShellService(electron_1.ipcMain);
    mainWindow.on('closed', function () {
        mainWindow = null;
        console.log("Main windows closed, application quit.");
    });
};
electron_1.app.on('ready', function () {
    if (mainWindow === null) {
        createWindow();
    }
});
