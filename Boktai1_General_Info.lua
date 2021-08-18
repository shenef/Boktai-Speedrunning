-- memory adresses
local addr_bossHP = 0x001B5E
local addr_playerHP = 0x03D8FA
local addr_quintBattery = 0x03D820
local addr_quadBattery = 0x03D81E
local addr_tripleBattery = 0x03D81C
local addr_dualBattery = 0x03D81A
local addr_singleBattery = 0x03D818
local addr_posX = 0x03D8F0
local addr_posY = 0x03D8F4
local addr_posZ = 0x03D8F2
local addr_dIGT = 0x03D910
local addr_trapHP = 0x001B6A

local enemyHP = 0
local posXprev, posYprev, posZprev = 0, 0, 0 -- set default coordinates
local bossHPprev = 0 -- set default BossHP
local scale = 1.25 -- set UI scaling | 4x = 0.997 | 5x = 1.25 | 6x = 1.5
local speed_buffer = {} -- table for calculating the speed average
local bossHP_buffer = {} -- table for calculating the dps
console.log("Default window size: 5x, you can change it by changing the \"scale\" variable\n")

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- function to calculate the average speed | 1-index
local function calc_speed_avg(value, buffer, size)
  if value > 255 then value = 16 end -- limit speed to prevent room transitions from skewing the average
  table.insert(buffer, 1, value) -- Insert the new value in the buffer table
  if #buffer == size then buffer[size] = nil end -- If buffer limit is reached chop last value
  local average = 0
  for i = 1, #buffer do  -- Calculate average
    average = average + buffer[i] / #buffer
  end
  return average -- Return the value to be used later as you want, such as display
end

-- function to calculate the damage per second | 1-index
local function calc_dps(value, buffer)
  table.insert(buffer, 1, value) -- Insert the new value in the buffer table
  if #buffer == 60 then buffer[60] = nil end -- If buffer limit is reached remove last value
  -- check how many non-zero damage values are in the buffer:
  local numofattacks = 0
  for k, v in pairs(buffer) do
    if v > 0 then
      numofattacks = numofattacks + 1
    end
  end
  local average = 0
  for i = 1, #buffer do  -- Calculate average
    average = average + buffer[i] / numofattacks
  end
  if average ~= average then average = 0 end -- if NaN then make it 0
  return average -- Return the value to be used later as you want, such as display
end

-- display data on screen
local function displayText()
  gui.text(105 * scale, 42 * scale, "HP:" .. playerHP)
  gui.text(795 * scale, 42 * scale, enemyHP .. " HP")
  gui.text(445 * scale, 400 * scale, "spd:" .. round(spd3D, 3))
  gui.text(445 * scale, 415 * scale, "avg:" .. round(calc_speed_avg(spd3D, speed_buffer, 61), 3))
  gui.text(445 * scale, 430 * scale, numofattacks .. "|" .. round(calc_dps(damage, bossHP_buffer), 3) .. " dps")
  gui.text(5 * scale, 625 * scale, "dIGT: " .. dIGT)
  gui.text(690 * scale, 618 * scale, quintBattery)
  gui.text(752 * scale, 618 * scale, quadBattery)
  gui.text(818 * scale, 618 * scale, tripleBattery)
  gui.text(882 * scale, 618 * scale, dualBattery)
  gui.text(619 * scale, 556 * scale, singleBattery)
end

-- main loop
local function main()
  -- read HP values from memory
  playerHP = memory.read_u16_le(addr_playerHP, "EWRAM")
  bossHP = memory.read_u16_le(addr_bossHP, "EWRAM")
  trapHP = memory.read_u16_le(addr_trapHP, "EWRAM")

  if trapHP > 0 then enemyHP = trapHP
  elseif bossHP > 0 then enemyHP = bossHP
  else enemyHP = "-"
  end

  dIGT = memory.read_u16_le(addr_dIGT, "EWRAM")

  damage = bossHPprev - bossHP

  -- read Battery values from memory
  quintBattery = memory.read_u16_le(addr_quintBattery, "EWRAM")
  quadBattery = memory.read_u16_le(addr_quadBattery, "EWRAM")
  tripleBattery = memory.read_u16_le(addr_tripleBattery, "EWRAM")
  dualBattery = memory.read_u16_le(addr_dualBattery, "EWRAM")
  singleBattery = memory.read_u16_le(addr_singleBattery, "EWRAM")

  -- read coordinates from memory
  posX = memory.read_u16_le(addr_posX, "EWRAM")
  posY = memory.read_u16_le(addr_posY, "EWRAM")
  posZ = memory.read_u16_le(addr_posZ, "EWRAM")

  -- calculate speed per direction and in 3D
  spdX = math.abs(posX - posXprev)
  spdY = math.abs(posY - posYprev)
  spdZ = math.abs(posZ - posZprev)
  spd3D = math.sqrt(spdX^2 + spdY^2 + spdZ^2)

  displayText()
end

-- at end of frame, set the new default coordinates to compare to
event.onframeend(function()
  posXprev = posX
  posYprev = posY
  posZprev = posZ
  bossHPprev = bossHP
end)

-- once everything is done, let the emu advance a frame
while true do
  main()
  emu.frameadvance()
end
