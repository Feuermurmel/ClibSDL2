import ClibSDL2

public struct SDLMouseButtonEvent {
    public let sdl: SDL_MouseButtonEvent

    public init(_ sdl: SDL_MouseButtonEvent) {
        self.sdl = sdl
    }

    public var windowID: UInt32 { sdl.windowID }

    public var which: UInt32 { sdl.which }

    public var button: SDLMouseButton { SDLMouseButton(Int32(sdl.button)) }

    public var state: SDLButtonState { SDLButtonState(Int32(sdl.state)) }

    public var clicks: UInt8 { sdl.clicks }

    public var pos: (x: Int32, y: Int32) { (sdl.x, sdl.y) }
}
