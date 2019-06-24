--[[------------
   GoldSrc Era
 Heads Up Display
  Version 1.11.0
   24/06/2019

By DyaMetR
]]--------------

-- Main framework table
GSRCHUD = {};
GSRCHUD.Version = "1.11.0";

--[[
  METHODS
]]

--[[
  Correctly includes a file
  @param {string} file
  @void
]]--
function GSRCHUD:IncludeFile(file)
  if SERVER then
    include(file);
    AddCSLuaFile(file);
  end
  if CLIENT then
    include(file);
  end
end

--[[
  INCLUDES
]]
GSRCHUD:IncludeFile("gsrchud/core.lua");
