local function GetMaterialFromURL( url, w, h, callback )
	local html = vgui.Create( "DHTML" )
	html:SetSize( w, h )
	html:SetPaintedManually( true )
	html:SetKeyBoardInputEnabled( false )
	html:SetMouseInputEnabled( false )
	html:SetAllowLua( true )
	html:OpenURL( url )
	html:SetVisible( false )

	html:UpdateHTMLTexture()
	
	hook.Add( "Think", "waitForCache"..url, function()
		if ( !html:IsLoading() ) then
			html:UpdateHTMLTexture()
			
			local mat = html:GetHTMLMaterial()
			
			callback( mat )
			
			html:Remove()
			hook.Remove( "Think", "waitForCache"..url )
		end
	end )
end

hook.Add( "Initialize", "loadMaterials", function()
	GetMaterialFromURL( "http://gunfireempire.com/home/mats/logos/med.png", 400, 120, function( mat )
		LOGO_BASE = mat
	end )
end )

hook.Add( "HUDPaint", "drawLogo", function()
	if ( !LOGO_BASE ) then return end
	
	surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial( LOGO_BASE )
	surface.DrawTexturedRect( 555, 5, 400, 120 )
end )
