# Purification Analysis
## Memory Addresses
- Top Left Tower Memory Address: `EWRAM 0x008436`  
- Bottom Right Tower Memory Address: `EWRAM 0x0086C6`  
- Top Right Tower Memory Address: `EWRAM 0x008956`  
- Bottom Left Tower Memory Address: `EWRAM 0x008BE6`  
- Purified Boss Health Memory Address: `EWRAM 0x03DAF4`

## Internal Values
Tower Values range from 0 to 6500  
0 to 1080 deals damage (hereby considered active)  
1081 to 6499 deals no damage (hereby considered not active)  
6500 is turned off and has to be manually turned back on.

The towers continuously increase their value at a seemingly random speed.  
Shooting/Spreading at a tower reduces the value by an amount that varies with the frame and probably also the lens.

If a Tower is frozen or burning it does not deal damage.  
Somewhere between 1070 and 1080 the beam starts to flicker, when flickering the beam seemingly only deals damage when the game displays a frame that shows the beam active. At 1081 and above it can flicker but i have never seen it deal damage.

## 4 Towers
all Towers active: 
- 1 Lux: 24 dmg/frame
- 2 Lux: 32 dmg/frame
- 3 Lux: 40 dmg/frame
- 4 Lux: 48 dmg/frame
- 5 Lux: 56 dmg/frame
- 6 Lux: 64 dmg/frame
- 7 Lux: 72 dmg/frame
- 8 Lux: 80 dmg/frame

8 Lux, not all Towers active:
- 8 Lux with 4/4 towers active: 80 dmg/frame
- 8 Lux with 3/4 towers active: 30 dmg/frame
- 8 Lux with 2/4 towers active: 20 dmg/frame
- 8 Lux with 1/4 towers active: 10 dmg/frame

## 2 Towers
all Towers active: 
- 1 Lux: 12 dmg/frame
- 2 Lux: 16 dmg/frame
- 3 Lux: 20 dmg/frame
- 4 Lux: 24 dmg/frame
- 5 Lux: 28 dmg/frame
- 6 Lux: 32 dmg/frame
- 7 Lux: 36 dmg/frame
- 8 Lux: 40 dmg/frame

8 Lux, not all Towers active:
- 8 Lux with 2/2 towers active: 40 dmg/frame
- 8 Lux with 1/2 towers active: 10 dmg/frame
