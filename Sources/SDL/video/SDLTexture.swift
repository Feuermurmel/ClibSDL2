import ClibSDL2

public struct SDLTexture {
    public let ptr: OpaquePointer
    
    public init(_ ptr: OpaquePointer) {
        self.ptr = ptr
    }

    public init(in renderer: SDLRenderer, fromSurface surface: SDLSurface) {
        ptr = SDL_CreateTextureFromSurface(renderer.ptr, surface.ptr)!
    }
}
