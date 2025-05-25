# Open Simplex Noise in C (with LuaJIT FFI bindings)

This repository is a fork and enhancement of Kurt Spencer's original [OpenSimplex Noise](https://gist.github.com/KdotJPG) algorithm, ported from Java to C.

> ⚠️ Note: This is **not** Ken Perlin’s Simplex noise algorithm. It is a separate and patent-free noise function with similar benefits.

## 🚀 Features

- Support for 2D, 3D, and 4D noise
- **LuaJIT bindings via FFI** (see `opensimplex-lua.lua`)
- Ideal for procedural generation (e.g. terrain, textures, maps, etc.)

## 📦 Files

- `open-simplex-noise.c/h` – Core C implementation
- `opensimplex-lua.lua` – LuaJIT FFI wrapper
- `usageExample.lua` – LuaJIT usage example
- `Makefile` – Compile with `make`
- `.gitignore`, `LICENSE`, `README.md`

---

## 🔧 Building of lib(.dll, .o, .os)

```sh
make
```

## 🔌 Example Usage in LuaJIT (via FFI)

```lua
local simplex = require("opensimplex-lua")

local noise = simplex.new(123456) -- Start with a seed

print("=== Noise 2D ===")
for i = 0, 4 do
    local val = noise:noise2(i * 0.1, i * 0.2)
    print(string.format("noise2(%.2f, %.2f) = %.4f", i * 0.1, i * 0.2, val))
end
```

See full usage in `usageExample.lua`.

## 🎮 Why this project?

This library was enhanced and adapted for **procedural terrain and map generation for games**, currently being developed using a pipeline of **C**, **Lua (LuaJIT)**, and **Python (with `bpy` for Blender integration)**.

You can check out the full project here:  
🔗 **Procedural Generation of Maps** → [github.com/Thomaskynol/ProceduralGenerationMaps](https://github.com/Thomaskynol/ProceduralGenerationMaps)


OpenSimplex provides smooth and visually pleasing noise ideal for:

* Terrain generation
* Biome maps
* Texture synthesis
* Noise-based animations

## 📜 License

MIT License – see [LICENSE](./LICENSE)

---

## 🙌 Credits

* Original algorithm by [Kurt Spencer](https://gist.github.com/KdotJPG)
* LuaJIT FFI bindings by [Thomas](https://github.com/thomasbravou)
