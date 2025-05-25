local simplex = require("opensimplex-lua")

local noise = simplex.new(123456)

-- Testar valores 2D
print("=== Noise 2D ===")
for i = 0, 4 do
    local val = noise:noise2(i * 0.1, i * 0.2)
    print(string.format("noise2(%.2f, %.2f) = %.4f", i * 0.1, i * 0.2, val))
end

-- Testar valores 3D
print("\n=== Noise 3D ===")
for i = 0, 4 do
    local val = noise:noise3(i * 0.1, i * 0.2, i * 0.3)
    print(string.format("noise3(%.2f, %.2f, %.2f) = %.4f", i * 0.1, i * 0.2, i * 0.3, val))
end

-- Testar valores 4D
print("\n=== Noise 4D ===")
for i = 0, 4 do
    local val = noise:noise4(i * 0.1, i * 0.2, i * 0.3, i * 0.4)
    print(string.format("noise4(%.2f, %.2f, %.2f, %.2f) = %.4f", i * 0.1, i * 0.2, i * 0.3, i * 0.4, val))
end
