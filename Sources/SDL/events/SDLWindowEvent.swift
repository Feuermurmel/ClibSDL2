import ClibSDL2

public struct SDLWindowEvent {
    public let sdl: SDL_WindowEvent

    public init(_ sdl: SDL_WindowEvent) {
        self.sdl = sdl
    }

    public var windowID: UInt32 { sdl.windowID }

    public var event: SDLWindowEventID {
        SDLWindowEventID(SDL_WindowEventID(UInt32(sdl.event)))
    }
}

public  enum SDLWindowEventID {
    case shown, hidden, exposed, moved, resized, sizeChanged, minimized,
         maximized, restored, enter, leave, focusGained, focusLost, close,
         takeFocus, hitTest

    init(_ value: SDL_WindowEventID) {
        switch value {
        case SDL_WINDOWEVENT_SHOWN: self = .shown
        case SDL_WINDOWEVENT_HIDDEN: self = .hidden
        case SDL_WINDOWEVENT_EXPOSED: self = .exposed
        case SDL_WINDOWEVENT_MOVED: self = .moved
        case SDL_WINDOWEVENT_RESIZED: self = .resized
        case SDL_WINDOWEVENT_SIZE_CHANGED: self = .sizeChanged
        case SDL_WINDOWEVENT_MINIMIZED: self = .minimized
        case SDL_WINDOWEVENT_MAXIMIZED: self = .maximized
        case SDL_WINDOWEVENT_RESTORED: self = .restored
        case SDL_WINDOWEVENT_ENTER: self = .enter
        case SDL_WINDOWEVENT_LEAVE: self = .leave
        case SDL_WINDOWEVENT_FOCUS_GAINED: self = .focusGained
        case SDL_WINDOWEVENT_FOCUS_LOST: self = .focusLost
        case SDL_WINDOWEVENT_CLOSE: self = .close
        case SDL_WINDOWEVENT_TAKE_FOCUS: self = .takeFocus
        case SDL_WINDOWEVENT_HIT_TEST: self = .hitTest
        default: preconditionFailure("Unknown value: \(value)")
        }
    }
}
