# Physical verification Tools

## 1. Magic

1A. Start magic:

   <img width="1744" height="884" alt="image" src="https://github.com/user-attachments/assets/c16a3154-1ec7-4e88-91c7-b32257153d4b" />

1B. quit magic:

   <img width="1796" height="906" alt="image" src="https://github.com/user-attachments/assets/1120a9f7-f7b3-4218-938e-d73a62e7fb48" />

1C. Other magic commands:

      1. magic -noconsole   // to run without graphics window

      2. magic -dnull -noconsole    // to call magic to run from script

## 2. netgen

2A. start netgen

<img width="893" height="576" alt="image" src="https://github.com/user-attachments/assets/b219fb59-4316-41eb-82fd-25dd0c0d4252" />

2B. exit netgen

<img width="859" height="553" alt="image" src="https://github.com/user-attachments/assets/fa5b16d5-3f21-4c50-9ab6-bb894c8ae0dd" />

2C. Other netgen commands:

      1. netgen -noconsole   // to run without graphics window

## 3. xschem

3A. Start xschem

<img width="1054" height="809" alt="image" src="https://github.com/user-attachments/assets/4bf79092-fba7-42b8-8d77-8d07b766b92b" />

3B. exit xschem:

<img width="758" height="539" alt="image" src="https://github.com/user-attachments/assets/ddb0a32e-aea1-4cb4-83a2-5832f37acdb7" />

## 4. ngspice

4A. start ngspice

<img width="749" height="523" alt="image" src="https://github.com/user-attachments/assets/1e445b6f-7a44-4aa1-aeef-ca11103c85c1" />

4B. exit ngspice

<img width="744" height="449" alt="image" src="https://github.com/user-attachments/assets/4a2991d6-94c0-44c7-800a-cff389159115" />


-----------------------------------------------------------------------------------------------------------------------------------------

## calling tcl script from tools

<img width="718" height="375" alt="image" src="https://github.com/user-attachments/assets/7e75fdbb-976d-4fa6-8f0f-a9b14b8c12dc" />

-----------------------------------------------------------------------------------------------------------------------------------------

## Tools purpose: 

these steps are run for electrical and mechanical devices.

1. xschem: to create schematic, for simulated, Export from xschem to magic to create the layout.

2. magic to finish the layout, extract the netlist from magic and simulating it.

3. run lvs to compare schematic and layout.
   
-----------------------------------------------------------------------------------------------------------------------------------------

## Create New Project directory structure and link SkyWater130 PDK with PV tools

<img width="1091" height="473" alt="image" src="https://github.com/user-attachments/assets/6ed35f05-d90a-484a-8340-cd0ed01d8578" />


#### Test the PV tools for link with PDK:

1. xschem: this will open all table of lots of schematics, introduces to sky130 devices.

<img width="1749" height="781" alt="image" src="https://github.com/user-attachments/assets/f0456a26-ba65-44af-88c5-a166c08b9e12" />

shortcuts:

1.1 use mouse scrolling to Zoom-in / zoom-out.
1.2 press "e" to enter, "ctrl + e" to exit.

Eg: to view standard cells:

<img width="1121" height="841" alt="image" src="https://github.com/user-attachments/assets/4463cdb1-91f7-49fb-8ab7-bc0ae2f0f6e7" />


2. Magic:

2A. check the sky130 at the top to know which technology file the tool has opened. It says skywater130

<img width="1917" height="789" alt="image" src="https://github.com/user-attachments/assets/b90261de-245b-479c-846a-09df515e90b8" />

2B. pyrographic rendering view more accelerated colors:

$ spice -d XR

<img width="1849" height="968" alt="image" src="https://github.com/user-attachments/assets/6301e3f0-c159-4990-8ff6-0734332f3ad4" />

2C. Keys to use / shortcuts:

   1. ctrl + z = zoom-out to center
   2. 
-----------------------------------------------------------------------------------------------------------------------------------------


