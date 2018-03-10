local glow = math.abs(math.sin(CurTime() * 2) * 255); -- 1 = speed, 2 = max value
local flashingRed = Color(glow, 0, 0); -- Red
local flashingGreen = Color(0, glow, 0); -- Green
local flashingBlue = Color(0, 0, glow); -- Blue
