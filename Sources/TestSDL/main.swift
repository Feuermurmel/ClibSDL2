import ClibSDL2

// Very simple test that importing and linking to libSDL2 has worked.
print("SDL_GetRevision(): \(String(cString: SDL_GetRevision()))")
