import ClibSDL2

public struct SDLMouseWheelEvent {
    public let sdl: SDL_MouseWheelEvent

    public init(_ sdl: SDL_MouseWheelEvent) {
        self.sdl = sdl
    }

    public var windowID: UInt32 { sdl.windowID }

    public var which: UInt32 { sdl.which }

    public var steps: (x: Int32, y: Int32) { (sdl.x, sdl.y) }

    public var continuous: (x: Int32, y: Int32) { (sdl.continuousX, sdl.continuousY) }

    public var isContinuousSource: Bool { Bool(sdl.isContinuousSource) }

    public var direction: SDLMouseWheelDirection {
        return SDLMouseWheelDirection(SDL_MouseWheelDirection(rawValue: sdl.direction))
    }
}

public enum SDLMouseWheelDirection {
    case normal, flipped

    init(_ value: SDL_MouseWheelDirection) {
        switch value {
        case SDL_MOUSEWHEEL_NORMAL: self = .normal
        case SDL_MOUSEWHEEL_FLIPPED: self = .flipped
        default: preconditionFailure("Unknown value: \(value)")
        }
    }
}
