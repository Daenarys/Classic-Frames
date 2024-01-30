function CfTargetFrame_OnLoad(self)
	TargetFrameHealthBar.LeftText = TargetFrameHealthBarTextLeft;
	TargetFrameHealthBar.RightText = TargetFrameHealthBarTextRight;
	TargetFrameManaBar.LeftText = TargetFrameManaBarTextLeft;
	TargetFrameManaBar.RightText = TargetFrameManaBarTextRight;

	CfUnitFrame_Initialize(self, "target", nil, nil,
		TargetFrameHealthBar, TargetFrameHealthBarText,
		TargetFrameManaBar, TargetFrameManaBarText,
		nil, nil, nil,
		CfTargetFrameMyHealPredictionBar, CfTargetFrameOtherHealPredictionBar,
		CfTargetFrameTotalAbsorbBar, CfTargetFrameTotalAbsorbBarOverlay, CfTargetFrameOverAbsorbGlow,
		CfTargetFrameOverHealAbsorbGlow, CfTargetFrameHealAbsorbBar, CfTargetFrameHealAbsorbBarLeftShadow,
		CfTargetFrameHealAbsorbBarRightShadow);

	TargetFrameHealthBarText:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameHealthBarTextLeft:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameHealthBarTextRight:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameManaBarText:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameManaBarTextLeft:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameManaBarTextRight:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameDeadText:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	TargetFrameUnconsciousText:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)
	CfTargetFrameOverAbsorbGlow:SetParent(TargetFrame.TargetFrameContent.TargetFrameContentContextual)

	self:EnableMouse(false);
end

function CfTargetFrame_OnEvent(self, event, ...)
	CfUnitFrame_OnEvent(self, event, ...);
end

local function SkinFrame(frame)
	local contextual = frame.TargetFrameContent.TargetFrameContentContextual;
	local contentMain = frame.TargetFrameContent.TargetFrameContentMain;
	local nameText = contentMain.Name;
	local FrameHealthBar = contentMain.HealthBar;
	local FrameManaBar = contentMain.ManaBar;

	contextual:SetFrameStrata("MEDIUM")
	frame.TargetFrameContainer:SetFrameStrata("MEDIUM")

	nameText:SetParent(frame.TargetFrameContainer)
	nameText:SetWidth(100)
	nameText:ClearAllPoints()
	nameText:SetPoint("TOPLEFT", 36, -30)
	nameText:SetJustifyH("CENTER")

	if (frame.Background == nil) then
		frame.Background = frame:CreateTexture(nil, "BACKGROUND");
		frame.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	contextual.NumericalThreat:ClearAllPoints()
	contextual.NumericalThreat:SetPoint("BOTTOM", contentMain.ReputationColor, "TOP", 2, 0)

	contextual.RaidTargetIcon:ClearAllPoints()
	contextual.RaidTargetIcon:SetPoint("CENTER", frame.TargetFrameContainer.Portrait, "TOP", 2, -2)

	contentMain.ReputationColor:SetSize(119, 19)
	contentMain.ReputationColor:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-LevelBackground")
	contentMain.ReputationColor:ClearAllPoints()
	contentMain.ReputationColor:SetPoint("TOPRIGHT", -86, -26)

	hooksecurefunc(frame, "CheckClassification", function(self)
		local classification = UnitClassification(self.unit);

		local leaderIcon = contextual.LeaderIcon;
		leaderIcon:SetSize(16, 16)
		leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
		leaderIcon:ClearAllPoints()
		leaderIcon:SetPoint("TOPRIGHT", -24, -14)

		local guideIcon = contextual.GuideIcon;
		guideIcon:SetSize(19, 19)
		guideIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
		guideIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
		guideIcon:ClearAllPoints()
		guideIcon:SetPoint("TOPRIGHT", -20, -14)

		local questIcon = contextual.QuestIcon;
		questIcon:SetSize(32, 32)
		questIcon:SetTexture("Interface\\TargetingFrame\\PortraitQuestBadge")
		questIcon:ClearAllPoints()
		questIcon:SetPoint("TOP", 32, -16)

		contentMain.ReputationColor:Show()
		contextual.BossIcon:Hide()
		self.TargetFrameContainer.BossPortraitFrameTexture:Hide()

		self.TargetFrameContainer.Portrait:SetSize(64, 64)
		self.TargetFrameContainer.Portrait:ClearAllPoints()
		self.TargetFrameContainer.Portrait:SetPoint("TOPRIGHT", -22, -16)

		if (self == TargetFrame) then
			FrameHealthBar:SetAlpha(0)
			FrameManaBar:SetAlpha(0)
		end

		if ( classification == "rareelite" ) then
			self.Background:SetSize(119, 41)
			self.Background:SetPoint("TOPLEFT", 27, -28);
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite");
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetParent(self)
			self.TargetFrameContainer.Flash:SetSize(242, 112)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("CENTER", 3, 0)
			self.TargetFrameContainer.Flash:SetDrawLayer("BACKGROUND", 0)
		elseif ( classification == "worldboss" or classification == "elite" ) then
			self.Background:SetSize(119, 41)
			self.Background:SetPoint("TOPLEFT", 27, -28);
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetParent(self)
			self.TargetFrameContainer.Flash:SetSize(242, 112)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("CENTER", 3, 0)
			self.TargetFrameContainer.Flash:SetDrawLayer("BACKGROUND", 0)
		elseif ( classification == "rare" ) then
			self.Background:SetSize(119, 41)
			self.Background:SetPoint("TOPLEFT", 27, -28);
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare");
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetParent(self)
			self.TargetFrameContainer.Flash:SetSize(242, 93)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0, 0.181640625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("CENTER", 1, 0)
			self.TargetFrameContainer.Flash:SetDrawLayer("BACKGROUND", 0)
		elseif ( classification == "minus" ) then
			self.Background:SetSize(119, 12);
			self.Background:SetPoint("TOPLEFT", 27, -49);
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetParent(self)
			self.TargetFrameContainer.Flash:SetSize(256, 128)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 1, 0, 1)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("CENTER", 8, -20)
			self.TargetFrameContainer.Flash:SetDrawLayer("BACKGROUND", 0)
			contentMain.ReputationColor:Hide()
		else
			self.Background:SetSize(119, 41)
			self.Background:SetPoint("TOPLEFT", 27, -28);
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetParent(self)
			self.TargetFrameContainer.Flash:SetSize(242, 93)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0, 0.181640625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("CENTER", 1, 0)
			self.TargetFrameContainer.Flash:SetDrawLayer("BACKGROUND", 0)
		end
	end)

	hooksecurefunc(frame, "CheckDead", function(self)
		if ((UnitHealth(self.unit) <= 0) and UnitIsConnected(self.unit)) then
			if (UnitIsUnconscious(self.unit)) then
				TargetFrameUnconsciousText:Show();
				TargetFrameDeadText:Hide();
			else
				TargetFrameUnconsciousText:Hide();
				TargetFrameDeadText:Show();
			end
		else
			TargetFrameDeadText:Hide();
			TargetFrameUnconsciousText:Hide();
		end
	end)

	hooksecurefunc(frame, "CheckFaction", function(self)
		if (self.showPVP) then
			local factionGroup = UnitFactionGroup(self.unit);
			if (factionGroup == "Alliance") then
				contextual.PvpIcon:ClearAllPoints()
				contextual.PvpIcon:SetPoint("TOPRIGHT", -4, -24)
			elseif (factionGroup == "Horde") then
				contextual.PvpIcon:ClearAllPoints()
				contextual.PvpIcon:SetPoint("TOPRIGHT", 3, -22)
			end
			contextual.PrestigePortrait:ClearAllPoints()
			contextual.PrestigePortrait:SetPoint("TOPRIGHT", 5, -17)
		end
	end)

	hooksecurefunc(frame, "CheckLevel", function(self)
		local levelText = self.TargetFrameContent.TargetFrameContentMain.LevelText;
		local highLevelTexture = contextual.HighLevelTexture;
		local petBattle = contextual.PetBattleIcon;

		levelText:SetParent(contextual)
		levelText:ClearAllPoints();
		levelText:SetPoint("CENTER", 82, -21)

		highLevelTexture:SetParent(contextual)
		highLevelTexture:SetSize(16, 16)
		highLevelTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
		highLevelTexture:ClearAllPoints();
		highLevelTexture:SetPoint("CENTER", 82, -21)
		
		petBattle:SetParent(contextual)
		petBattle:ClearAllPoints();
		petBattle:SetPoint("CENTER", 85, -15)
	end)

	hooksecurefunc(frame, "Update", function(self)
		if (UnitExists(self.unit)) then
			CfUnitFrame_Update(CfTargetFrame);
		end
	end)

	hooksecurefunc('TargetFrame_UpdateBuffAnchor', function(self, buff, index, numDebuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
		local point, relativePoint;
		local startY, auraOffsetY;
		point = "TOP";
		relativePoint="BOTTOM";
		startY = 32;
		auraOffsetY = 3;
		local targetFrameContentContextual = self.TargetFrameContent.TargetFrameContentContextual;
		if (index == 1) then
			if (UnitIsFriend("player", self.unit) or numDebuffs == 0) then
				buff:SetPoint(point.."LEFT", self.TargetFrameContainer.FrameTexture, relativePoint.."LEFT", 5, startY);
			else
				buff:SetPoint(point.."LEFT", targetFrameContentContextual.debuffs, relativePoint.."LEFT", 0, -offsetY);
			end
			targetFrameContentContextual.buffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
			targetFrameContentContextual.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		elseif (anchorIndex ~= (index-1)) then
			buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY);
			targetFrameContentContextual.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		else
			buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0);
		end
	end)

	hooksecurefunc('TargetFrame_UpdateDebuffAnchor', function(self, buff, index, numBuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
		local point, relativePoint;
		local startY, auraOffsetY;
		point = "TOP";
		relativePoint="BOTTOM";
		startY = 32;
		auraOffsetY = 3;
		local targetFrameContentContextual = self.TargetFrameContent.TargetFrameContentContextual;
		if (index == 1) then
			if (UnitIsFriend("player", self.unit) and numBuffs > 0) then
				buff:SetPoint(point.."LEFT", targetFrameContentContextual.buffs, relativePoint.."LEFT", 0, -offsetY);
			else
				buff:SetPoint(point.."LEFT", self.TargetFrameContainer.FrameTexture, relativePoint.."LEFT", 5, startY);
			end
			targetFrameContentContextual.debuffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
			targetFrameContentContextual.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		elseif (anchorIndex ~= (index-1)) then
			buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY);
			targetFrameContentContextual.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		else
			buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0);
		end
	end)

	hooksecurefunc(frame, "menu", function(self)
		DropDownList1:ClearAllPoints()
		DropDownList1:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 140, 3)
	end)

	if (frame.totFrame) then
		local function fixDebuffs()
			local frameName = frame.totFrame:GetName();
			local suffix = "Debuff";
			local frameNameWithSuffix = frameName..suffix;
			for i= 1, 4 do
				local debuffName = frameNameWithSuffix..i;
				_G[debuffName]:ClearAllPoints()
				if (i == 1) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -23, -8)
				elseif (i==2) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -10, -8)
				elseif (i==3) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -23, -21)
				elseif (i==4) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -10, -21)
				end
			end
		end

		if (frame == TargetFrame) then
			frame.totFrame:ClearAllPoints()
			frame.totFrame:SetPoint("BOTTOMRIGHT", 12, -18)
		elseif (frame == FocusFrame) then
			hooksecurefunc(FocusFrame, "SetSmallSize", function()
				FocusFrame.totFrame:SetScale(0.95)
				FocusFrame.totFrame:ClearAllPoints()
				FocusFrame.totFrame:SetPoint("TOPRIGHT", FocusFrame, "BOTTOMRIGHT", 8, 30)
			end)
		end

		if (frame.totFrame.Background == nil) then
			frame.totFrame.Background = frame.totFrame.HealthBar:CreateTexture(nil, "BACKGROUND");
			frame.totFrame.Background:SetSize(46, 15)
			frame.totFrame.Background:SetColorTexture(0, 0, 0, 0.5)
			frame.totFrame.Background:ClearAllPoints()
			frame.totFrame.Background:SetPoint("BOTTOMLEFT", frame.totFrame, "BOTTOMLEFT", 45, 20);
		end

		frame.totFrame:SetFrameStrata("HIGH")
		
		frame.totFrame.FrameTexture:SetSize(93, 45)
		frame.totFrame.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetofTargetFrame")
		frame.totFrame.FrameTexture:SetTexCoord(0.015625, 0.7265625, 0, 0.703125)
		frame.totFrame.FrameTexture:ClearAllPoints()
		frame.totFrame.FrameTexture:SetPoint("TOPLEFT", 0, 0)

		frame.totFrame.Portrait:SetSize(35, 35)

		frame.totFrame.Name:SetWidth(100)
		frame.totFrame.Name:ClearAllPoints()
		frame.totFrame.Name:SetPoint("BOTTOMLEFT", 42, 6)
		
		frame.totFrame.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		frame.totFrame.HealthBar:SetStatusBarColor(0, 1, 0)
		frame.totFrame.HealthBar:SetSize(46, 7)
		frame.totFrame.HealthBar:ClearAllPoints()
		frame.totFrame.HealthBar:SetPoint("TOPRIGHT", -29, -15)
		frame.totFrame.HealthBar:SetFrameLevel(1)

		frame.totFrame.HealthBar.DeadText:SetParent(frame.totFrame)
		frame.totFrame.HealthBar.DeadText:ClearAllPoints()
		frame.totFrame.HealthBar.DeadText:SetPoint("LEFT", 48, 3)

		frame.totFrame.HealthBar.UnconsciousText:SetParent(frame.totFrame)
		frame.totFrame.HealthBar.UnconsciousText:ClearAllPoints()
		frame.totFrame.HealthBar.UnconsciousText:SetPoint("LEFT", 48, 3)
		
		frame.totFrame.ManaBar:SetSize(46, 7)
		frame.totFrame.ManaBar:ClearAllPoints()
		frame.totFrame.ManaBar:SetPoint("TOPRIGHT", -29, -23)
		frame.totFrame.ManaBar:SetFrameLevel(1)

		fixDebuffs()
	end
end

SkinFrame(FocusFrame)
SkinFrame(TargetFrame)