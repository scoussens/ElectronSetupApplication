import { Injectable, NgZone } from '@angular/core';
import { IpcRenderer } from 'electron';
import { ElectronService } from 'ngx-electron';
import { Observable } from 'rxjs';
import * as uuidv4 from 'uuid/v4';
import { NpsScript, PsCommandType, PsResult } from './powershell.models';

@Injectable()
export class PowershellService {
  private _ipc: IpcRenderer | undefined;
  private _ngZone: NgZone | undefined;

  constructor(private electronService: ElectronService, private ngZone: NgZone) {
    this._ngZone = this.ngZone
    this._ipc = this.electronService.ipcRenderer;
  }

  stream<T>(commandType: PsCommandType, command: string, args: any[]) {
    return new Observable<PsResult<T>>((observer) => {
      let uuid = uuidv4();
      let ipc = this._ipc;

      console.log(uuid, commandType, command, args);
      ipc.send('powershell-invoke-console', { uuid, commandType, command, args });

      ipc.on(`powershell-invoke-message-${uuid}`, (event, res: PsResult<T>) => {
        this._ngZone.run(() => observer.next(res));
      });

      ipc.on(`powershell-invoke-success-${uuid}`, (event, res: PsResult<T>) => {
        this._ngZone.run(() => observer.complete());
      });

      ipc.on(`powershell-invoke-error-${uuid}`, (event, err: PsResult<T>) => {
        this._ngZone.run(() => observer.error(err));
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

  invoke<T>(commandType: PsCommandType, command: string, args: any[]) {
    return new Observable<PsResult<T>>((observer) => {
      let uuid = uuidv4();
      let ipc = this._ipc;

      console.log(uuid, commandType, command, args);
      ipc.send('powershell-invoke-json', { uuid, commandType, command, args });

      ipc.on(`powershell-invoke-success-${uuid}`, (event, res: PsResult<T>) => {
        console.log(res);
        this._ngZone.run(() => {
          observer.next(res);
          observer.complete();
        })
      });

      ipc.on(`powershell-invoke-error-${uuid}`, (event, err: PsResult<T>) => {
        this._ngZone.run(() => observer.error(err));
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
    this._ipc.send('powershell-get-scripts');
    return new Promise<NpsScript[]>((resolve, reject) => {
      this._ipc.once('powershell-get-scripts', (event, result) => resolve(event));
    })
  }
}
