"use strict";
exports.__esModule = true;
var PowerShell = require("node-powershell");
var nps_scripts_1 = require("./nps.scripts");
var NodePowerShellService = /** @class */ (function () {
    function NodePowerShellService(ipcMain) {
        var _this = this;
        this.ipcMain = ipcMain;
        this.shellOptions = {
            executionPolicy: 'Bypass',
            noProfile: true,
            debugMsg: false
        };
        this._ipc = ipcMain;
        this._ipc.on('powershell-get-scripts', function (event) {
            var scripts = _this.listScripts();
            event.sender.send('powershell-get-scripts', scripts);
        });
        this._ipc.on('powershell-invoke-console', this.invokeStream);
        this._ipc.on('powershell-invoke-json', this.invokeJson);
    }
    NodePowerShellService.prototype.listScripts = function () {
        return nps_scripts_1.Scripts;
    };
    NodePowerShellService.prototype.invokeStream = function (ipcMessage, request) {
        if (request.commandType === 1) {
            request.command = "./scripts/" + request.command;
        }
        console.log("Invoking command: ", request.command, 'with args:', request.args);
        try {
            var shell_1 = new PowerShell(this.shellOptions);
            shell_1.addCommand(request.command, request.args);
            shell_1.streams.stdout.on('data', function (data) {
                ipcMessage
                    .sender
                    .send("powershell-invoke-message-" + request.uuid, {
                    result: 'message',
                    output: data
                });
            });
            shell_1.invoke()
                .then(function (res) {
                console.log(res);
                ipcMessage
                    .sender
                    .send("powershell-invoke-success-" + request.uuid, {
                    message: 'success',
                    output: res
                });
                shell_1.dispose();
            })["catch"](function (err) {
                console.log(err);
                ipcMessage
                    .sender
                    .send("powershell-invoke-error-" + request.uuid, {
                    message: 'error',
                    output: err
                });
                shell_1.dispose();
            });
        }
        catch (err) {
            console.log(err);
            ipcMessage
                .sender
                .send("powershell-invoke-error-" + request.uuid, {
                message: 'error',
                output: err
            });
        }
    };
    NodePowerShellService.prototype.invokeJson = function (ipcMessage, request) {
        if (request.commandType === 1) {
            request.command = "./scripts/" + request.command;
        }
        console.log("Invoking command: ", request.command, 'with args:', request.args);
        try {
            var shell_2 = new PowerShell(this.shellOptions);
            shell_2.addCommand(request.command, request.args);
            shell_2.invoke()
                .then(function (res) {
                console.log(res);
                ipcMessage
                    .sender
                    .send("powershell-invoke-success-" + request.uuid, JSON.parse(res));
                shell_2.dispose();
            })["catch"](function (err) {
                console.log(err);
                ipcMessage
                    .sender
                    .send("powershell-invoke-error-" + request.uuid, JSON.parse(err));
                shell_2.dispose();
            });
        }
        catch (err) {
            console.log(err);
            ipcMessage
                .sender
                .send("powershell-invoke-error-" + request.uuid, {
                message: 'error',
                output: err
            });
        }
    };
    return NodePowerShellService;
}());
exports.NodePowerShellService = NodePowerShellService;
