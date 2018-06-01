export interface NpsScript {
    name: string
    path: string
}

export interface PsResult<T> {
    message: string
    output: T
}

export enum PsCommandType {
    Command = 0,
    Script
}