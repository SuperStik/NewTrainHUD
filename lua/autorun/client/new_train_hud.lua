local selColor = Color(0, 0, 0, 80)
local triangle = Material("gui/point.png", "smooth mips")
local useHUD = CreateConVar("hud_usenewtrain", "1", FCVAR_ARCHIVE, "Use the new train HUD instead of the HL1 one.")

hook.Add("HUDPaint", "DrawTrainHUD", function()
	local localply = LocalPlayer()
	local train = localply:GetNW2Int("iTrain")

	if train > 0 and useHUD:GetBool() and not localply:InVehicle() then
		local mult = ScrH() / 480
		local width = 42 * mult
		local heightt = 8 * mult
		local heightr = 6 * mult
		local xpos = 281 * mult
		draw.RoundedBox(8, 270 * mult, 404 * mult, 64 * mult, 64 * mult, selColor)
		surface.SetDrawColor(127, 117, 10, 127)

		if train < 5 and train > 1 then
			surface.SetDrawColor(255, 235, 20)
		end

		surface.DrawRect(xpos, 434 * mult, width, heightr)

		if train == 2 then
			surface.SetDrawColor(127, 117, 10, 127)
		end

		surface.DrawRect(xpos, 422 * mult, width, heightr)

		if train == 3 then
			surface.SetDrawColor(127, 117, 10, 127)
		end

		surface.SetMaterial(triangle)
		surface.DrawTexturedRectRotated(302 * mult, 412 * mult, width, heightt, 180)

		if train == 4 then
			surface.SetDrawColor(127, 117, 10, 127)
		end

		train1 = train == 1

		if train1 then
			surface.SetDrawColor(255, 235, 20)
		end

		surface.DrawOutlinedRect(279 * mult, 444 * mult, 46 * mult, 10 * mult, 2 * mult)

		if train1 then
			surface.SetDrawColor(127, 117, 10, 127)
		elseif train == 5 then
			surface.SetDrawColor(255, 235, 20)
		end

		surface.DrawTexturedRect(xpos, 458 * mult, width, heightt)
	end
end)

hook.Add("HUDShouldDraw", "DisableTrainHUD", function(str)
	if str == "CHudTrain" and useHUD:GetBool() then return false end
end)
