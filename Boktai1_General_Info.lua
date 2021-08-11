-- memory adresses
local addr_BossHP = 0x001B5E
local addr_PlayerHP = 0x03D8FA
local addr_quintBattery = 0x03D820
local addr_quadBattery = 0x03D81E
local addr_tripleBattery = 0x03D81C
local addr_dualBattery = 0x03D81A
local addr_singleBattery = 0x03D818
local addr_posX = 0x03D8F0
local addr_posY = 0x03D8F4
local addr_posZ = 0x03D8F2

local posXprev, posYprev, posZprev = 0, 0, 0 -- set default coordinates
local scale = 1.25 -- set UI scaling | 4x = 0.997 | 5x = 1.25 | 6x = 1.5
local speed_buffer = {} -- prepare table for calculating the speed average
console.log("Default window size: 5x, you can change it by changing the \"scale\" variable\n") -- warning about window scaling

-- create function to calculate a rolling average | 1-index
local function buffer_average(value, buffer, size)
  table.insert(buffer, 1, value) -- Insert the new value in the buffer table
  if #buffer == size then buffer[size] = nil end -- Chop last value in buffer if buffer limit size is reached 
  local average = 0
  for i = 1, #buffer do  -- Calculate average
    average = average + buffer[i] / #buffer
  end
  return average -- Return the value to be used later as you want, such as display
end

-- display data on screen
local function displayText()
  gui.text(445 * scale, 400 * scale, "spd:" .. math.floor(spd3D * 1000) / 1000)
  gui.text(445 * scale, 415 * scale, "avg:" .. math.floor(buffer_average(spd3D, speed_buffer, 60) * 1000) / 1000)
  gui.text(105 * scale, 42 * scale, "HP:" .. PlayerHP)
  gui.text(550 * scale, 42 * scale, "BossHP:" .. BossHP)
  gui.text(693 * scale, 618 * scale, quintBattery)
  gui.text(781 * scale, 618 * scale, quadBattery)
  gui.text(846 * scale, 618 * scale, tripleBattery)
  gui.text(888 * scale, 618 * scale, dualBattery)
  gui.text(619 * scale, 557 * scale, singleBattery)
end

-- at end of frame, set the new default coordinates to compare to
event.onframeend(function()
  posXprev = posX
  posYprev = posY
  posZprev = posZ
end)

-- main loop
local function main()
  -- read HP values from memory
  PlayerHP = memory.read_u16_le(addr_PlayerHP, "EWRAM")
  BossHP = memory.read_u16_le(addr_BossHP, "EWRAM")

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
  spd3D = math.sqrt(spdX * spdX + spdY * spdY + spdZ * spdZ)

  displayText()
end

-- once everything is done, let the emu advance a frame
while true do
  main()
  emu.frameadvance()
end
