import ClibSDL2

public enum SDLMouseButton {
    case left, middle, right, x1, x2

    init(_ value: Int32) {
        switch value {
        case SDL_BUTTON_LEFT: self = .left
        case SDL_BUTTON_MIDDLE: self = .middle
        case SDL_BUTTON_RIGHT: self = .right
        case SDL_BUTTON_X1: self = .x1
        case SDL_BUTTON_X2: self = .x2
        default: preconditionFailure("Unknown value: \(value)")
        }
    }

    static func setFromBitset(_ value: Int32) -> Set<SDLMouseButton> {
        var result = Set<SDLMouseButton>()

        func checkButton(_ button: Int32) {
            if (value & (1 << (button - 1))) != 0 {
                result.insert(SDLMouseButton(button))
            }
        }

        checkButton(SDL_BUTTON_LEFT)
        checkButton(SDL_BUTTON_MIDDLE)
        checkButton(SDL_BUTTON_RIGHT)
        checkButton(SDL_BUTTON_X1)
        checkButton(SDL_BUTTON_X2)

        return result
    }
}
