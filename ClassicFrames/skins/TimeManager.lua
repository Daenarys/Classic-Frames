local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" then
		ApplyCloseButton(TimeManagerFrameCloseButton)

		TimeManagerFrame.PortraitContainer.CircleMask:Hide()

		TimeManagerFramePortrait:SetSize(61, 61)
		TimeManagerFramePortrait:ClearAllPoints()
		TimeManagerFramePortrait:SetPoint("TOPLEFT", -6, 8)

		TimeManagerFrame.TitleContainer:ClearAllPoints()
		TimeManagerFrame.TitleContainer:SetPoint("TOPLEFT", TimeManagerFrame, "TOPLEFT", 74, 0)
		TimeManagerFrame.TitleContainer:SetPoint("TOPRIGHT", TimeManagerFrame, "TOPRIGHT", -41, 0)

		TimeManagerFrameTitleText:SetTextColor(255, 255, 255, 1)
		TimeManagerFrameTitleText:SetText(TIMEMANAGER_TITLE)

		ApplyTitleBg(TimeManagerFrame)
		ApplyNineSlicePortrait(TimeManagerFrame)
	
		StopwatchCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		StopwatchCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		StopwatchCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		StopwatchCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		StopwatchCloseButton:ClearAllPoints()
		StopwatchCloseButton:SetPoint("TOPRIGHT", 1, 1)
	end
end)