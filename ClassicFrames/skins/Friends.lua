if not _G.FriendsFrame then return end

FriendsFrameIcon:SetTexture("Interface\\FriendsFrame\\Battlenet-Portrait")

FriendsFrameTab1:ClearAllPoints()
FriendsFrameTab1:SetPoint("BOTTOMLEFT", 5, -30)

FriendsFrameTab2:ClearAllPoints()
FriendsFrameTab2:SetPoint("LEFT", FriendsFrameTab1, "RIGHT", -15, 0)

FriendsFrameTab3:ClearAllPoints()
FriendsFrameTab3:SetPoint("LEFT", FriendsFrameTab2, "RIGHT", -15, 0)

FriendsFrameTab4:ClearAllPoints()
FriendsFrameTab4:SetPoint("LEFT", FriendsFrameTab3, "RIGHT", -15, 0)