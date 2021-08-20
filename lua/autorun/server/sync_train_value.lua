local function syncTrain(ply)
	ply:SetNW2Int("iTrain", ply:GetInternalVariable("m_iTrain"))
end

hook.Add("PlayerTick", "SyncTrain", syncTrain)
concommand.Add("hud_synctrainvalue", syncTrain, nil, "Synchronizes the client's iTrain value with the server's (mainly for vehicles).", FCVAR_CLIENTCMD_CAN_EXECUTE)
