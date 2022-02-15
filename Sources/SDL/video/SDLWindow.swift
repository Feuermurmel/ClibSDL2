import ClibSDL2

public struct SDLWindow {
    public let ptr: OpaquePointer

    public init(_ ptr: OpaquePointer) {
        self.ptr = ptr
    }

    public init(title: String, pos: (x: Int32, y: Int32), size: (w: Int32, h: Int32), flags: SDL_WindowFlags) {
        ptr = SDL_CreateWindow(title, pos.x, pos.y, size.w, size.h, flags.rawValue)
    }

    public var size: (w: Int32, h: Int32) {
        var w: Int32 = 0
        var h: Int32 = 0

        SDL_GetWindowSize(ptr, &w, &h)

        return (w, h)
    }

    public var metalDrawableSize: (w: Int32, h: Int32) {
        var w: Int32 = 0
        var h: Int32 = 0

        SDL_Metal_GetDrawableSize(ptr, &w, &h)

        return (w, h)
    }

    public func destroy() {
        SDL_DestroyWindow(ptr)
    }
}

extension SDL_WindowFlags: OptionSet { }
