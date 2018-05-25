export interface NpsScript {
    name: string
    path: string
}

export interface PsResult {
    message: string
    output: any
}

export enum PsCommandType {
    Command = 0,
    Script
}