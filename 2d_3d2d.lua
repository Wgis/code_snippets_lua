model.Paint = function( self, w, h )
    if ( !IsValid( self.Entity ) ) then return end

    local x, y = self:LocalToScreen( 0, 0 )

    self:LayoutEntity( self.Entity )

    local ang = self.aLookAngle
    if ( !ang ) then
        ang = ( self.vLookatPos - self.vCamPos ):Angle()
    end

    cam.Start3D( self.vCamPos, ang, self.fFOV, x, y, w, h, 5, self.FarZ )

        render.SuppressEngineLighting( true )
        render.SetLightingOrigin( self.Entity:GetPos() )
        render.ResetModelLighting( self.colAmbientLight.r / 255, self.colAmbientLight.g / 255, self.colAmbientLight.b / 255 )
        render.SetColorModulation( self.colColor.r / 255, self.colColor.g / 255, self.colColor.b / 255 )
        render.SetBlend( ( self:GetAlpha() / 255 ) * ( self.colColor.a / 255 ) )
    
        for i = 0, 6 do
            local col = self.DirectionalLight[ i ]
            if ( col ) then
                render.SetModelLighting( i, col.r / 255, col.g / 255, col.b / 255 )
            end
        end
    
        self:DrawModel()
    
        render.SuppressEngineLighting( false )

        cam.Start3D2D(Vector( 0, 210, 180), Angle(0, -90, 90), 0.25)
            draw.SimpleText("I love my mum", "CloseCaption_Bold", 0, 0, Color(255,255,255))
        cam.End3D2D()

    cam.End3D()

    self.LastPaint = RealTime()
end
