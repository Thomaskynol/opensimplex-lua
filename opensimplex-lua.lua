local ffi = require("ffi")

ffi.cdef[[
typedef struct osn_context osn_context;

// Cria e libera contexto
int open_simplex_noise(int64_t seed, osn_context **ctx);
void open_simplex_noise_free(osn_context *ctx);

// Funções de ruído
double open_simplex_noise2(const osn_context *ctx, double x, double y);
double open_simplex_noise3(const osn_context *ctx, double x, double y, double z);
double open_simplex_noise4(const osn_context *ctx, double x, double y, double z, double w);
]]

-- Ajuste o nome da lib conforme o SO
local lib = ffi.load("open_simplex") -- Ex: "libopen_simplex.so" no Linux

local M = {}

function M.new(seed)
    local ctx_ptr = ffi.new("osn_context*[1]")
    local ret = lib.open_simplex_noise(seed, ctx_ptr)
    if ret ~= 0 then
        error("Failed to create OpenSimplex context")
    end
    local obj = {
        ctx = ctx_ptr[0]
    }
    setmetatable(obj, {
        __index = M,
        __gc = function(self)
            if self.ctx ~= nil then
                lib.open_simplex_noise_free(self.ctx)
                self.ctx = nil
            end
        end
    })
    return obj
end

-- Funções de ruído
function M:noise2(x, y)
    return lib.open_simplex_noise2(self.ctx, x, y)
end

function M:noise3(x, y, z)
    return lib.open_simplex_noise3(self.ctx, x, y, z)
end

function M:noise4(x, y, z, w)
    return lib.open_simplex_noise4(self.ctx, x, y, z, w)
end

return M
