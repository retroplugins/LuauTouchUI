# LuauTouchUI ⚡

Lightweight, zero-stutter touch input and UI rendering utilities designed specifically for mobile and tablet (iOS/iPadOS) Roblox experiences.

## Why LuauTouchUI?
Most Luau UI frameworks prioritize desktop mouse/keyboard inputs, causing frame-time spikes and garbage collection stutters on mobile devices. `LuauTouchUI` provides deterministic gesture math and frame-budgeted UI recycling to maintain a locked 60–120 FPS.

## Core Modules
- **`GestureHandler.luau`**: Multi-touch pinch, swipe, and long-press detection with zero per-frame table allocations.
- **`TouchScaler.luau`**: Automatic DPI and minimum 48px ergonomic hit-box scaling for tablet and phone screens.

## Installation
Drop the `src/` folder into `ReplicatedStorage` or install via Wally (`wally.toml`):

`LuauTouchUI = "retroplugins/luautouchui@0.1.0"`

## Roadmap
- [ ] Inertial scroll physics with configurable decay
- [ ] VirtualList 2D grid recycling
- [ ] Automated TestEZ unit test suite for multi-touch edge cases

## License
MIT License

