import { Injectable } from '@angular/core';
import { IpcRenderer } from 'electron';
import { ElectronService } from 'ngx-electron';
import * as uuidv4 from 'uuid/v4';
import { NpsScript } from './powershell.models';

interface PsResult {
  script: string
  result: any
}

interface PsCommand {
  command: string
  args: any[]
}

@Injectable()
export class PowershellService {
  private _ipc: IpcRenderer | undefined;

  constructor(private _electronService: ElectronService) {
    this._ipc = this._electronService.ipcRenderer;
  }

  invoke(command: string, ...args) {
    const uuid = uuidv4();

    console.log(uuid, command, args);
    this._ipc.send('powershell-invoke', { uuid, command, args });
    return new Promise<PsResult>((resolve, reject) => {
      this._ipc.once(`powershell-invoke-success-${uuid}`, (event, result) => resolve(result));
      this._ipc.once(`powershell-invoke-error-${uuid}`, (event, result) => reject(result));
    })
  }

  listScripts() {
    this._ipc.send('powershell-get-scripts');
    return new Promise<NpsScript[]>((resolve, reject) => {
      this._ipc.once('powershell-get-scripts', (event, result) => resolve(result));
    })
  }
}
