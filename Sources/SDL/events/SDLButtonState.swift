import ClibSDL2

public enum SDLButtonState {
    case released, pressed

    init(_ value: Int32) {
        switch value {
        case SDL_RELEASED: self = .released
        case SDL_PRESSED: self = .pressed
        default: preconditionFailure("Unknown value: \(value)")
        }
    }
}
