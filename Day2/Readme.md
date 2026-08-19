# Day 2 - DRC and LVS Theory and labs

### PV_D2SK1 - Introduction to DRC and LVS

<details>
<summary><b>L1 - Understanding GDS Format</b></summary>

**DRC (Design Rule Checking)**
Make sure design meets all the foundry constraints.

**LVS (Layout vs Schematic)**
Make sure a design layout matches a simulatable  netlist by electrical connectivity & devices.

<img width="940" height="564" alt="image" src="https://github.com/user-attachments/assets/c0c14999-368e-4e23-a69c-a3dfc670ebb2" />


LVS make sure that if multiple things(netlist) are formed from independent sources (here schematic & layout), then it can be crosschecked to find errors in each other.


<img width="940" height="478" alt="image" src="https://github.com/user-attachments/assets/928d5fb6-82f2-4688-b6f6-db7ba8a555fe" />


The modern practice makes sure that from a single source itself (RTL) the schematic & layout are generated. 


<img width="669" height="510" alt="image" src="https://github.com/user-attachments/assets/fd0d2c78-ec20-4dd9-9d90-3d0a2ed8d12e" />


Magic tool was written in CIF format. Its human readable. 

<img width="940" height="480" alt="image" src="https://github.com/user-attachments/assets/c3901f58-a7de-4749-a6ae-27182a8d5d25" />


In GDS, the data is written as a layer-purpose pair. Purpose can be drawing, pin, blockage, label etc. But this layer purpose pair in one technology/foundry won’t be the same in the other. This creates discrepancies.


<img width="940" height="432" alt="image" src="https://github.com/user-attachments/assets/cf980438-a4ff-4492-a46e-272d51f9673a" />


The actual layout data consists of geometric information such as rectangles, polygons, and subcell instances, which are the shapes that will ultimately be fabricated on silicon. GDS also stores some metadata, including labels, cell names, instance names, and cell boundaries, which help EDA tools understand and organize the design hierarchy. However, important design information such as device types (NMOS, PMOS, resistor, etc.), pin classes/usages, and electrical characteristics like current sources and sinks are not stored in GDS. This is why a GDS file alone cannot fully describe the circuit's functionality; LVS and extraction tools must infer devices and connectivity from the layout geometry and technology rules. In short, GDS primarily contains physical geometry and limited hierarchy information, but not the complete electrical intent of the design.

</details>

<details>
<summary><b>L2 - Extraction Commands, Styles and Options In Magic</b></summary>

<img width="720" height="342" alt="image" src="https://github.com/user-attachments/assets/937b314e-28ed-41c6-805f-61087075bd12" />


The layout lacks many metadata as discussed. So inorder to compare with any circuit it needs something as “netlist”. The process of getting a netlist just from some geometrical details from the layout is called as “extraction”.


<img width="742" height="425" alt="image" src="https://github.com/user-attachments/assets/aa83457d-3eeb-440b-928b-10ce96a3e79d" />


The commands used for extraction are; 

<img width="729" height="503" alt="image" src="https://github.com/user-attachments/assets/ebca529d-ca2d-4a26-a923-18ebab1f6823" />


<img width="729" height="503" alt="image" src="https://github.com/user-attachments/assets/6bd0ffd2-63d3-4907-a941-a1ba115c4e0d" />


<img width="729" height="517" alt="image" src="https://github.com/user-attachments/assets/2b2ad948-e7b7-4423-b829-545d1c333037" />

</details>

<details>
<summary><b>L3 - Advanced Extraction Options In Magic</b></summary>


<img width="720" height="544" alt="image" src="https://github.com/user-attachments/assets/f0ba65c2-2da6-45b7-8272-07d105f76b58" />


**ext2spice hierarchy on**
This option preserves the hierarchical structure of the layout when generating the SPICE netlist. Instead of flattening all devices into a single level, Magic keeps the parent-child cell relationships intact using .subckt definitions. This makes LVS faster and easier to debug because the extracted netlist closely resembles the original design hierarchy.


**ext2spice format ngspice**
This tells Magic to generate the netlist in a syntax compatible with NGSPICE. The extracted devices, node names, and subcircuits are written in a format that can be directly understood by NGSPICE and most SPICE-based simulators without requiring additional conversion.


**ext2spice cthresh infinite**
The capacitance threshold is set to infinity, which effectively disables extraction of parasitic capacitors. Since LVS only compares connectivity and devices, parasitic capacitances are unnecessary and would only clutter the netlist. As a result, no extracted capacitors appear in the output SPICE file.


**ext2spice rthresh infinite**
The resistance threshold is also set to infinity, preventing extraction of parasitic resistors. During LVS, we only need to verify that devices and connections match the schematic, so wire resistances are ignored. This keeps the netlist compact and focused on connectivity.


**ext2spice renumber off**
Normally Magic may replace net names with automatically generated node numbers such as N001, N002, etc. With renumbering turned off, original net names are preserved. This makes debugging LVS mismatches much easier because the extracted netlist uses recognizable signal names.


**ext2spice scale off**
This option prevents Magic from applying additional scaling factors to device dimensions. The extracted transistor widths and lengths are written directly in the technology's physical units, ensuring consistency between the layout and schematic netlists during comparison.



**ext2spice blackbox on**
With black-boxing enabled, lower-level cells can be treated as black boxes whose internal details are not expanded in the netlist. Only their interface pins are retained. This is useful when certain blocks are already verified or when only top-level connectivity is important for LVS.



**ext2spice subcircuit top auto**
This automatically creates a top-level subcircuit for the design being extracted. Magic determines the highest-level cell and wraps the entire netlist inside a .subckt definition, making the output suitable for hierarchical LVS and SPICE processing.



**ext2spice global off**
This disables automatic treatment of certain nets as global nets. Signals such as VDD and GND must be connected explicitly rather than being assumed globally connected throughout the design. This avoids false LVS matches caused by hidden global connections and ensures that connectivity is verified accurately.


</details>

<details>
<summary><b>L4 - GDS Reading Option In Magic</b></summary>


<img width="940" height="241" alt="image" src="https://github.com/user-attachments/assets/f5a21d6c-bf3b-44ef-8f50-d0852f1a9c4d" />


There are several uses of reading the gds into readonly mode. First among that is “Abstract” of a cell.


<img width="940" height="474" alt="image" src="https://github.com/user-attachments/assets/1eea3d17-895b-4397-90ef-84b986ca5502" />

First through read only cell, the cell data is fetched as GDS of the PDK library file. Then the same macro is fetched from the LEF file. Then the pointers which was pointing the gds file is pointers are copied from the read only file to ath ABSTRACT views. 


<img width="940" height="515" alt="image" src="https://github.com/user-attachments/assets/dda60a2a-34a4-45a6-8e28-a9e83aa13788" />


During GDS import and device extraction, Magic performs device recognition based on the geometric layers present within a cell. A challenge arises when a transistor is defined in a child cell while a device-modifying layer, such as a High Voltage Implant (HVI), is placed in the parent cell. Although the combination of the transistor and HVI layer should form a high-voltage device, Magic's hierarchical processing prevents it from associating layers that reside in different hierarchy levels. As a result, the device may be incorrectly extracted as a standard transistor instead of a high-voltage transistor. To resolve this issue, the affected cells must be flattened using commands such as `gds flatglob` or `flatten`, which merge the geometry from different hierarchy levels into a single layout view. Once flattened, Magic can recognize all relevant layers together and correctly identify the intended device, ensuring accurate extraction and LVS verification.


</details>

<details>
<summary><b>L5 - GDS Writing, Input, Output Styles and Output Issues</b></summary>

<img width="940" height="556" alt="image" src="https://github.com/user-attachments/assets/a2e3101c-aaea-41fa-8dd7-330544aabbb8" />


<img width="940" height="624" alt="image" src="https://github.com/user-attachments/assets/9f03479f-74b5-474e-805d-519bf0436a3c" />


This addendum option removes any read only cell details.


<img width="940" height="628" alt="image" src="https://github.com/user-attachments/assets/4edd80e6-35e2-4f6a-9757-68f69c7a8fe6" />


<img width="940" height="343" alt="image" src="https://github.com/user-attachments/assets/973a73d1-2bfd-4840-b4bb-8bf0553d6314" />


GDS input styles in Magic are predefined layer-mapping configurations stored in the technology file's cifinput section. They determine how GDS layer numbers and datatypes are translated into Magic's internal layers during GDS import. Multiple styles, such as sky130() and sky130(vendor), allow Magic to support different layer conventions while reading the same process technology.


<img width="940" height="377" alt="image" src="https://github.com/user-attachments/assets/2fc3f365-0200-4704-8019-7df82b2c8c2b" />


<img width="940" height="663" alt="image" src="https://github.com/user-attachments/assets/a08e8f74-593d-4f86-9104-4882526f8aa3" />


<img width="940" height="503" alt="image" src="https://github.com/user-attachments/assets/a0b0c124-d264-481f-a601-7e82ec643452" />


These are the cifoutput styles command.

<img width="940" height="131" alt="image" src="https://github.com/user-attachments/assets/7871de46-575d-492d-813b-fab559a79216" />

</details>

<details>
<summary><b>L6 - DRC Rules In Magic</b></summary>

<img width="940" height="378" alt="image" src="https://github.com/user-attachments/assets/0c4e2023-5f37-4ba4-9102-b4ab8fc086c8" />


The commands used for DRC checks are as follows;


<img width="940" height="518" alt="image" src="https://github.com/user-attachments/assets/e225b4f6-e69a-4df0-8782-7cad81a419bd" />


DRC can be checked in these ways. This depends on the tool:


<img width="940" height="712" alt="image" src="https://github.com/user-attachments/assets/2570f3fc-25a0-4510-877c-b54bfe1be7b2" />


<img width="940" height="525" alt="image" src="https://github.com/user-attachments/assets/5be7c77e-5adc-47aa-860e-029190f8965f" />


<img width="940" height="622" alt="image" src="https://github.com/user-attachments/assets/b44bb393-c36a-40c3-898c-da4ae074cc40" />


</details>

<details>
<summary><b>L7 - Extraction Rules And Errors In Magic</b></summary>


<img width="940" height="653" alt="image" src="https://github.com/user-attachments/assets/0b8498d5-c1a3-491f-b990-b6483264f10e" />


When you draw metal wires in layout, they don't behave as ideal conductors. Every conductor forms unwanted capacitances with nearby conductors and the substrate. These are called parasitic capacitances.
Area capacitance (wire-to-substrate)
Overlap capacitance (between overlapping conductors)
Fringe capacitance (edge electric fields)
Sidewall or coupling capacitance (between adjacent conductors)
 
These parasitics affect delay, power consumption, crosstalk, and signal integrity, so extraction tools such as Magic estimate them for post-layout simulation. 
In advanced nodes (28nm and below), sidewall/coupling capacitance often dominates. That's why increasing spacing between critical nets can significantly reduce crosstalk and timing issues even when the wire area remains the same.


</details>

<details>
<summary><b>L8 - LVS Setup For Netgen</b></summary>

Netgen is completely unaware of the circuit, it only cares about the netlists. So there are some problems it will encounter.

<img width="729" height="217" alt="image" src="https://github.com/user-attachments/assets/1456deda-6cc1-4e5a-8de1-299c34dcbfb6" />


•	When there are permutable(interchangeable) terminals for a device like resistor terminals or source & drain of a mosfet, LVS cannot recognise the same.


•	When the resistance of a device in schematic is x & in layout there will be 10 resistors with resistance/10, the tool should understand. In short in layout it should consider the device as one not ten.


All these are noted in the setup file of netgen.

<img width="735" height="498" alt="image" src="https://github.com/user-attachments/assets/6eed8971-de01-4ad4-b677-a346dc77cfaf" />

</details>

<details>
<summary><b>L9 - Verification By XOR</b></summary>


<img width="720" height="376" alt="image" src="https://github.com/user-attachments/assets/8abe2e19-6644-4547-859c-b72b11e1c9fd" />

The Boolean XOR operation is used to compare two layout regions and highlight only the areas where they differ. Matching regions cancel out, while any missing or additional geometry appears in the XOR result, making it an effective method for detecting layout mismatches.

</details>

### PV_D2SK2 - Labs for GDS read/write, extraction, DRC, LVS and XOR setup

</details>

<details>
<summary><b>L1 - GDS Read</b></summary>

```
% cif listall istyle
% cif listall istyle : To check the default style
% gds read /usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd.gds
%cellname top
```


<img width="940" height="321" alt="image" src="https://github.com/user-attachments/assets/b7c896de-aa1e-4e38-983c-cf2ea1799f69" />


<img width="940" height="321" alt="image" src="https://github.com/user-attachments/assets/9cc9fbe1-0948-46f8-a5f5-ca28be442b33" />


<img width="940" height="447" alt="image" src="https://github.com/user-attachments/assets/99718c0e-fc6e-44c2-945a-ee664dffffa9" />


<img width="940" height="443" alt="image" src="https://github.com/user-attachments/assets/e5bc2140-00d5-47e9-bf01-70ea4b2966db" />


<img width="940" height="445" alt="image" src="https://github.com/user-attachments/assets/3e032cf8-ddfc-43f8-9552-10aa88eb3258" />


<img width="560" height="76" alt="image" src="https://github.com/user-attachments/assets/dc5b7e45-5b7b-475f-a042-3cae51df79b0" />


Since the current style is vendor, the blue colored text are “pins”.


<img width="798" height="84" alt="image" src="https://github.com/user-attachments/assets/6523c5bc-563f-4449-8d3c-074b041ef9f2" />


<img width="570" height="564" alt="image" src="https://github.com/user-attachments/assets/bb889cef-babd-4d92-a037-19607ee92141" />


The pins appeared as labels.
Here the present cell got overwritten. If we don’t want to overwrite the command is


```
% gds noduplicates true
```

</details>

<details>
<summary><b>L2 – Ports</b></summary>


<img width="940" height="362" alt="image" src="https://github.com/user-attachments/assets/3795d300-621d-4a42-9da3-0a7372e66848" />


As gds lacks the metadata of pin class, it came default.
To read lef file

```
% lef read /usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
```


<img width="939" height="251" alt="image" src="https://github.com/user-attachments/assets/9ecb4669-2b65-4502-a189-fb89069216c7" />


```
% port 1 name
% port 1 class
% port 1 use
```


Lef file contains metadata such as port name, class use etc. That’s why we can get the same after loading the specific cell’s lef file here.


Now we can load the spice netlist of the standard cell & see:

```
% readspice /usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
```

</details>

<details>
<summary><b>L3 - Abstract Views</b></summary>


First load LEF view of a cell

```
% lef read /usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef
```

<img width="940" height="450" alt="image" src="https://github.com/user-attachments/assets/877f37bd-207d-4e68-bb7d-d6d1a97d2512" />


This don’t have any transistors, labels etc.


<img width="940" height="251" alt="image" src="https://github.com/user-attachments/assets/9265ed11-5ffb-4beb-8659-4b04698e11e6" />


Once a gds has been written from abstract many information is lost. This can be shown as, 

```
% load test
% getcell sky130_fd_sc_hd__and2_1
```


<img width="745" height="200" alt="image" src="https://github.com/user-attachments/assets/6effef6e-a274-49ca-bfb7-52cc82a98fd6" />


<img width="940" height="449" alt="image" src="https://github.com/user-attachments/assets/65a2959c-e795-4237-8375-f294b7cb467e" />


Now to write this to gds:


<img width="940" height="90" alt="image" src="https://github.com/user-attachments/assets/0324a29d-eeff-4303-a9e8-194b136f6113" />


Error message came
Now close & restart magic. Read the gds. 


<img width="940" height="156" alt="image" src="https://github.com/user-attachments/assets/5790f499-ffbf-4c12-b0d6-71febaf40edc" />


<img width="940" height="445" alt="image" src="https://github.com/user-attachments/assets/5b43b506-dd3b-4cbe-a7dd-128837bc3f78" />


Many information regarding the layout is lost here. Anything which is not a pin disappears from the gds. Because gds can hold pin data.


</details>

<details>
<summary><b>L4 - Basic Extraction</b></summary>


<img width="940" height="390" alt="image" src="https://github.com/user-attachments/assets/f64e829e-4c9e-4d62-8703-421402c19644" />


Now limiting the threshold value of the capacitor to 0.01,

<img width="940" height="379" alt="image" src="https://github.com/user-attachments/assets/8f67c4c4-33af-45b7-b8ce-c1ca1d6a241f" />

Now for resistance extraction,

```
% ext2sim labels on
% ext2sim
```

<img width="940" height="385" alt="image" src="https://github.com/user-attachments/assets/dc3d91db-3137-4bb1-9a80-f9f19959f89b" />


```
% ext2spice lvs
% ext2spice 
% ext2spice cthresh 0.01
% ext2spice extresist on
% ext2spice
```


<img width="940" height="371" alt="image" src="https://github.com/user-attachments/assets/a5235aa2-5370-4a57-9317-2df6d3b68d8e" />

</details>

<details>
<summary><b>L5 - Setup For DRC</b></summary>


Running DRC in batch mode

```
% /usr/share/pdk/sky130A/libs.tech/magic/run_standard_drc.py /usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/mag/sky130_fd_sc_hd__and2_1.mag
```


<img width="940" height="229" alt="image" src="https://github.com/user-attachments/assets/8b4f4fa0-52b3-4ee9-8bc2-bbfe67276661" />


This will create a DRC report “sky130_fd_sc_hd__and2_1_drc.txt”


<img width="940" height="370" alt="image" src="https://github.com/user-attachments/assets/1ba07248-bdf3-413a-9ddd-992e06bdceb5" />


A standard cell also shows some DRC errors, because the wells are not connected.


<img width="940" height="339" alt="image" src="https://github.com/user-attachments/assets/9d5cca0a-11be-4f4d-8e0f-cf723af230f6" />


But in the magic window it shows DRC as clean.


<img width="940" height="348" alt="image" src="https://github.com/user-attachments/assets/23d4aaae-5316-4447-9129-340b618b6288" />


The batch script runs drc in “full” mode. That’s why well connection error while a normal layout takes in “fast” mode.


<img width="940" height="353" alt="image" src="https://github.com/user-attachments/assets/24316353-0c7e-4e33-bc01-9aecb476fa2a" />


Now to check the reason, select the cell & type


```
% drc why
```

<img width="940" height="339" alt="image" src="https://github.com/user-attachments/assets/75298bff-4dfb-4a8e-b214-b4da04981eb5" />


<img width="940" height="342" alt="image" src="https://github.com/user-attachments/assets/accf1d4d-dcc9-425a-a585-1437ce5b7bf4" />


After placing tapcell, the DRC violations are gone.


</details>

<details>
<summary><b>L6 - Setup For LVS</b></summary>


```
cp /usr/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl ./setup.tcl
```

<img width="940" height="358" alt="image" src="https://github.com/user-attachments/assets/c9a6ecca-7e5e-4c6f-89cb-d4b1e3e82fe8" />


```
% netgen -batch lvs "../magic/sky130_fd_sc_hd__and2_1.spice sky130_fd_sc_hd__and2_1" "/usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice sky130_fd_sc_hd__and2_1"
```


</details>

<details>
<summary><b> L7 - Setup For XOR</b></summary>


<img width="940" height="432" alt="image" src="https://github.com/user-attachments/assets/b2f1b2b1-7ceb-4124-b254-2adc0599c46a" />


<img width="940" height="444" alt="image" src="https://github.com/user-attachments/assets/46d0d064-e3c7-4974-8f59-5d90da6129c3" />

</details>
