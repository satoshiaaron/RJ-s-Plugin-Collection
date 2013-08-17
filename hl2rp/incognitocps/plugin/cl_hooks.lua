local PLUGIN = PLUGIN;

Clockwork.config:AddToSystem("CP identities hidden", "hide_cp_identities", "Whether or not Civil Protection identities are hidden.");
Clockwork.config:AddToSystem("CP identity length", "cp_id_length", "The amount of numbers the Civil Protection ID contains.");

-- A function to get a Combine's hidden ID.
function PLUGIN:HiddenCombineID(player, name)
	local idLength = string.rep("%d", Clockwork.config:Get("cp_id_length"):Get());
	local xLength = string.rep("X", Clockwork.config:Get("cp_id_length"):Get());
	
	incognitoName = string.gsub(name, idLength, ""..xLength.."");
	
	return incognitoName;
end;

-- Called when the scoreboard's player info should be adjusted.
function PLUGIN:ScoreboardAdjustPlayerInfo(info)
	if (Clockwork.config:Get("hide_cp_identities"):Get()) then
		if (!Schema:PlayerIsCombine(Clockwork.Client) and Schema:PlayerIsCombine(info.player)) then
			info.name = PLUGIN:HiddenCombineID(info.player, info.name);
		end;
	end;
end;

-- Called when the chat box info should be adjusted.
function PLUGIN:ChatBoxAdjustInfo(info)
	if (Clockwork.config:Get("hide_cp_identities"):Get()) then
		if (IsValid(info.speaker)) then
			if (!Schema:PlayerIsCombine(Clockwork.Client) and Schema:PlayerIsCombine(info.speaker)) then
				info.name = PLUGIN:HiddenCombineID(info.speaker, info.name);
			end;
		end;
	end;
end;

-- Called when the target player's name is needed.
function PLUGIN:GetTargetPlayerName(player)
	if (Clockwork.config:Get("hide_cp_identities"):Get()) then
		if (!Schema:PlayerIsCombine(Clockwork.Client) and Schema:PlayerIsCombine(player)) then
			return PLUGIN:HiddenCombineID(player, player:Name());
		end;
	end;
end;