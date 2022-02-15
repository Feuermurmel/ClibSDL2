import ClibSDL2

public struct SDLEvent {
    /**
     The wrapped SDL_Event instance.
     */
    public let sdl: SDL_Event

    public init(_ sdl: SDL_Event) {
        self.sdl = sdl
    }

    public var common: SDL_CommonEvent { sdl.common }

    public var data: SDLEventData { .fromSDLEvent(sdl) }
}

//extension SDLEvent: CustomStringConvertible {
//
//}

public enum SDLEventData {
    case appQuit
    case appTerminating
    case appLowMemory
    case appWillEnterBackground
    case appDidEnterBackground
    case appWillEnterForeground
    case appDidEnterForeground
    case localeChanged
    case displayEvent(SDLDisplayEvent)
    case windowEvent(SDLWindowEvent)
    case syswmEvent(SDL_SysWMEvent)
    case keyDown(SDLKeyboardEvent)
    case keyUp(SDLKeyboardEvent)
    case textEditing(SDL_TextEditingEvent)
    case textInput(SDL_TextInputEvent)
    case keyMapChanged
    case mouseMotion(SDLMouseMotionEvent)
    case mouseButtonDown(SDLMouseButtonEvent)
    case mouseButtonUp(SDLMouseButtonEvent)
    case mouseWheel(SDLMouseWheelEvent)
    case joyAxisMotion(SDL_JoyAxisEvent)
    case joyBallMotion(SDL_JoyBallEvent)
    case joyHatMotion(SDL_JoyHatEvent)
    case joyButtonDown(SDL_JoyButtonEvent)
    case joyButtonUp(SDL_JoyButtonEvent)
    case joyDeviceAdded(SDL_JoyDeviceEvent)
    case joyDeviceRemoved(SDL_JoyDeviceEvent)
    case controllerAxisMotion(SDL_ControllerAxisEvent)
    case controllerButtonDown(SDL_ControllerButtonEvent)
    case controllerButtonUp(SDL_ControllerButtonEvent)
    case controllerDeviceAdded(SDL_ControllerDeviceEvent)
    case controllerDeviceRemoved(SDL_ControllerDeviceEvent)
    case controllerDeviceRemapped(SDL_ControllerDeviceEvent)
    case controllerTouchpadDown(SDL_ControllerTouchpadEvent)
    case controllerTouchpadMotion(SDL_ControllerTouchpadEvent)
    case controllerTouchpadUp(SDL_ControllerTouchpadEvent)
    case controllerSensorUpdate(SDL_ControllerSensorEvent)
    case fingerDown(SDL_TouchFingerEvent)
    case fingerUp(SDL_TouchFingerEvent)
    case fingerMotion(SDL_TouchFingerEvent)
    case dollarGesture(SDL_DollarGestureEvent)
    case dollarRecord(SDL_DollarGestureEvent)
    case multiGesture(SDL_MultiGestureEvent)
    case clipboardUpdate
    case dropFile(SDL_DropEvent)
    case dropText(SDL_DropEvent)
    case dropBegin(SDL_DropEvent)
    case dropComplete(SDL_DropEvent)
    case audioDeviceAdded(SDL_AudioDeviceEvent)
    case audioDeviceRemoved(SDL_AudioDeviceEvent)
    case sensorUpdate(SDL_SensorEvent)
    case renderTargetsReset
    case renderDeviceReset
    case userEvent(SDL_UserEvent)
    case unknown

    static func fromSDLEvent(_ event: SDL_Event) -> SDLEventData {
        switch SDL_EventType(event.type) {
        case SDL_QUIT:
            return .appQuit
        case SDL_APP_TERMINATING:
            return .appTerminating
        case SDL_APP_LOWMEMORY:
            return .appLowMemory
        case SDL_APP_WILLENTERBACKGROUND:
            return .appWillEnterBackground
        case SDL_APP_DIDENTERBACKGROUND:
            return .appDidEnterBackground
        case SDL_APP_WILLENTERFOREGROUND:
            return .appWillEnterForeground
        case SDL_APP_DIDENTERFOREGROUND:
            return .appDidEnterForeground
        case SDL_LOCALECHANGED:
            return .localeChanged
        case SDL_DISPLAYEVENT:
            return .displayEvent(SDLDisplayEvent(event.display))
        case SDL_WINDOWEVENT:
            return .windowEvent(SDLWindowEvent(event.window))
        case SDL_SYSWMEVENT:
            return .syswmEvent(event.syswm)
        case SDL_KEYDOWN:
            return .keyDown(SDLKeyboardEvent(event.key))
        case SDL_KEYUP:
            return .keyUp(SDLKeyboardEvent(event.key))
        case SDL_TEXTEDITING:
            return .textEditing(event.edit)
        case SDL_TEXTINPUT:
            return .textInput(event.text)
        case SDL_KEYMAPCHANGED:
            return .keyMapChanged
        case SDL_MOUSEMOTION:
            return .mouseMotion(SDLMouseMotionEvent(event.motion))
        case SDL_MOUSEBUTTONDOWN:
            return .mouseButtonDown(SDLMouseButtonEvent(event.button))
        case SDL_MOUSEBUTTONUP:
            return .mouseButtonUp(SDLMouseButtonEvent(event.button))
        case SDL_MOUSEWHEEL:
            return .mouseWheel(SDLMouseWheelEvent(event.wheel))
        case SDL_JOYAXISMOTION:
            return .joyAxisMotion(event.jaxis)
        case SDL_JOYBALLMOTION:
            return .joyBallMotion(event.jball)
        case SDL_JOYHATMOTION:
            return .joyHatMotion(event.jhat)
        case SDL_JOYBUTTONDOWN:
            return .joyButtonDown(event.jbutton)
        case SDL_JOYBUTTONUP:
            return .joyButtonUp(event.jbutton)
        case SDL_JOYDEVICEADDED:
            return .joyDeviceAdded(event.jdevice)
        case SDL_JOYDEVICEREMOVED:
            return .joyDeviceRemoved(event.jdevice)
        case SDL_CONTROLLERAXISMOTION:
            return .controllerAxisMotion(event.caxis)
        case SDL_CONTROLLERBUTTONDOWN:
            return .controllerButtonDown(event.cbutton)
        case SDL_CONTROLLERBUTTONUP:
            return .controllerButtonUp(event.cbutton)
        case SDL_CONTROLLERDEVICEADDED:
            return .controllerDeviceAdded(event.cdevice)
        case SDL_CONTROLLERDEVICEREMOVED:
            return .controllerDeviceRemoved(event.cdevice)
        case SDL_CONTROLLERDEVICEREMAPPED:
            return .controllerDeviceRemapped(event.cdevice)
        case SDL_CONTROLLERTOUCHPADDOWN:
            return .controllerTouchpadDown(event.ctouchpad)
        case SDL_CONTROLLERTOUCHPADMOTION:
            return .controllerTouchpadMotion(event.ctouchpad)
        case SDL_CONTROLLERTOUCHPADUP:
            return .controllerTouchpadUp(event.ctouchpad)
        case SDL_CONTROLLERSENSORUPDATE:
            return .controllerSensorUpdate(event.csensor)
        case SDL_FINGERDOWN:
            return .fingerDown(event.tfinger)
        case SDL_FINGERUP:
            return .fingerUp(event.tfinger)
        case SDL_FINGERMOTION:
            return .fingerMotion(event.tfinger)
        case SDL_DOLLARGESTURE:
            return .dollarGesture(event.dgesture)
        case SDL_DOLLARRECORD:
            return .dollarRecord(event.dgesture)
        case SDL_MULTIGESTURE:
            return .multiGesture(event.mgesture)
        case SDL_CLIPBOARDUPDATE:
            return .clipboardUpdate
        case SDL_DROPFILE:
            return .dropFile(event.drop)
        case SDL_DROPTEXT:
            return .dropText(event.drop)
        case SDL_DROPBEGIN:
            return .dropBegin(event.drop)
        case SDL_DROPCOMPLETE:
            return .dropComplete(event.drop)
        case SDL_AUDIODEVICEADDED:
            return .audioDeviceAdded(event.adevice)
        case SDL_AUDIODEVICEREMOVED:
            return .audioDeviceRemoved(event.adevice)
        case SDL_SENSORUPDATE:
            return .sensorUpdate(event.sensor)
        case SDL_RENDER_TARGETS_RESET:
            return .renderTargetsReset
        case SDL_RENDER_DEVICE_RESET:
            return .renderDeviceReset
        case SDL_USEREVENT:
            return .userEvent(event.user)
        default:
            return .unknown
        }
    }
}
