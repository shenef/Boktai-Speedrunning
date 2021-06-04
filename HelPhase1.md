# Hel Phase 1 Analysis
## Memory Addresses
Otenko Charge Memory Address: `EWRAM 0x00766C`

## Internal Values
19200 energy needed per tower (76800 in total)

## Charging Speeds
- Minimum charging speed: 6 energy/frame (when using the Gun del Hell)  
- Default charging speed: 12 energy/frame  
- Maximum charging speed: 17 energy/frame  
(That can be achieved either by spreading at otenko or using a RSG and topping it off with a spread)

Otenko charging times per charging speed:
- 106,66 sec at 12 (no RSG, no spread)  
- 85,33 sec at 15 (full fight with only RSG)  
- 75,29 sec at 17

## Charging Interruptions
Otenko does not charge 
- during a Hel attack 
- when he is down after an attack
- when traveling between towers
- during the summon animation

## Frame effects
Different Frames make the charging speed rise to the max at different speeds
- Spread frames are fast
- Sword frames generally seem a little slower than Spread frames
- Shotgun frames require constant spamming but aren't too bad, they bump it to 17 pretty much instantly
- Rotating frames are just bad  
(they only increase when the spread is covering otenko)
- Guardian seems overpowered  
(Note: i don't have a rate of change for the charging speed per frame, it's an estimation from looking at the diff)

Frames with no Effect:
- Fighter
- Knife, Dagger, Gradius, Calamity
- Juggler, Wizard, Beatmania
