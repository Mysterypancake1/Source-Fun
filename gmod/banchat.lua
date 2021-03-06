hook.Add( "PlayerSay", "BanCommand", function( ply, text )
	if ply:IsAdmin() and string.sub( string.lower( text ), 1, 4 ) == "!ban" then
		local target
		local args = string.Split( string.sub( text, 6 ), " " )
		for _, v in ipairs( player.GetHumans() ) do
			if v:Nick() == args[ 1 ] then
				target = v
			end
		end
		if IsValid( target ) then
			target:Ban( tonumber( args[ 2 ] or 0 ) )
		end
		return ""
	end
end )
