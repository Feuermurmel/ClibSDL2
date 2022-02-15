import ClibSDL2

public struct SDLKeyboardEvent {
    public let sdl: SDL_KeyboardEvent

    public init(_ sdl: SDL_KeyboardEvent) {
        self.sdl = sdl
    }

    public var windowID: UInt32 { sdl.windowID }

    public var state: SDLButtonState { SDLButtonState(Int32(sdl.state)) }

    public var `repeat`: UInt8 { sdl.repeat }

    public var keysym: SDL_Keysym { sdl.keysym }
}
