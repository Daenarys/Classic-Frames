local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		ApplyCloseButton(WardrobeFrameCloseButton)

		WardrobeFrame.PortraitContainer.CircleMask:Hide()

		WardrobeFramePortrait:SetSize(61, 61)
		WardrobeFramePortrait:ClearAllPoints()
		WardrobeFramePortrait:SetPoint("TOPLEFT", -6, 8)

		WardrobeFrame.TitleContainer:ClearAllPoints()
		WardrobeFrame.TitleContainer:SetPoint("TOPLEFT", WardrobeFrame, "TOPLEFT", 58, 0)
		WardrobeFrame.TitleContainer:SetPoint("TOPRIGHT", WardrobeFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(WardrobeFrame)
		ApplyNineSlicePortrait(WardrobeFrame)
		ApplyDialogBorder(WardrobeOutfitFrame.Border)

		WardrobeTransmogFrame.ModelScene.ControlFrame:HookScript("OnShow", function(self)
			self:SetSize(94, 23)
			self:ClearAllPoints()
			self:SetPoint("TOP", 0, -2)

			if (self.Right == nil) then
				self.Right = self:CreateTexture(nil, "BACKGROUND");
				self.Right:SetSize(23, 23)
				self.Right:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.Right:SetTexCoord(0.01562500, 0.37500000, 0.42968750, 0.60937500)
				self.Right:SetPoint("RIGHT")
			end

			if (self.Left == nil) then
				self.Left = self:CreateTexture(nil, "BACKGROUND");
				self.Left:SetSize(23, 23)
				self.Left:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.Left:SetTexCoord(0.40625000, 0.76562500, 0.42968750, 0.60937500)
				self.Left:SetPoint("LEFT")
			end

			if (self.Middle == nil) then
				self.Middle = self:CreateTexture(nil, "BACKGROUND");
				self.Middle:SetSize(32, 23)
				self.Middle:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.Middle:SetTexCoord(0, 1, 0.62500000, 0.80468750)
				self.Middle:SetPoint("LEFT", self.Left, "RIGHT")
				self.Middle:SetPoint("RIGHT", self.Right, "LEFT")
			end

			self.zoomInButton:SetSize(18, 18)
			self.zoomInButton:ClearAllPoints()
			self.zoomInButton:SetPoint("LEFT", 2, 0)
			self.zoomInButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
			self.zoomInButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.14843750, 0.27343750)
			self.zoomInButton:GetNormalTexture():Hide()
			self.zoomInButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
			self.zoomInButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
			self.zoomInButton:GetHighlightTexture():SetSize(16, 16)
			self.zoomInButton:GetHighlightTexture():ClearAllPoints()
			self.zoomInButton:GetHighlightTexture():SetPoint("CENTER")
			self.zoomInButton:GetHighlightTexture():SetAlpha(1)
			self.zoomInButton:SetHitRectInsets(0, 0, 0, 0)

			if (self.zoomInButton.Bg == nil) then
				self.zoomInButton.Bg = self.zoomInButton:CreateTexture(nil, "BACKGROUND");
				self.zoomInButton.Bg:SetSize(16, 16)
				self.zoomInButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.zoomInButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
				self.zoomInButton.Bg:SetPoint("CENTER")
			end

			self.zoomOutButton:SetSize(18, 18)
			self.zoomOutButton:ClearAllPoints()
			self.zoomOutButton:SetPoint("LEFT", self.zoomInButton, "RIGHT")
			self.zoomOutButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
			self.zoomOutButton.Icon:SetTexCoord(0.29687500, 0.54687500, 0.00781250, 0.13281250)
			self.zoomOutButton:GetNormalTexture():Hide()
			self.zoomOutButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
			self.zoomOutButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
			self.zoomOutButton:GetHighlightTexture():SetSize(16, 16)
			self.zoomOutButton:GetHighlightTexture():ClearAllPoints()
			self.zoomOutButton:GetHighlightTexture():SetPoint("CENTER")
			self.zoomOutButton:GetHighlightTexture():SetAlpha(1)
			self.zoomOutButton:SetHitRectInsets(0, 0, 0, 0)

			if (self.zoomOutButton.Bg == nil) then
				self.zoomOutButton.Bg = self.zoomOutButton:CreateTexture(nil, "BACKGROUND");
				self.zoomOutButton.Bg:SetSize(16, 16)
				self.zoomOutButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.zoomOutButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
				self.zoomOutButton.Bg:SetPoint("CENTER")
			end

			self.rotateLeftButton:SetSize(18, 18)
			self.rotateLeftButton:ClearAllPoints()
			self.rotateLeftButton:SetPoint("LEFT", self.zoomOutButton, "RIGHT")
			self.rotateLeftButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
			self.rotateLeftButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.28906250, 0.41406250)
			self.rotateLeftButton:GetNormalTexture():Hide()
			self.rotateLeftButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
			self.rotateLeftButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
			self.rotateLeftButton:GetHighlightTexture():SetSize(16, 16)
			self.rotateLeftButton:GetHighlightTexture():ClearAllPoints()
			self.rotateLeftButton:GetHighlightTexture():SetPoint("CENTER")
			self.rotateLeftButton:GetHighlightTexture():SetAlpha(1)
			self.rotateLeftButton:SetHitRectInsets(0, 0, 0, 0)

			if (self.rotateLeftButton.Bg == nil) then
				self.rotateLeftButton.Bg = self.rotateLeftButton:CreateTexture(nil, "BACKGROUND");
				self.rotateLeftButton.Bg:SetSize(16, 16)
				self.rotateLeftButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.rotateLeftButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
				self.rotateLeftButton.Bg:SetPoint("CENTER")
			end

			self.rotateRightButton:SetSize(18, 18)
			self.rotateRightButton:ClearAllPoints()
			self.rotateRightButton:SetPoint("LEFT", self.rotateLeftButton, "RIGHT")
			self.rotateRightButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
			self.rotateRightButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.28906250, 0.41406250)
			self.rotateRightButton:GetNormalTexture():Hide()
			self.rotateRightButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
			self.rotateRightButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
			self.rotateRightButton:GetHighlightTexture():SetSize(16, 16)
			self.rotateRightButton:GetHighlightTexture():ClearAllPoints()
			self.rotateRightButton:GetHighlightTexture():SetPoint("CENTER")
			self.rotateRightButton:GetHighlightTexture():SetAlpha(1)
			self.rotateRightButton:SetHitRectInsets(0, 0, 0, 0)

			if (self.rotateRightButton.Bg == nil) then
				self.rotateRightButton.Bg = self.rotateRightButton:CreateTexture(nil, "BACKGROUND");
				self.rotateRightButton.Bg:SetSize(16, 16)
				self.rotateRightButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.rotateRightButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
				self.rotateRightButton.Bg:SetPoint("CENTER")
			end

			self.resetButton:SetSize(18, 18)
			self.resetButton:ClearAllPoints()
			self.resetButton:SetPoint("LEFT", self.rotateRightButton, "RIGHT")
			self.resetButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
			self.resetButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.00781250, 0.13281250)
			self.resetButton:GetNormalTexture():Hide()
			self.resetButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
			self.resetButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
			self.resetButton:GetHighlightTexture():SetSize(16, 16)
			self.resetButton:GetHighlightTexture():ClearAllPoints()
			self.resetButton:GetHighlightTexture():SetPoint("CENTER")
			self.resetButton:GetHighlightTexture():SetAlpha(1)
			self.resetButton:SetHitRectInsets(0, 0, 0, 0)

			if (self.resetButton.Bg == nil) then
				self.resetButton.Bg = self.resetButton:CreateTexture(nil, "BACKGROUND");
				self.resetButton.Bg:SetSize(16, 16)
				self.resetButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
				self.resetButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
				self.resetButton.Bg:SetPoint("CENTER")
			end
		end)
	end
end)