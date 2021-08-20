hook.Add("PlayerTick", "SyncTrain", function(ply)
	ply:SetNW2Int("iTrain", ply:GetInternalVariable("m_iTrain"))
end)