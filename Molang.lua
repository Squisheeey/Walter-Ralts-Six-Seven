--implementing math.mod for molang compatibility
function math.mod(x,y)
	return x % y
end

math.random_integer = math.random

--give support for 
Math = {}

--custom Sin and Cosin Functions to convert the numbers to the right type

	
Math.sin = function(a)
	return math.sin(math.rad(a))
end
	
Math.cos = function(a)
	return math.cos(math.rad(a))
end

-- Allow q.anim_time to be interpreted as anim:getTime(), code by Auria

local animlist = {}
for _, v in pairs(animations:getAnimations()) do
   animlist[v:getName()] = v
end
local function err() error('', 4) end 
q = setmetatable({}, {
   __index = function(_, i)
      if i == 'anim_time' then
         local _, traceback = pcall(err)
         local name = traceback:match('^(.-) keyframe')
         return animlist[name] and animlist[name]:getTime()
      end
   end
})
local rot = vec(0,0,0)
local last_rot = rot
local rot_change = vec(0,0,0)
local last_rot_change = vec(0,0,0)
local friction = 0.6
function events.tick()
	last_rot = rot
	rot = (player:getRot().xy_+180) % 360 - 180
	--log(rot)
	last_rot_change = rot_change
	local rot_acc = math.shortAngle(rot, last_rot) * -20
	rot_change = rot_change + rot_acc
	rot_change = rot_change * friction
	--host:setActionbar(tostring(rot_change))
	--log(player:getVelocity():length()*20*60/1000)
end

function events.render(delta)
	rot_delta = math.lerp(last_rot_change, rot_change, delta)
end

function rotmod(input)
	return (input+180)%360 - 180
end
--[[
function rot_delta(lookback)
	currenttick = math.shortAngle(rotmod(player:getRot(-lookback).xy_),rotmod(player:getRot(-lookback-1).xy_))
	nexttick = math.shortAngle(rotmod(player:getRot(-lookback+1).xy_),rotmod(player:getRot(-lookback).xy_))
	log(currenttick)
	return vec(0,0,0)
end
]]
q.r = {
	velocity_x = function(lookback)
		return 0
	end,
	velocity_y = function(lookback)
		return 0
	end,
	velocity_z = function(lookback)
		return 0
	end,
	yaw_change = function(lookback)
		return math.clamp(rot_delta.y/140, -1, 1)
		--return 0
	end,
	pitch_change = function(lookback)
		return math.clamp(rot_delta.x/90, -1, 1)*-1
		--return 0
	end,
	roll_change = function()
		return 0
	end,
	speed = function()
		return 0
	end,
	velocity_right = function()
		return 0
	end,
	velocity_left = function()
		return 0
	end,
	velocity_forward = function()
		return 0
	end,
	velocity_up = function()
		return 0
	end,
	yaw = function()
		return 0
	end,
	pitch = function()
		return 0
	end,
	roll = function()
		return 0
	end,
	input_right = function()
		return 0
	end,
	input_forward = function()
		return 0
	end,
	input_up = function()
		return 0
	end,

	
}
query = q
