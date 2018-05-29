import { IpcMain, IpcMessageEvent } from 'electron';
import * as PowerShell from 'node-powershell';
import { Scripts } from './nps.scripts';

export class NodePowerShellService {
    private _ipc: IpcMain;
    private shellOptions = {
        executionPolicy: 'Bypass',
        noProfile: true,
        debugMsg: false
    };

    constructor(private ipcMain: IpcMain) {
        this._ipc = ipcMain;
        this._ipc.on('powershell-get-scripts', (event: IpcMessageEvent) => {
            const scripts = this.listScripts();
            event.sender.send('powershell-get-scripts', scripts);
        });
        this._ipc.on('powershell-invoke-console', this.invokeStream);
        this._ipc.on('powershell-invoke-json', this.invokeJson);
    }

    listScripts() {
        return Scripts;
    }

    invokeStream(ipcMessage: IpcMessageEvent, request: any) {
        if (request.commandType === 1) {
            request.command = `./scripts/${request.command}`;
        }

        console.log(`Invoking command: `, request.command, 'with args:', request.args);
        try {
            let shell = new PowerShell(this.shellOptions);
            shell.addCommand(request.command, request.args);
            shell.streams.stdout.on('data', data => {
                ipcMessage
                    .sender
                    .send(`powershell-invoke-message-${request.uuid}`, {
                        result: 'message',
                        output: data
                    });
            });
            shell.invoke()
                .then(res => {
                    console.log(res);
                    ipcMessage
                        .sender
                        .send(`powershell-invoke-success-${request.uuid}`, {
                            message: 'success',
                            output: res
                        });
                    shell.dispose();
                })
                .catch(err => {
                    console.log(err);
                    ipcMessage
                        .sender
                        .send(`powershell-invoke-error-${request.uuid}`, {
                            message: 'error',
                            output: err
                        });
                    shell.dispose();
                });

        } catch (err) {
            console.log(err);
            ipcMessage
                .sender
                .send(`powershell-invoke-error-${request.uuid}`, {
                    message: 'error',
                    output: err
                });
        }
    }

    invokeJson(ipcMessage: IpcMessageEvent, request: any) {
        if (request.commandType === 1) {
            request.command = `./scripts/${request.command}`;
        }

        console.log(`Invoking command: `, request.command, 'with args:', request.args);
        try {
            let shell = new PowerShell(this.shellOptions);
            shell.addCommand(request.command, request.args);
            shell.invoke()
                .then(res => {
                    console.log(res);
                    ipcMessage
                        .sender
                        .send(`powershell-invoke-success-${request.uuid}`, JSON.parse(res));
                    shell.dispose();
                })
                .catch(err => {
                    console.log(err);
                    ipcMessage
                        .sender
                        .send(`powershell-invoke-error-${request.uuid}`, JSON.parse(err));
                    shell.dispose();
                });

        } catch (err) {
            console.log(err);
            ipcMessage
                .sender
                .send(`powershell-invoke-error-${request.uuid}`, {
                    message: 'error',
                    output: err
                });
        }

    }
}