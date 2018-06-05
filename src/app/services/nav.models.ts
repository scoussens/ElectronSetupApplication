export class NavLink {
    name: string
    text: string
    route: string
    enabled: {
        top: boolean
        bottom: boolean
    }

    constructor(name: string, route: string, topEnabled: boolean, text?: string, bottomEnabled?: boolean) {
        this.name = name;
        this.route = route;
        this.enabled = {
            top: topEnabled,
            bottom: bottomEnabled || false
        };
        this.text = text || null;
    }
}

export interface NavBottomLinkState {
    prev: NavLink | undefined
    next: NavLink | undefined
}