import { app, BrowserWindow, ipcMain } from 'electron';
import * as path from 'path';
import * as url from 'url';
import { NodePowerShellService } from './electron/nps.service';
const client = require('electron-connect').client;

let win: BrowserWindow = null;
let serve = process.argv.slice(1).some(val => val === '--serve');
app.setName('Control Center Setup');

const createWindow = () => {
    win = new BrowserWindow({
        width: 800,
        height: 600,
        autoHideMenuBar: true,
        useContentSize: true,
        resizable: false,
        maximizable: false,
        show: true,
        title: `${app.getName()} v0.0.0`
    });

    if (serve) {
        require('electron-reload')(__dirname, {});
        win.loadURL('http://localhost:4200');
    } else {
        // Tell Electron where to load the entry point from
        win.loadURL(url.format({
            pathname: path.join(__dirname, 'dist/index.html'),
            protocol: 'file:',
            slashes: true
        }));
    }

    // Open the DevTools.
    win.webContents.openDevTools();

    let powershell = new NodePowerShellService(ipcMain);

    win.on('closed', () => {
        win = null;
        console.log("Main windows closed, application quit.");
    })
}

app.on('ready', () => {
    if (win === null) {
        createWindow();
        client.create(win);
    }
})