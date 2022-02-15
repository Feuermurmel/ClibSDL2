import ClibSDL2

extension SDL_bool {
    init(_ value: Bool) {
        self = value ? SDL_TRUE : SDL_FALSE
    }
}

extension Bool {
    init(_ value: SDL_bool) {
        self = value == SDL_TRUE
    }
}
