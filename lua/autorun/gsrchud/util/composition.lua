--[[
  HUD COMPOSITION
]]

if CLIENT then

  -- Draw elements
  GSRCHUD.Elements = {};

  -- Methods
  --[[
    Adds an element to the draw table
    @param {function} func
    @void
  ]]
  function GSRCHUD:AddElement(func)
    table.insert(self.Elements, func);
  end

  --[[
    Returns the element function of the given key
    @param {number} i
    @return {function} function
  ]]
  function GSRCHUD:GetElement(i)
    return self.Elements[i];
  end

  --[[
    Returns the elements table
    @return {table} GSRCHUD.Elements
  ]]
  function GSRCHUD:GetElements()
    return self.Elements;
  end

  -- Hooks
  local hasSuit = false;
  hook.Add("HUDPaint", "gsrchud_draw", function()
    -- Check if player's wearing a suit
    if (LocalPlayer():Alive() and LocalPlayer():Health() >= 1) then
      hasSuit = LocalPlayer():IsSuitEquipped();
    end

    -- Draw HUD
    if (not GSRCHUD:IsEnabled() or not hasSuit) then return end;
    for _, element in pairs(GSRCHUD:GetElements()) do
      element();
    end

    if (GSRCHUD:GetThemeCustomScript(GSRCHUD:GetCurrentTheme()) ~= nil) then
      GSRCHUD:GetThemeCustomScript(GSRCHUD:GetCurrentTheme())();
    else
      GSRCHUD:ClearCustomNumberCrit();
    end

  end);

end
