import ClibSDL2

public struct SDLRenderer {
    public let ptr: OpaquePointer

    public init(_ ptr: OpaquePointer) {
        self.ptr = ptr
    }

    public init(window: SDLWindow, index: Int32, flags: SDL_RendererFlags) {
        ptr = SDL_CreateRenderer(window.ptr, index, flags.rawValue)
    }

    public var outputSize: (w: Int32, h: Int32) {
        var w: Int32 = 0
        var h: Int32 = 0

        SDL_GetRendererOutputSize(ptr, &w, &h)

        return (w, h)
    }

    public var logicalSize: (w: Int32, h: Int32) {
        get {
            var w: Int32 = 0
            var h: Int32 = 0

            SDL_RenderGetLogicalSize(ptr, &w, &h)

            return (w, h)
        }
        nonmutating set {
            SDL_RenderSetLogicalSize(ptr, newValue.w, newValue.h)
        }
    }

    public var integerScale: Bool {
        get { Bool(SDL_RenderGetIntegerScale(ptr)) }
        nonmutating set { SDL_RenderSetIntegerScale(ptr, SDL_bool(newValue)) }
    }

    public var scale: (w: Float, h: Float) {
        get {
            var w: Float = 0
            var h: Float = 0

            SDL_RenderGetScale(ptr, &w, &h)

            return (w, h)
        }
        nonmutating set {
            SDL_RenderSetScale(ptr, newValue.w, newValue.h)
        }
    }

    public func setRenderDrawColor(_ r: Uint8, _ g: Uint8, _ b: Uint8, _ a: Uint8 = 255) {
        SDL_SetRenderDrawColor(ptr, r, g, b, a)
    }

    public func clear() {
        SDL_RenderClear(ptr)
    }

    public func drawLine(_ x1: Float, _ y1: Float, _ x2: Float, _ y2: Float) {
        SDL_RenderDrawLineF(ptr, x1, y1, x2, y2)
    }

    public func present() {
        SDL_RenderPresent(ptr)
    }

    public func destroy() {
        SDL_DestroyRenderer(ptr)
    }
}

extension SDL_RendererFlags: OptionSet { }
