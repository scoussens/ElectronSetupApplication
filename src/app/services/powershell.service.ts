import { Injectable, NgZone } from '@angular/core';
import { IpcRenderer } from 'electron';
import { ElectronService } from 'ngx-electron';
import { Observable } from 'rxjs';
import * as uuidv4 from 'uuid/v4';
import { NpsScript, PsCommandType, PsResult } from './powershell.models';

@Injectable()
export class PowershellService {

  constructor(private _electronService: ElectronService, private zone: NgZone) {
  }

  stream(commandType: PsCommandType, command: string, args: any[]) {
    return new Observable<PsResult>((observer) => {
      let uuid = uuidv4();
      let ipc = this._electronService.ipcRenderer;

      console.log(uuid, commandType, command, args);
      ipc.send('powershell-invoke-console', { uuid, commandType, command, args });

      ipc.on(`powershell-invoke-message-${uuid}`, (event, res: PsResult) => {
        this.zone.run(() => observer.next(res));
      });

      ipc.on(`powershell-invoke-success-${uuid}`, (event, res: PsResult) => {
        this.zone.run(() => observer.complete());
      });

      ipc.on(`powershell-invoke-error-${uuid}`, (event, err: PsResult) => {
        this.zone.run(() => observer.error(err));
      });

      return {
        unsubscribe() {
          ipc.removeAllListeners(`powershell-invoke-message-${uuid}`);
          ipc.removeAllListeners(`powershell-invoke-success-${uuid}`);
          ipc.removeAllListeners(`powershell-invoke-error-${uuid}`);
        }
      };
    })
  }

  invoke(commandType: PsCommandType, command: string, args: any[]) {
    return new Observable<PsResult>((observer) => {
      let uuid = uuidv4();
      let ipc = this._electronService.ipcRenderer;

      console.log(uuid, commandType, command, args);
      ipc.send('powershell-invoke-json', { uuid, commandType, command, args });

      ipc.on(`powershell-invoke-success-${uuid}`, (event, res: PsResult) => {
        console.log(res);
        this.zone.run(() => {
          observer.next(res);
          observer.complete();
        })
      });

      ipc.on(`powershell-invoke-error-${uuid}`, (event, err: PsResult) => {
        this.zone.run(() => observer.error(err));
      });

      return {
        unsubscribe() {
          ipc.removeAllListeners(`powershell-invoke-success-${uuid}`);
          ipc.removeAllListeners(`powershell-invoke-error-${uuid}`);
        }
      };
    })
  }

  listScripts() {
    this._electronService.ipcRenderer.send('powershell-get-scripts');
    return new Promise<NpsScript[]>((resolve, reject) => {
      this._electronService.ipcRenderer.once('powershell-get-scripts', (event, result) => resolve(event));
    })
  }
}
