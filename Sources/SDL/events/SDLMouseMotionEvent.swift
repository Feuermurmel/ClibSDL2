import ClibSDL2

public struct SDLMouseMotionEvent {
    public let sdl: SDL_MouseMotionEvent

    public init(_ sdl: SDL_MouseMotionEvent) {
        self.sdl = sdl
    }

    public var windowID: UInt32 { sdl.windowID }

    public var which: UInt32 { sdl.which }

    public var state: Set<SDLMouseButton> {
        return SDLMouseButton.setFromBitset(Int32(sdl.state))
    }

    public var pos: (x: Int32, y: Int32) { (sdl.x, sdl.y) }

    public var rel: (x: Int32, y: Int32) { (sdl.xrel, sdl.yrel) }
}
