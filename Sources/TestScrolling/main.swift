import Foundation
import ClibSDL2

func floorDivision(_ a: Int, by b: Int) -> (quotient: Int, remainder: Int) {
    var q = a / b

    if (a ^ b < 0 && q * b != a) {
        q -= 1
    }

    return (q, a - q * b)
}

func main() {
    SDL_Init(SDL_INIT_VIDEO)
    SDL_SetHint(SDL_HINT_RENDER_DRIVER, "metal")
    SDL_InitSubSystem(SDL_INIT_VIDEO)

    let window = SDL_CreateWindow("Test", 0, 0, 800, 600, SDL_WINDOW_SHOWN.rawValue | SDL_WINDOW_ALLOW_HIGHDPI.rawValue | SDL_WINDOW_METAL.rawValue)

    SDL_SetWindowResizable(window, SDL_TRUE)

    UserDefaults.standard.set(true, forKey: "AppleMomentumScrollSupported")

    let renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_PRESENTVSYNC.rawValue | SDL_RENDERER_ACCELERATED.rawValue)

    var quit = false

    var positionX: Float = 200
    var positionY: Float = 200

    let numSelections = 50
    var selection = 0

    while !quit {
        var event: SDL_Event = SDL_Event()

        while (SDL_PollEvent(&event) != 0) {
            switch (event.type) {
            case SDL_QUIT.rawValue,
                 SDL_KEYUP.rawValue where event.key.keysym.sym == SDLK_ESCAPE.rawValue:
                quit = true
            case SDL_MOUSEWHEEL.rawValue:
                print("mouse wheel: \(event.wheel.x) \(event.wheel.y), \(event.wheel.continuousX) \(event.wheel.continuousY)")

                positionX += -Float(event.wheel.continuousX)
                positionY += Float(event.wheel.continuousY)

                selection = floorDivision(selection + Int(event.wheel.y), by: numSelections).remainder
            default: break
            }
        }

        var screenWidth: Int32 = 0
        var screenHeight: Int32 = 0

        SDL_GetRendererOutputSize(renderer, &screenWidth, &screenHeight)

        SDL_SetRenderDrawColor(renderer, 0, 0, 0, UInt8(SDL_ALPHA_OPAQUE))
        SDL_RenderClear(renderer)

        // Multiply by two because I'm running on a HiDPI-Display.
        var rectangle = SDL_FRect(x: positionX * 2, y: positionY * 2, w: 100, h: 100)

        SDL_SetRenderDrawColor(renderer, 255, 255, 0, UInt8(SDL_ALPHA_OPAQUE))
        SDL_RenderFillRectF(renderer, &rectangle)

        for i in 0..<numSelections {
            let size = 30 * screenWidth / 800
            let (row, column) = floorDivision(i, by: 10)
            let x = (420 + column * 36) * Int(screenWidth) / 800
            let y = (100 + row * 36) * Int(screenWidth) / 800

            var rectangle = SDL_Rect(x: Int32(x), y: Int32(y), w: Int32(size), h: Int32(size))

            if (i == selection) {
                SDL_SetRenderDrawColor(renderer, 255, 255, 0, UInt8(SDL_ALPHA_OPAQUE))
            } else {
                SDL_SetRenderDrawColor(renderer, 255 / 5, 255 / 5, 0, Uint8(SDL_ALPHA_OPAQUE))
            }

            SDL_RenderFillRect(renderer, &rectangle)
        }

        SDL_RenderPresent(renderer)
    }

    SDL_DestroyRenderer(renderer)
    SDL_DestroyWindow(window)
    SDL_Quit()
}

main()
