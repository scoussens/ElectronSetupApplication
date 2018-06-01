export interface NpsScript {
    name: string
    path: string
}

export interface PsResult<T> {
    message: string
    output: T
}

export interface PsParameter {
    [key: string]: string | number | boolean | Date | null
}

export enum PsCommandType {
    Command = 0,
    Script
}