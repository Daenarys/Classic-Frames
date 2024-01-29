if not _G.GossipFrame then return end

ApplyCloseButton(GossipFrameCloseButton)

GossipFrame.PortraitContainer.CircleMask:Hide()

GossipFramePortrait:SetSize(61, 61)
GossipFramePortrait:ClearAllPoints()
GossipFramePortrait:SetPoint("TOPLEFT", -6, 8)

GossipFrame.TitleContainer:ClearAllPoints()
GossipFrame.TitleContainer:SetPoint("TOPLEFT", GossipFrame, "TOPLEFT", 66, -1)
GossipFrame.TitleContainer:SetPoint("TOPRIGHT", GossipFrame, "TOPRIGHT", -60, 1)

GossipFrameTitleText:SetTextColor(255, 255, 255, 1)

ApplyTitleBg(GossipFrame)
ApplyNineSlicePortrait(GossipFrame)

GossipFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

GossipFrame.GreetingPanel.ScrollBox:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBox:SetPoint("TOPLEFT", 5, -65)

GossipFrame.GreetingPanel.ScrollBar:SetSize(25, 560)
GossipFrame.GreetingPanel.ScrollBar:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBar:SetPoint("TOPLEFT", GossipFrame.GreetingPanel.ScrollBox, "TOPRIGHT", 2, 3)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("BOTTOMLEFT", GossipFrame.GreetingPanel.ScrollBox, "BOTTOMRIGHT", 5, -1)

ApplyScrollBarArrow(GossipFrame.GreetingPanel.ScrollBar)
ApplyScrollBarTrack(GossipFrame.GreetingPanel.ScrollBar.Track)
ApplyScrollBarThumb(GossipFrame.GreetingPanel.ScrollBar.Track.Thumb)

hooksecurefunc(GossipFrame, "HandleShow", function(self, textureKit)
	if not textureKit then
		self.Background:SetSize(510, 620)
		self.Background:SetTexture("Interface/QuestFrame/QuestBG")
	end
end)