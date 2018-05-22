import { IpcMain, IpcMessageEvent } from 'electron';
import * as PowerShell from 'node-powershell';
import { Scripts } from './nps.scripts';

export class NodePowerShellService {
    private _ipc: IpcMain;

    constructor(private ipcMain: IpcMain) {
        this._ipc = ipcMain;
        this._ipc.on('powershell-get-scripts', (event: IpcMessageEvent) => {
            const scripts = this.listScripts();
            event.sender.send('powershell-get-scripts', scripts);
        });
        this._ipc.on('powershell-invoke', async (event: IpcMessageEvent, request: any) => {
            try {
                const result = await this.invoke(request.command);
                event.sender.send(
                    `powershell-invoke-success-${request.uuid}`, result);
            } catch (error) {
                event.sender.send(
                    `powershell-invoke-error-${request.uuid}`, error);
            }
        });
    }

    private getShell() {
        return new PowerShell({
            executionPolicy: 'Bypass',
            noProfile: true,
            debugMsg: true
        }); 
    }

    listScripts() {
        return Scripts;
    }

    invoke(script: string, ...args) {
        const shell = this.getShell();
        shell.addCommand(script);
        return shell.invoke()
            .then(res => {
                shell.dispose();
                return JSON.parse(res);
            })
            .catch(err => {
                shell.dispose();
                throw new Error(err);
            });
    }
}