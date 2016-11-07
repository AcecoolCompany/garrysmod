local meta = FindMetaTable( "Angle" )

-- Nothing in here, still leaving this file here just in case

--[[---------------------------------------------------------
	Angle Snap to nearest interval of degrees
-----------------------------------------------------------]]
function meta:SnapTo( component, degrees )

	if ( degrees == 0 ) then ErrorNoHalt( "The snap degrees must be non-zero.\n" ); return self; end
	if ( !self[ component ] ) then ErrorNoHalt( "You must choose a valid component of Angle( p || pitch, y || yaw, r || roll ) to snap such as Angle( 80, 40, 30 ):SnapTo( \"p\", 90 ):SnapTo( \"y\", 45 ):SnapTo( \"r\", 40 ); and yes, you can keep adding snaps.\n" ); return self; end

	self[ component ] = math.Round( self[ component ] / degrees ) * degrees
	self[ component ] = math.NormalizeAngle( self[ component ] )

	return self

end


--[[---------------------------------------------------------
	Angle Snap to nearest interval of degrees for all components.. SnapTo handles error checking, therefore we can skip it in this helper function.
	ie instead of 
		local ang = ent:GetAngles( ):SnapTo( "p", 45 ):SnapTo( "y", 45 ):SnapTo( "r", 45 );
	it becomes
		local ang = ent:GetAngles( ):SnapAllTo( 45, 45, 45 );
-----------------------------------------------------------]]
function meta:SnapAllTo( pitch, yaw, roll )

	return self:SnapTo( "pitch", pitch ):SnapTo( "yaw", yaw ):SnapTo( "roll", roll );

end
