import ClibSDL2

public struct SDLDisplayEvent {
    public let sdl: SDL_DisplayEvent

    public init(_ sdl: SDL_DisplayEvent) {
        self.sdl = sdl
    }

    public var display: UInt32 { sdl.display }

    public var event: SDLDisplayEventID {
        return SDLDisplayEventID(SDL_DisplayEventID(rawValue: UInt32(sdl.event)))
    }
}

public enum SDLDisplayEventID {
    case orientation, connected, disconnected

    init(_ value: SDL_DisplayEventID) {
        switch value {
        case SDL_DISPLAYEVENT_ORIENTATION: self = .orientation
        case SDL_DISPLAYEVENT_CONNECTED: self = .connected
        case SDL_DISPLAYEVENT_DISCONNECTED: self = .disconnected
        default: preconditionFailure("Unknown value: \(value)")
        }
    }
}
