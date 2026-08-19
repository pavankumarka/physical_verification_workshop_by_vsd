# Day 1 - Introduction to SKY130 and Open Source Tools

###  PV_D1SK1 - Introduction to SkyWater PDKs and opensource EDA tools

<details>
<summary><b>L1 - Introduction to Skywater PDK</b></summary>

PDK (Process Design Kit) = a collection of files provided by a semiconductor foundry that tells EDA tools how to design and verify circuits for a specific technology node.

It typically contains:
- Design Rules (DRC) → minimum width, spacing, enclosure, etc. 
- Device Definitions → NMOS, PMOS, resistors, capacitors. 
- PCells → parameterized layout cells. 
- LVS Decks → compare schematic vs layout. 
- Extraction Rules (PEX) → extract parasitics (R, C). 
- Technology Files → layer definitions, colors, display settings.

- 
Skywater 130 PDK : Open source PDK from google. Here we have open source PDK, which consists of 
Documentation: https://skywater-pdk -- 136.org.readthedocs.build

PDK Library and files https://github.com/google/skywater-pdk
If one needs to be a part of the community, you can join the same like Community slack https://join.skywater.tools

</details>

<details>
<summary><b>L2 - Opensource EDA Tools</b></summary>

<img width="679" height="373" alt="image" src="https://github.com/user-attachments/assets/1da4244d-3d5d-4464-8597-0df2511e5592" />


Basically, the open source PDK repository shows here takes the Skywater 130 PDK. It clones skywater 130 PDK to here. 


The open source tools supported by open PDKs are: 


1.	magic : Magic is an open-source VLSI layout editor used for layout design, DRC, and extraction.
2.	KLayout: KLayout is used for viewing, editing, and verifying IC layouts
3.	OpenLane: OpenLane automates the complete digital ASIC flow from RTL to GDS
4.	Xschem: xschem is used for schematic entry and netlist generation.
5.	Netgen: Netgen checks whether the layout matches the schematic
6.	Ngspice: ngspice is used to simulate circuit behavior before fabrication
7.	Qflow: Qflow is an open-source RTL-to-GDS digital design flow
8.	IRSIM: IRSIM performs transistor-level digital logic simulation.
9.	XCircuit: XCircuit is a schematic drawing and netlist-generation tool

<img width="940" height="508" alt="image" src="https://github.com/user-attachments/assets/cc934c81-b177-45d6-a31f-061f5206d94f" />


</details>

<details>
<summary><b>L3 - Understanding Skywater PDK – Layers</b></summary>

At every point of time for validation purposes, we need to know about layers used inside the whole PDK for debugging. The layers used inside the sky water PDK are;

<img width="940" height="505" alt="image" src="https://github.com/user-attachments/assets/751ec99e-8e64-4968-974c-e88188393c0f" />

Titanium nitride has high resistance. So it is used during the initial stages only. 

<img width="747" height="544" alt="image" src="https://github.com/user-attachments/assets/f8efd3ca-da2b-403b-b571-d9e88ed40e01" />

This figure shows the front-end layers of the SKY130 process, i.e., the layers used to build the transistor and make the first level of connections before Metal1.

1. N-well
•	Region where PMOS transistors are built. 
•	Created inside the p-type substrate.
2. P-well
•	Region where NMOS transistors are built. 
•	Used to isolate NMOS devices.
3. P-diffusion (P+ diffusion)
•	Source/drain region of a PMOS. 
•	Heavily doped P-type area inside the N-well.
4. N-diffusion (N+ diffusion)
•	Source/drain region of an NMOS. 
•	Heavily doped N-type area inside the P-well.
5. N-tap
•	N+ region inside N-well. 
•	Used to connect the N-well to VDD.
6. P-tap
•	P+ region inside P-well. 
•	Used to connect the P-well/substrate to GND.
7. Polysilicon (Poly)
•	Forms the transistor gate. 
•	When Poly crosses Active (Diffusion), a MOS transistor is created.
9. Local Interconnect (LI)
•	Titanium Nitride (TiN) routing layer. 
•	Used for short local connections near transistors. 
•	Exists between device layers and Metal1.

<img width="940" height="612" alt="image" src="https://github.com/user-attachments/assets/444538ef-d2b9-4b0f-96da-f4b719fcb27c" />

High Voltage Layer can resist higher voltage. If used under the gate as a gate oxide can bear upto a voltage of 5V in this PDK. 

<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/ede974fc-36f0-422e-9169-c150b31f7e7f" />

This is a AI generated Image showing how MiM capacitors uses higher metal layer as the capacitor plates. 

<img width="732" height="588" alt="image" src="https://github.com/user-attachments/assets/50bc8ef5-b066-40ec-8892-4f6d320bfe77" />

<img width="940" height="560" alt="image" src="https://github.com/user-attachments/assets/a976121d-2f2d-433f-be5d-ff2cd79b1e16" />

AI generated image for Bump PAD.

<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/240bdea6-3933-49b7-83ff-a0d8dac753c9" />

### Flip-Chip / WLCSP Packaging 

In traditional packaging, the chip is placed upright and connected to the package using thin gold wires. In Flip-Chip or WLCSP (Wafer Level Chip Scale Package), the chip is turned upside down so that its pads face the PCB directly. Small solder bumps are formed on the chip pads, allowing the chip to connect directly to the PCB without wire bonds. The signal path becomes much shorter:
Transistor → Metal Layers → Pad → RDL → UBM → Solder Bump → PCB
This results in lower resistance, lower inductance, better power delivery, higher speed, and a smaller package size. The RDL (Redistribution Layer) is used to reroute pad locations, while the UBM (Under Bump Metallization) provides a reliable surface for the solder bump to attach. WLCSP is commonly used in smartphones, wearables, IoT devices, and other space-constrained high-performance applications.

</details>

<details>
<summary><b>L4 - Understanding Skywater PDK – Devices</b></summary>

These are the different kinds of devices supported in skywater PDK. The basic structure is as follows:

<img width="709" height="600" alt="image" src="https://github.com/user-attachments/assets/fea4149b-9ec4-4453-bb56-d39a57be9711" />

<img width="744" height="509" alt="image" src="https://github.com/user-attachments/assets/ce8670ba-65e2-40e7-96de-8bceff36429a" />

<img width="735" height="545" alt="image" src="https://github.com/user-attachments/assets/a1bae8b9-6623-4d48-a149-84c14202da81" />

<img width="713" height="523" alt="image" src="https://github.com/user-attachments/assets/8f0d0cb8-83fc-4c40-981a-04c94fef14e3" />

<img width="940" height="282" alt="image" src="https://github.com/user-attachments/assets/3faf0ab7-8bae-462d-892e-4acf5df9d599" />

</details>

<details>
<summary><b>L5 - Understanding Skywater PDK Libraries</b></summary>

There re 3 types of Device Libraries in Skywater PDK.


1.	Digital Standard cells
This contains the standard cells gds and files which are used by the digital synthesis flows such as liberty,timing files, technology files, lef files, verilof & spice netlist.

<img width="940" height="774" alt="image" src="https://github.com/user-attachments/assets/7f0d6ee7-bea7-49b9-a658-0a4cbfa71fbf" />

_nor2_2 represents 2 input nor gate with relatively current density value equals 2. Its not a specific value it can be relative to others.

<img width="940" height="768" alt="image" src="https://github.com/user-attachments/assets/f7451f98-6694-4d60-b0e1-662241041b51" />

<img width="940" height="802" alt="image" src="https://github.com/user-attachments/assets/4a6d7a1d-8790-4465-87b9-bf710d04b2bf" />

An overlay cell is a layout-only cell, typically consisting of metal and via layers, that is placed on top of a base IO cell to create optional electrical connections such as pad-to-power or ESD-clamp-to-power connections. Overlay cells improve flexibility and reduce library complexity by allowing the same base IO cell to be reused in multiple configurations without creating separate cell variants.


</details>

<details>
<summary><b>L6 - Opensource Tools And Flows</b></summary>

<img width="940" height="451" alt="image" src="https://github.com/user-attachments/assets/91e4e4a7-8891-49b8-a5cb-33593924566d" />

The schematic will be formed from xschem. It is integrated with ngspice & gaw.

<img width="940" height="384" alt="image" src="https://github.com/user-attachments/assets/ba8d17d9-5d8a-4a03-984a-ad5349a9eb21" />

Layout is formed from generate(magic)
Steps to create the Layout
1.	Import the netlist of schematic in Layout tool.
2.	Then the layout has to be drc clean
3.	It has to be LVS clean

<img width="706" height="534" alt="image" src="https://github.com/user-attachments/assets/fc4b9396-1cb8-4f7a-b868-53c923f9205d" />

If these 2 netlists are equal, then LVS will be clean.

</details>

### PV_D1SK2 - Tool installations and basic DRC/LVS design flow

<details>
<summary><b>L1 - Check Tool Installations</b></summary>

<img width="940" height="464" alt="image" src="https://github.com/user-attachments/assets/3419fe97-bc40-4986-a055-c1e01930e038" />

Open the terminal & type “magic”. This will open 2 windows which are console & a layout window. 

<img width="940" height="488" alt="image" src="https://github.com/user-attachments/assets/73b7a632-8400-4f62-87a6-33ea46196f98" />

Netgen has only command line interface.

<img width="940" height="428" alt="image" src="https://github.com/user-attachments/assets/ef06445d-166d-4053-abba-ca5e7b2380a9" />

<img width="940" height="344" alt="image" src="https://github.com/user-attachments/assets/9a3dc649-9973-4fba-9ae6-c07b7f5e35ef" />

Other commands used are 
1.	netgen -noconsole
2.	magic dnull -noconsole
3.	ngspice -b

<img width="879" height="690" alt="image" src="https://github.com/user-attachments/assets/26996b9b-eed1-4d89-a1f1-af0e1bd05a1b" />

</details>


<details>
<summary><b>L2 - Creating Sky130 Device Layout In Magic</b></summary>

The whole exercises can be divided into mainly 4, they are
1.	Creating a schematic in “xschem”.
2.	Exporting the netlist & importing in magic to create the layout.
3.	Extracting the netlist from magic & simulating it.
4.	Run LVS for the same.


For the xschem, we need to copy the inverter setup which actually looks like,

<img width="940" height="343" alt="image" src="https://github.com/user-attachments/assets/5dea3b2a-bd85-41f4-94bb-a863db54a2b2" />

<img width="940" height="459" alt="image" src="https://github.com/user-attachments/assets/35aed75a-450f-4de3-bb43-6c7cb1e6ed99" />

<img width="940" height="495" alt="image" src="https://github.com/user-attachments/assets/9b5bad91-0ccb-4682-8119-8348205b97ee" />

To select any of the cells, press to any of the cells & “e”


To come out of the window “cntrl+e”

<img width="701" height="70" alt="image" src="https://github.com/user-attachments/assets/24301d75-1d8e-49b7-a7c7-44b3e11a4648" />

<img width="940" height="462" alt="image" src="https://github.com/user-attachments/assets/32bd09a0-dabf-4798-a488-c1bfc575ec4b" />

If we can see the technology name & the layers as coloured square boxes, the setup is successful.

<img width="557" height="79" alt="image" src="https://github.com/user-attachments/assets/09986bd9-835c-43d5-9737-64c6d1d58910" />

This for a good graphical view of the windows.

<img width="835" height="731" alt="image" src="https://github.com/user-attachments/assets/c5c6f8bf-5725-4afe-a3b1-4c5578bf52dc" />

How to instantiate a device in magic
1.	Open magic
2.	Click devices 1
3.	Select the device, here I selected nmos
4.	Provide the parameters->click create->apply
5.	To view the device press “v”
6.	Inorder to open the parameter tab press “cntrl+p”


<img width="940" height="324" alt="image" src="https://github.com/user-attachments/assets/a741b358-1951-4e34-9916-cf1b6228fe78" />

<img width="940" height="321" alt="image" src="https://github.com/user-attachments/assets/8ccf0cad-1758-4834-ae01-42ce5652455a" />


To select a particular layer, hover the pointer onto the layer & press “s” for select.

<img width="940" height="452" alt="image" src="https://github.com/user-attachments/assets/694d7ad7-077e-4e3f-a973-420f42a11104" />

Now we don’t need to hover to the command window always. “:” this semicolon will work. So if we need to know about the layer, just hover, type “:” directly & then type what

</details>


<details>
<summary><b>L3 - Creating Simple Schematic In Xschem</b></summary>

Open xscheme->File->new schematic

<img width="940" height="626" alt="image" src="https://github.com/user-attachments/assets/2a72e63d-9b22-4a3b-8a8c-82343674c89f" />

<img width="940" height="615" alt="image" src="https://github.com/user-attachments/assets/5c2b72f8-c2a3-47a0-b71d-a8117bb8b378" />

<img width="701" height="610" alt="image" src="https://github.com/user-attachments/assets/43cdb86b-aff3-4b17-93c7-ee1b8e91b474" />

For pin, select->ipin
Similarly instantiate a opin, iopin(for Vdd & Vss)


Now for a wire, just hover over the starting point & press “w”. Then without clicking the mouse pointer just drag the mouse towards the ending point, then click “enter”

<img width="940" height="615" alt="image" src="https://github.com/user-attachments/assets/20cf84e0-b816-42ed-827b-3da8419873b7" />

<img width="940" height="518" alt="image" src="https://github.com/user-attachments/assets/09ce51f0-ed88-480d-9aa7-c173ac456cb2" />

To change the pin name, select the pin, press “Q”. Change the name.

<img width="729" height="817" alt="image" src="https://github.com/user-attachments/assets/a852520b-132b-446e-bc64-13ea1c05c0cf" />

<img width="940" height="543" alt="image" src="https://github.com/user-attachments/assets/3327acff-3131-4e8c-a352-bd5a637ec153" />

For Skywater PDK, the minimum width of the mosfet is 1.5 microns. So there are 3 fingers, in total it will comprise of 3*1.5=4.5u
All the other parameters are layout specific, so we shall leave that.


<img width="940" height="540" alt="image" src="https://github.com/user-attachments/assets/2aa95ba9-2860-4be8-b4c0-de3281769e8a" />

For pfet devices, just mention the body terminal is connected to vdd. Spice netlist is case in sensitive, then als for our easy understanding, denote it by vdd.

<img width="698" height="617" alt="image" src="https://github.com/user-attachments/assets/e5668277-9837-4abe-88b4-da2321dfafab" />


File-> save as

</details>


<details>
<summary><b>L4 - Creating Symbol And Exporting Schematic In Xschem</b></summary>

<img width="940" height="433" alt="image" src="https://github.com/user-attachments/assets/b15f7a46-f833-438f-995d-6e9bde6e7f37" />

<img width="940" height="459" alt="image" src="https://github.com/user-attachments/assets/5bb11757-3e03-43e2-8289-b0c77df87460" />

<img width="626" height="542" alt="image" src="https://github.com/user-attachments/assets/b20dc1eb-c588-4655-a8cc-3e5cd73bacd2" />

Open the symbol view which was inverter.sym which we already made and kept.

<img width="804" height="316" alt="image" src="https://github.com/user-attachments/assets/d6b669fd-9ac9-4719-82ae-12d9330796bd" />


Now for simulation, we must provide 2 voltage sources. Then a gnd pin also.

<img width="698" height="610" alt="image" src="https://github.com/user-attachments/assets/1219b0c3-3cfb-44b8-b90e-513351af40a8" />

<img width="701" height="622" alt="image" src="https://github.com/user-attachments/assets/7011ab89-1f08-4105-8f63-4823d78a0c47" />


<img width="940" height="281" alt="image" src="https://github.com/user-attachments/assets/2a60e48f-486b-4ea8-a2ca-20c1cfdfa205" />


Add the pin names. The transistors used are low voltage ones. So set Vdd into 1.8V. Now we need to set Vin. Since we need to plot the values which changes with time, here it is a PWL(piece wise linear). The way in which it is set is,
pwl stands for Piecewise Linear voltage source. The values are specified as time-voltage pairs. In pwl(0 0 20n 0 900n 1.8), the voltage remains at 0 V until 20 ns and then ramps linearly to 1.8 V by 900 ns. It is commonly used to generate custom input waveforms and study circuit behavior during voltage transitions.


<img width="692" height="342" alt="image" src="https://github.com/user-attachments/assets/3ab63ce7-9d3e-42b7-ae93-3a574d9cd477" />


To run a simulation in ngspice, we need a model file provided by the foundry or PDK, which contains the device models and parameters of transistors and other components. In addition to the circuit schematic, we must specify the type of simulation to be performed, such as DC, AC, or Transient (TRAN) analysis. In xschem, these simulation commands are typically added using text blocks(code_shown.sym in the below figure), which are included in the generated SPICE netlist and interpreted by ngspice during simulation.

<img width="700" height="607" alt="image" src="https://github.com/user-attachments/assets/bcc0d7e8-f8b0-4406-9d0c-f7ead7c237b9" />


<img width="940" height="333" alt="image" src="https://github.com/user-attachments/assets/8f73dca7-1688-43de-bafb-691b2ccbe38e" />

“.lib /usr/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt"

<img width="940" height="334" alt="image" src="https://github.com/user-attachments/assets/37e65fff-bcba-4a81-bd7a-516afb34ceab" />

```
".control
trans 1n 1u
plot V(in) V(out)
endc"
```
For trans analysis from 1n to 1u, this will plot the graph between V(in) & V(out).

<img width="940" height="392" alt="image" src="https://github.com/user-attachments/assets/fa8683ad-452c-4b41-8374-4722a1bc13d5" />


<img width="940" height="392" alt="image" src="https://github.com/user-attachments/assets/33f92273-75dc-442c-81a4-4fd7e4181e58" />


Now click Netlist to create the netlist of the schematic, then click Simulate.

<img width="940" height="464" alt="image" src="https://github.com/user-attachments/assets/33207954-a57b-4632-8a65-2777e1fac09f" />

<img width="940" height="407" alt="image" src="https://github.com/user-attachments/assets/e73e3150-76ef-4ca3-b414-18ffa58c9c3f" />

<img width="940" height="405" alt="image" src="https://github.com/user-attachments/assets/933f7903-d7fe-4727-b383-af9e3d6b2166" />

**LVS Netlist:** Top Level is a .subckt: This option instructs Xschem to generate the top-level schematic as a SPICE subcircuit (.subckt) instead of a complete standalone circuit. The generated netlist includes .subckt and .ends statements, allowing the design to be instantiated as a reusable hierarchical block within larger circuits. This is particularly important for Layout Versus Schematic (LVS) verification, where the extracted layout netlist is compared against the schematic netlist at the subcircuit level. Enabling this option ensures compatibility with hierarchical designs and simplifies the reuse of schematic blocks such as inverters, NAND gates, and other standard cells during simulation and physical verification.

<img width="940" height="226" alt="image" src="https://github.com/user-attachments/assets/838f4884-f283-4bee-94be-737d5aac9ae5" />
</details>


<details>
<summary><b>L5 - Importing Schematic To Layout And Inverter Layout Steps</b></summary>

Now inorder to work with magic, we must import the layout into the magic. For that we need the latest LVS netlist.

<img width="635" height="201" alt="image" src="https://github.com/user-attachments/assets/b4cbee51-d924-4538-8629-b3dbe8e025b0" />


<img width="940" height="449" alt="image" src="https://github.com/user-attachments/assets/80a7251a-3837-4cf7-844f-047537d793de" />


<img width="940" height="442" alt="image" src="https://github.com/user-attachments/assets/e4c7ebe8-2678-4a7a-abed-c125fe498340" />


1.	To select the instance: Hover on the instance (don’t click), press “i”.

  
2.	To move the instance: Select the instance, move the cursor to the lower left corner of the destination to be moved & press “m”

   
3.	To see the parameter window: Select the instance, press”ctrl+p”


<img width="601" height="807" alt="image" src="https://github.com/user-attachments/assets/9c3c2018-507a-4991-a45d-353e1490e824" />


<img width="610" height="803" alt="image" src="https://github.com/user-attachments/assets/9b9e6f86-6313-4131-9e93-3e4a0c278f06" />


<img width="534" height="579" alt="image" src="https://github.com/user-attachments/assets/3233171c-8bdd-44f5-bf8a-51d0a39f794a" />


The layout after connections will look something like this
1.	For a metal wire, first draw the approximate rectangle shape then hover to a specific metal & press middle most button. For example if we want to connect vss pin to guard ring, first draw the rectangle metal wire, then select that shape hover the black pointer to somewhere inside the vss pin itself (because its of metal 1), press middle most mouse button.

 
2.	Then for constant wire connection, press “space bar”, then the mouse pointer will get changed, take the “arrow mark one”, drag with left mouse button. To stop again middle mouse button.

</details>


<details>
<summary><b>L6 - Final DRC/LVS Checks And Post Layout Simulations</b></summary>

<img width="940" height="366" alt="image" src="https://github.com/user-attachments/assets/2ab4418f-ade8-491a-b835-1bcd3f2152b0" />

<img width="513" height="174" alt="image" src="https://github.com/user-attachments/assets/14d67cb8-ea56-47eb-aa88-21848c8e267e" />


<img width="940" height="324" alt="image" src="https://github.com/user-attachments/assets/f8cbf39f-5ad2-4763-ac88-783da8161bb2" />


```
% extract do local
% extract all
% ext2spice lvs
% ext2spice
```

**ext2spice lvs** -no parasitics extracted

<img width="940" height="79" alt="image" src="https://github.com/user-attachments/assets/ea1953c1-c3cb-4f8d-a50d-b9b799bf283e" />


For LVS use this command: 
Note: Use Layout netlist first
```
netgen -batch lvs "../magic/inverter.spice inverter" "../xschem/inverter.spice inverter"
```

<img width="906" height="873" alt="image" src="https://github.com/user-attachments/assets/d50ced0f-9c74-4635-a135-55a513394ae5" />

When we add,

```
% ext2spice cthresh 0
```

This will add the parasitic capacitances also to the netlist, which will look like 

<img width="940" height="691" alt="image" src="https://github.com/user-attachments/assets/202de445-f5c7-42bf-a48f-099db8189405" />


<img width="940" height="57" alt="image" src="https://github.com/user-attachments/assets/bb450592-a89a-4e97-a951-5a7f58c38920" />


Now use the same test bench, but instead of the xshem netlist earlier, we need to use magic extracted netlist with parasitics. This netlist pin order may be changed. Make changes as necessary. 


<img width="940" height="383" alt="image" src="https://github.com/user-attachments/assets/723bae06-e818-41e7-86ad-1641207611e4" />


```
% cp -r ../xschem/.spiceinit .
```

<img width="832" height="242" alt="image" src="https://github.com/user-attachments/assets/9cb70169-f5ea-4a84-9c06-380e6e40f33b" />

</details>


---
