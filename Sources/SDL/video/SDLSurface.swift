import Foundation
import ClibSDL2

public struct SDLSurface {
    public let ptr: UnsafeMutablePointer<SDL_Surface>

    public init(_ ptr: UnsafeMutablePointer<SDL_Surface>) {
        self.ptr = ptr
    }

    public init?(from url: URL) {
        guard let ptr = IMG_Load(url.path) else {
            let error = String(cString: SDL_GetError())

            print("Loading image from \(url) failed: \(error)")

            return nil
        }

        self.ptr = ptr
    }
}
