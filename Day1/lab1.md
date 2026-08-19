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
   2. mouse center button or press "p" to select the layer of material from right hand side boxes

Eg: poly is selected

<img width="1599" height="882" alt="image" src="https://github.com/user-attachments/assets/8dbb3153-9c1d-44a9-a00b-8e93be908209" />

2D. click the mouse right button to select the area, 
   
   click mouse center button to select type of material,

   select area click on empty space to delete/erase the layer of material

<img width="1546" height="884" alt="image" src="https://github.com/user-attachments/assets/002e5e55-8215-4955-a0f3-b472a2ca9404" />

2E. click on devices1 and make changes if required.

<img width="1770" height="920" alt="image" src="https://github.com/user-attachments/assets/b55467c2-0d9f-4fd7-ae28-f8dcc3461df9" />

 2F. without guard ring

<img width="1739" height="937" alt="image" src="https://github.com/user-attachments/assets/bdeac75c-6849-4b4a-84d5-86251156a0f4" />

2G. Press 'e' to edit + maneuver on cell, click mouse button + press 's' to select, in the cmd window type "what" to know the type of material

<img width="1915" height="897" alt="image" src="https://github.com/user-attachments/assets/a7675c97-5440-42e8-b57a-1c73bef50975" />


 3.  xschem link with pdk:

type xschem ---> file --> new schematic ---> press insert key to view available skywater pdk

<img width="1402" height="909" alt="image" src="https://github.com/user-attachments/assets/293a455f-bf4c-4d8f-b930-ef3d8a6d80bb" />

select inverter

<img width="1400" height="895" alt="image" src="https://github.com/user-attachments/assets/f115d313-90bf-4b44-83cc-4b4f661cc6b1" />

Press insert key again to slect pfet -> ok

<img width="1253" height="902" alt="image" src="https://github.com/user-attachments/assets/ba5d551a-28ef-4207-808e-3db641a57e07" />

now the next task is to select the ipin, opin, iopin from library --> for this step 2 times back and select from library.

<img width="1265" height="895" alt="image" src="https://github.com/user-attachments/assets/d230abc9-b0b7-41dc-bad9-00e71da00cc8" />

Click a point to wire, press "w" to wire between 2 points.

<img width="1237" height="897" alt="image" src="https://github.com/user-attachments/assets/083b4280-21ca-4313-a48c-204c0819623a" />

click on the name to update into sensible name

<img width="1082" height="656" alt="image" src="https://github.com/user-attachments/assets/89f9556a-f7b9-461d-872d-0ebd518759cd" />

Next step is to add properties to each of them, starting from nfet as shown below by selecting nfet and press "q"

<img width="1119" height="671" alt="image" src="https://github.com/user-attachments/assets/3e101db1-b430-48db-ba3d-62ce9e020210" />

follow same steps for pfet

<img width="1117" height="663" alt="image" src="https://github.com/user-attachments/assets/dec0a844-3905-4ecd-99c3-446133a4834f" />

<img width="1093" height="660" alt="image" src="https://github.com/user-attachments/assets/4abb3e02-ee5d-42cc-9e92-484c8f151117" />

NOTE: netlist is case insensitive, but magic is case sensitive

Next step is to save in default directory as "invester.sch" using file --> save as option

<img width="1079" height="678" alt="image" src="https://github.com/user-attachments/assets/46c931c5-ae41-47ff-8c31-58eff1d44831" />

Press up to go to default directory, now click on inveter.sch, now you can list and see the schematic you just now created.

<img width="1390" height="870" alt="image" src="https://github.com/user-attachments/assets/a205b1b5-de4e-425f-ba2b-90a40af7964b" />


3B. Make symbol from schematic:

<img width="948" height="660" alt="image" src="https://github.com/user-attachments/assets/a1ae6f4f-2b2e-4f17-9916-cc71ff516eb9" />

Next step is testbench schematic, in this step, click new -> schematic (key point) --> insert --> inverter.sym --> use "q" and "w" to rename and wire,
use insert key to add in, out, GND and rename as per requirement.

<img width="1340" height="697" alt="image" src="https://github.com/user-attachments/assets/f50038ce-1089-446f-82a7-85e27b294c2e" />

change the voltage to 1.8v for V2

<img width="974" height="661" alt="image" src="https://github.com/user-attachments/assets/e9cf4aa8-68e4-47a8-9b56-9a7f079031c5" />

chaneg the voltage for V1 as "PWL(0 0 20n 0 900n 1.8)" // this means iitially starts at 0v, from 20n to 900n the voltage reaches from 0 to 1.8V

<img width="958" height="695" alt="image" src="https://github.com/user-attachments/assets/adfb1e6b-e6fd-4397-bae2-d89493255150" />

Insert 2 code_shown.sym using insert -> devices option.

<img width="1337" height="669" alt="image" src="https://github.com/user-attachments/assets/9de23d57-06e7-4590-93c5-504da845247d" />

change s1 value to ".lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"

<img width="873" height="617" alt="image" src="https://github.com/user-attachments/assets/36a92ea2-d81e-407d-9304-2fbd6ab7b1b3" />

To run transient simulation in 1ms, for s2, change the value as shown below, using q option to edit

```
      valse=".control
      tran 1n 1u
      plot V(in) V(out)
      .endc"
```

<img width="913" height="631" alt="image" src="https://github.com/user-attachments/assets/b8ca467f-f6a2-41fa-8d59-7289c72b9f20" />

same as inverter_tb.sym

<img width="913" height="726" alt="image" src="https://github.com/user-attachments/assets/8a6ea392-cf59-4a92-ab6c-ac9ab82dc1f4" />

from options --> select spice netlist

<img width="955" height="607" alt="image" src="https://github.com/user-attachments/assets/87275ce8-2640-4d0d-8c9b-063b64b97979" />

save as inverter_tb.sch --> on right hand corner --> press netlist --> simulate (this takes a while to create input/output waveform)

<img width="495" height="345" alt="image" src="https://github.com/user-attachments/assets/eaa5e12d-78da-4ac9-b087-71e7b82fad3e" />

we can see, the lines will cross about 1.8v

<img width="1448" height="534" alt="image" src="https://github.com/user-attachments/assets/bf5f74e1-748f-4d5f-af66-677254f360ad" />

Now the circuit is functionally validated to create the layout

next we need a netlist, not the complete testbench but just the circuit itself.

from simulation, select toplevel LVS, after clicking it, again check if tick mark is added.

<img width="625" height="650" alt="image" src="https://github.com/user-attachments/assets/4e8dea03-1693-40b3-9d67-4d2b36d0c36b" />

click on netlist again and exit

<img width="1130" height="675" alt="image" src="https://github.com/user-attachments/assets/2e932f43-8c1b-4144-b2a0-5f81c8006613" />

4. Magic commands:

open magic from ../mag directory, click on file --> open --> inverter.spice

<img width="1502" height="869" alt="image" src="https://github.com/user-attachments/assets/9d8a2cd0-fae6-4461-83fb-f1acf8fb9098" />

As it will be zoom-in, for complete view, press "v", to get following complete view:

<img width="1510" height="892" alt="image" src="https://github.com/user-attachments/assets/b9a17899-d33f-4f4b-a4f3-7988206fea31" />

use "i key to select device, use ":what" to know details.

<img width="1289" height="888" alt="image" src="https://github.com/user-attachments/assets/1ced6150-1df7-464b-be11-501e741298ad" />

again press "i" and followed by "ctrl + p" to open parameters of the device

now the task is to move the ells, for this select using "i" key, move the mouse to the new point and press "m" / "shift + m", "nmm" / "shift + m" / "M" key will not work, use "i" to select and in cmd line of magic, type "move" + "enter" key. 

similarly for pins use "s" to select instead of "i", then "m" or "move" command + enter.

we are able to move both device and pin:

<img width="1181" height="755" alt="image" src="https://github.com/user-attachments/assets/4252faa9-cacc-441e-951a-140c9a7cd506" />

placing pins and devices:

<img width="437" height="593" alt="image" src="https://github.com/user-attachments/assets/8e70aef6-0b5b-4df0-bf82-7b8c5b0f14f2" />

now that we know how layout works, we need to set parameters when required, which is not available in schematic.

<img width="1189" height="822" alt="image" src="https://github.com/user-attachments/assets/f0b0786c-ca81-44cb-852a-733d1252e9d8" />

nfet changes:  (check is this bottom or top guard to set it to 100)

<img width="1202" height="767" alt="image" src="https://github.com/user-attachments/assets/a1df8626-faaf-408c-a039-bc0b4c8f6253" />

pfet changes:  (check is this bottom or top guard to set it to 100)

<img width="1148" height="775" alt="image" src="https://github.com/user-attachments/assets/aca178c5-c4e1-4cb9-a677-d59bd334294c" />

updated location of devices and pins as in video: 

NOTE: check why different colors nfet vs pfet in video vs in cloud magic tool

<img width="453" height="603" alt="image" src="https://github.com/user-attachments/assets/2d4c9203-0f73-4b31-a002-ef2d0978d3c1" />

draw wire, by selecting step by step as show below, first between pfet and vss, copy or create new between nfet and vdd

<img width="1239" height="752" alt="image" src="https://github.com/user-attachments/assets/73a47ae2-472b-477c-8e3a-32fb0f2b6c33" />

If all ready, then we are done with inverter layout. NOTE: DRC reduced to zero.

<img width="1157" height="740" alt="image" src="https://github.com/user-attachments/assets/192d56df-d06b-431e-a7a2-22d2cd5e7386" />

Save and Autowrite:

<img width="1149" height="625" alt="image" src="https://github.com/user-attachments/assets/80736556-363a-4f6a-80b3-eebcf2d1979c" />

in local window of magic, run

extract to local
extract all

<img width="1673" height="715" alt="image" src="https://github.com/user-attachments/assets/d6fa6de2-2c47-47a6-837e-7cbb357951e6" />

Next step: "ext2spice lvs" for lvs purpose, then "ext2spice" for netlist

<img width="1678" height="719" alt="image" src="https://github.com/user-attachments/assets/ed72863c-f9e5-4461-9f93-6d4460793625" />

to see files generated in magic folder, type "ls" cmd

<img width="716" height="129" alt="image" src="https://github.com/user-attachments/assets/37b9aecb-7cdf-489c-a19d-1ac1e1a43965" />

To remove unwanted files:

<img width="927" height="831" alt="image" src="https://github.com/user-attachments/assets/d4a43d5e-9115-4c9c-b7ae-7ab83810c7e6" />

5. LVS check:

<img width="936" height="327" alt="image" src="https://github.com/user-attachments/assets/52b90432-ae23-4519-b584-4dd6c8b6062d" />

<img width="738" height="906" alt="image" src="https://github.com/user-attachments/assets/53d3926f-58ca-4ad7-9128-76f739e32d3a" />

NOTE: DRC is week with magic.

6. Capacitance extraction:

run following commands from mag folder:

<img width="1434" height="909" alt="image" src="https://github.com/user-attachments/assets/3b942462-d18e-4d24-8f97-08c699e048cc" />

list of capacitances inside inverter:

<img width="921" height="898" alt="image" src="https://github.com/user-attachments/assets/bad293ab-1613-4267-900c-22f623913ec2" />

7. Simulate using testbench:

copy the files xschem/inverter_tb.spice to mag folder and edit

<img width="1662" height="894" alt="image" src="https://github.com/user-attachments/assets/111fb908-0878-4b5c-a51f-1e0b2541d7e6" />

8. Layout extracted netlist

<img width="720" height="551" alt="image" src="https://github.com/user-attachments/assets/b0f7562f-a667-4c71-9e54-e452ff9571ec" />

Same as earlier simulation wrt vtg

<img width="1588" height="926" alt="image" src="https://github.com/user-attachments/assets/8ec51460-09c3-4156-b0df-30ce49ac3ba2" />

-----------------------------------------------------------------------------------------------------------------------------------------


