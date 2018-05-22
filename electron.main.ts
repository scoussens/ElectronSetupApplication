import { app, BrowserWindow, ipcMain } from 'electron';
import * as path from 'path';
import * as url from 'url';
import { NodePowerShellService } from './electron/nps.service';

let mainWindow: BrowserWindow = null;
app.setName('Control Center Setup');

const createWindow = () => {
    mainWindow = new BrowserWindow({
        width: 800,
        height: 600,
        autoHideMenuBar: true,
        useContentSize: true,
        resizable: false,
        maximizable: false,
        show: true,
        title: `${app.getName()} v0.0.0`
    });

    // Tell Electron where to load the entry point from
    mainWindow.loadURL(url.format({
        pathname: path.join(__dirname, 'dist/index.html'),
        protocol: 'file:',
        slashes: true
    }));

    // Open the DevTools.
    mainWindow.webContents.openDevTools();

    let powershell = new NodePowerShellService(ipcMain);

    mainWindow.on('closed', () => {
        mainWindow = null;
        console.log("Main windows closed, application quit.");
    })
}

app.on('ready', () => {
    if (mainWindow === null) {
        createWindow();
    }
})