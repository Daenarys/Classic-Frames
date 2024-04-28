if not _G.SpellBookFrame then return end

SpellBookFramePortrait:SetSize(60, 60)
SpellBookFramePortrait:ClearAllPoints()
SpellBookFramePortrait:SetPoint("TOPLEFT", -6, 7)

hooksecurefunc("SpellBookFrame_Update", function()
	-- Make sure the correct tab is selected
	for i=1,5 do
		local tab = _G["SpellBookFrameTabButton"..i]
		if ( tab.bookType == SpellBookFrame.bookType ) then
			PanelTemplates_SelectTab(tab)
		else
			PanelTemplates_DeselectTab(tab)
		end
	end

	SpellBookFrameTabButton1:ClearAllPoints()
	SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", 0, 1)
end)