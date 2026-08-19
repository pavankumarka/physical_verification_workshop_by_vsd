# Day 5 - Running LVS and Debugging

### PV_D5SK1 - Fundamentals of LVS

<details>
<summary><b>L1 - Physical Verification Of Extracted Netlist</b></summary>

LVS Preparation


- We need to have schematic & layout.
- There should be 2 netlists each from schematic & layout to compare with.
-	Mostly the format of these 2 netlist are spice, but it can be Verilog, lef, def or BLIF.

<img width="720" height="610" alt="image" src="https://github.com/user-attachments/assets/9015ab14-1aa2-4b27-9864-21673ed2535e" />


If these netlists from layout can be simulated, we will increase the functional & behavioural validation of the silicon chip.

<img width="767" height="613" alt="image" src="https://github.com/user-attachments/assets/dfaa050d-c759-49ac-a9fb-bec612ccadcf" />


This is an expected LVS flow in a Digital design flow. As there are no schematic views in Digital Physical Design, all the Physical Design are done by some EDA tool. Here when the RTL code is obtained, synthesis will derive a netlist of out if which will comprise of standard cell library cells. Then the physical design flow will happen. After CTS, buffer insertion etc the netlist will be compatible for LVS (shown as layout compatible in green sign in the figure). After this stage, the tool will place & route the same. This can be followed by some electrical checks such as tap/well insertion, antenna check violations & the complete layout is formed. This netlist will be the one from layout side & can be compared with the former. So, in a Digital Design after Placement & Routing the second comparing netlist will be obtained. There can be mismatches when the actual routing happens. Because of congestions, shorts can happen. This can create a LVS mismatch.

</details>

<details>
<summary><b>L2 - How LVS Matching Works</b></summary>

<img width="742" height="657" alt="image" src="https://github.com/user-attachments/assets/97c410bb-5cd5-408b-8bd5-64e978122ccc" />


Most of the time the schematic hierarchy wont match with layout. Because layout can have extra hierarchical cells or extra cells like guard rings, seal ring etc which wont be a part of schematic. But “netgen” tool which is used for LVS is capable of understanding this hierarchical difference & act accordingly.


<img width="688" height="501" alt="image" src="https://github.com/user-attachments/assets/c57fd1f7-e3d4-49a5-b2cb-0fecc21d986a" />


In this example for this specific the standard cell, the layout of the standard cell has no tap cells added. This means the well connections are open & we need to add the corresponding tap cells for the connection. But at the same time, in its schematic view the bulk pin connected to VDD/VSS. This means that the substrate and well contacts inside the cell. Actually, this should not happen. But ideally netgen can handle this.


<img width="726" height="544" alt="image" src="https://github.com/user-attachments/assets/b67db46e-bd39-4aa1-9674-479be709c605" />


A netlist once flattened is very difficult to manage.


<img width="909" height="557" alt="image" src="https://github.com/user-attachments/assets/d5760d61-8407-4c49-986c-9be23f45f0bc" />


How LVS will work is like, it doesn’t have any idea about the connections or devices. It will check the number of devices in both circuits. Then it will check the number of nets in both circuits. The comparison will be how many devices are connected to a specific net. In this net “d” in schematic connnected to 3 devices where its is connected to 4 devices in layout. There is a mismatch.


<img width="940" height="471" alt="image" src="https://github.com/user-attachments/assets/5a4b1169-0027-4186-8788-82ba4e1478cb" />


</details>

<details>
<summary><b>L3 - LVS Netllist Vs Simulation Netlists </b></summary>


<img width="940" height="474" alt="image" src="https://github.com/user-attachments/assets/093ad031-a0c8-4a4c-8fef-c93bb1472ae5" />


For post layout simulation, the netlists contain RC details also.


<img width="895" height="614" alt="image" src="https://github.com/user-attachments/assets/0657306a-8b7c-457e-be8b-f568352dc07d" />


This will the comparison or RC inclusion to be considered for post layout simulations.


<img width="873" height="607" alt="image" src="https://github.com/user-attachments/assets/fb12101a-2c0b-404a-ac44-67ef7848b140" />

</details>

<details>
<summary><b>L4 - The Netgen Core Matching Algorithm</b></summary>


The way in which netgen works for lvs is based on a partition methodology in flattened mode of checking. But this will become so complex as the number of devices increases.


<img width="940" height="468" alt="image" src="https://github.com/user-attachments/assets/8698d2c2-b2a5-40c5-8d1c-110f33012c9e" />


</details>

<details>
<summary><b>L5 - Netgen Prematch Analysis, Hierarchical Checking And Flattening</b></summary>


<img width="751" height="554" alt="image" src="https://github.com/user-attachments/assets/ea481f2a-66a9-48a3-8359-a0cae78de9f6" />


If the hierarchy completely matches, it will compare like this.


<img width="735" height="564" alt="image" src="https://github.com/user-attachments/assets/3639b0a6-5cb7-4d13-8e1a-df16367cf2f0" />


If the hierarchy does not match, there will be a LVS mismatch error.


<img width="907" height="509" alt="image" src="https://github.com/user-attachments/assets/d1d7e714-00d4-44d7-94ad-3fa74f840d79" />


Netgen will deal such mismatches in a such a way that, while comparing if any mismatch for the devices/name happens, then it will go one hierarchy down & check (shown in the above figure).  This is called pre-match analysis.


<img width="681" height="551" alt="image" src="https://github.com/user-attachments/assets/3526fe5f-01a4-4ba4-94c5-b56671da6a5a" />


## Hierarchical Checking and Flattening

Modern integrated circuit designs are typically created using a **hierarchical approach**, where complex circuits are built by instantiating smaller reusable cells (child cells) inside larger parent cells. During layout verification, however, the physical implementation and the schematic may represent connectivity differently. To accurately compare both representations, LVS (Layout Versus Schematic) tools perform **hierarchical checking** and, when necessary, **flatten the design hierarchy**.

In the example shown, the **layout** connects the transistor bulk terminals to the power and ground rails at the **parent I/O cell level**, whereas the **schematic** connects the transistor bulk terminals inside the **child inverter cell**. Although the electrical connectivity is identical, the hierarchy differs between the two representations.

To avoid reporting false LVS mismatches, verification tools such as **Netgen** automatically **flatten the hierarchy**, temporarily removing the parent-child boundaries and comparing the resulting transistor-level netlists. This ensures that the comparison is based on actual electrical connectivity rather than the hierarchical organization of the design.

### Key Concepts

- **Hierarchical Design:** Large circuits are constructed by instantiating reusable child cells within parent cells.
- **Layout Hierarchy:** Electrical connections may be implemented at the parent-cell level.
- **Schematic Hierarchy:** The same connections may be defined inside child cells.
- **Hierarchy Flattening:** LVS tools temporarily remove hierarchical boundaries and compare the fully expanded transistor-level netlists.
- **Purpose:** Prevent false LVS errors caused solely by differences in hierarchical organization while ensuring electrical equivalence.

### Advantages of Hierarchical Flattening

- Correctly compares layouts and schematics with different hierarchical structures.
- Eliminates false mismatches due to parent-child connectivity differences.
- Enables accurate transistor-level verification.
- Supports verification of complex hierarchical IC designs.

---

### Summary

| Concept | Description |
|---------|-------------|
| **Hierarchical Design** | Design methodology that builds complex circuits using reusable child cells. |
| **Layout Hierarchy** | Bulk connections are made in the parent cell. |
| **Schematic Hierarchy** | Bulk connections are defined within the child cell. |
| **Hierarchy Flattening** | LVS expands hierarchical cells into a flat transistor-level representation before comparison. |
| **Benefit** | Ensures electrical equivalence despite differences in design hierarchy. |


<img width="940" height="578" alt="image" src="https://github.com/user-attachments/assets/d9cc7fab-7c61-42c4-8089-a02afae683dc" />


In this situation, when the hierarchy matches but the actual device inside the C has some mismatch, the whole idea of hierarchical check is spoiled, because a lot of flattening has already happened. In such case, we must fix the low-level errors first.


<img width="940" height="459" alt="image" src="https://github.com/user-attachments/assets/3b4dd7b1-cdbf-492d-9d1b-fc1f56cbddbd" />


If we know already cell c wont match, pass it as an argument not to flatten it. Then the actual comparison will be in cell B & A which will pass. So the report will look cleaner & easier.


</details>

<details>
<summary><b>L6 - Pin Checking And Property Checking</b></summary>


<img width="940" height="324" alt="image" src="https://github.com/user-attachments/assets/f7197400-538a-47a9-8483-50127404ff0b" />


Netgen don’t care about the net names. It considers that the number of pins should be same & each pin should have an equivalent in the other.

<img width="679" height="604" alt="image" src="https://github.com/user-attachments/assets/ef40d3dd-204a-4873-84e9-bda6765c2842" />


<img width="642" height="610" alt="image" src="https://github.com/user-attachments/assets/e3966556-509b-4c7f-9cce-bc76ce82fd88" />


<img width="719" height="385" alt="image" src="https://github.com/user-attachments/assets/96f3a3bd-b838-464b-9949-2f460afb0f46" />


Property or parameter also should match.

<img width="940" height="470" alt="image" src="https://github.com/user-attachments/assets/396e3a7c-96ca-41b3-bdef-72b8ab9689d9" />


</details>

<details>
<summary><b>L7 - Series Parallel Combining</b></summary>


<img width="940" height="482" alt="image" src="https://github.com/user-attachments/assets/e3073110-ae5c-4e99-9aff-5cd7a3e7506e" />


During Layout Versus Schematic (LVS) verification, the tool does not simply compare the schematic and layout netlists device by device. Instead, it first performs device reduction by applying equivalence rules to merge devices that are electrically identical. MOSFETs connected in parallel with the same channel length (L) and identical gate, source, drain, and bulk connections are merged into a single transistor by adding their widths (W), since the drain current is proportional to the W/L ratio. This is why multiple smaller transistors in parallel are considered equivalent to one wider transistor. Similarly, capacitors connected in parallel are merged by adding their capacitance values, which is equivalent to adding their plate areas because capacitance is directly proportional to the capacitor area. Resistors can be merged in both series and parallel configurations. For resistors with the same width connected in series, their lengths are added to form an equivalent resistor because resistance is proportional to the length-to-width (L/W) ratio. For identical resistors connected in parallel, the equivalent resistance decreases according to the parallel resistance formula, which is equivalent to increasing the effective width. By applying these device-merging rules before comparison, the LVS tool recognizes electrically equivalent implementations even when the physical layout uses multiple devices instead of a single device in the schematic, allowing optimized layouts to successfully match the intended circuit design.


</details>

<details>
<summary><b>L8 - Symmetry Breaking & L9 - Interpreting Netgen Results</b></summary>

General Rule of Thumb #1

•	Always check device mismatches first. 


•	Verify that the number of devices in the schematic and layout match. 


•	Check whether the device types (NMOS, PMOS, resistor, capacitor, etc.) are correct. 


•	Verify that device properties such as Width (W), Length (L), Multiplier (M), Number of Fingers (NF), and other parameters match. 


•	Fix all device mismatches before investigating net mismatches. 


•	Once all devices match correctly, proceed to analyze net connectivity mismatches.


General Rule of Thumb #2


•	Start with the easiest and most obvious errors first. 


•	Fix simple issues such as: 

- Missing devices
- Incorrect device properties (W, L, M, NF) 
- Wrong pin connections 
- Missing contacts or vias 
- Short circuits 
- Open circuits 
- Avoid spending time on complicated net mismatches initially.
  
  Many complex LVS errors disappear automatically once the basic errors are corrected.

  
•	Solve LVS issues step by step rather than trying to debug everything simultaneously.
Command used to run LVS (Netgen example):
netgen -batch lvs "file1 circuit1" "file2 circuit2" setup.tcl comp.out >& lvs.log


</details>

### PV_D5SK2 - LVS Labs

<details>
<summary><b>L1 -  LAB1</b></summary>


```
% git clone https://github.com/RTimothyEdwards/vsd_lvs_lab.git
```

<img width="940" height="373" alt="image" src="https://github.com/user-attachments/assets/b325701d-08a4-4211-bef4-8283a41c84e0" />


Even though no circuit is defined in the spice files, netgen will run & get us a lvs report.


<img width="940" height="431" alt="image" src="https://github.com/user-attachments/assets/9ec5bf60-c1b5-4c7d-a95e-5152a541e2fe" />


<img width="685" height="485" alt="image" src="https://github.com/user-attachments/assets/c913bff0-5d35-4571-8fed-81e6731b5c90" />


Now change any pin inside any of the spice files & again run netgen.


<img width="940" height="403" alt="image" src="https://github.com/user-attachments/assets/0ad39985-7b03-468e-8524-c77e35de5b0f" />


Cell1/2=1, this means that pin 2 (here since the circuit is not defined, netgen will name the pin a name, here it is 1,2,3) of cell1.
As we can see, there is a mismatch between netB & net C. Net A column is same for both the spice files.
When comparing net C, we can see cell3/1, means first pin of cell 3 is is connected to net C for netB.spice file. But the same cell3/1 is missing in netA.spice file. This cell3/1 is connected to net B in spice file (look at the Net B column of the netA.spice file). From this we can understand the B & C nets got interchanged. 
Why it reflects of net A also even though Net A is correct. Because Net A is connected to cell3 also which is corrupted now. So netgen will take netA also in this mismatch highlights. We can ignore the entries where everything matches (just like Net A).


<img width="940" height="398" alt="image" src="https://github.com/user-attachments/assets/734c7ef2-23ac-4ecb-91eb-6bf265d9e722" />


cell33-> X3 of cell 3
1=3; 
1->pin 1 (B)
3->Fan out of B, here B is connected to 3 different pins.
Device mismatch is usually difficult to tackle, because it takes the complete fanout of all the respective pins. But the net mismatch which specifically defines, in a specific cell, where are its pins connected to?


</details>


<details>
<summary><b>L2 - LVS With Subcircuits</b></summary>


After every netgen run type,

```
% reinitialize
```

<img width="940" height="187" alt="image" src="https://github.com/user-attachments/assets/a0fa06c2-2bb4-44a0-9c67-a0557331a04a" />


For exercise 2, it didn’t recognise as a device, because netgen sub circuit definition won’t take the components inside. It must be called. So netgen will take as 2 empty spice netlists only. So, when these 2 spice files where only a subcircuit definition is provided, it won’t consider it. Now lets provide the subcircuit name which is “test” and see.



<img width="940" height="568" alt="image" src="https://github.com/user-attachments/assets/d785cee8-56e6-43cd-825d-45d7bc6a2c77" />


<img width="940" height="571" alt="image" src="https://github.com/user-attachments/assets/6cf84a46-71db-4cfb-92d1-561483c11eff" />


<img width="940" height="649" alt="image" src="https://github.com/user-attachments/assets/bac882cb-ea85-4555-96b1-65f5bbdb8376" />


Comparison is made with subcircuit “test” of both the spice netlists.
Now we can check how pin order will effect the lvs results.


<img width="940" height="482" alt="image" src="https://github.com/user-attachments/assets/0d4f27ce-f72b-44da-a526-7f3c0a0f566a" />


LVS become clean.
After swapping all A to C & vice versa, 


<img width="940" height="490" alt="image" src="https://github.com/user-attachments/assets/2fddd690-809e-446c-845a-92a89c52f455" />


This indicates that it is okay to have port order in an netlist in a different order, but since netgen cannot make any assumptions about the top level the pin names should match.
Instead of always running the GUI, a batch script can be made to run netgen in batch mode and output the files in a json file with a custom name.


```
%netgen -batch lvs "netA.spice test" "netB.spice test" /usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl  exercise_2_comp.out -json | tee lvs.log
```


The json file gives a more machine readable file and can be viewed Using


```
../count_lvs.py | tee -a lvs.log
```


<img width="940" height="112" alt="image" src="https://github.com/user-attachments/assets/4e3401b7-47e7-4642-a49c-d987b09cb6ca" />


</details>


<details>
<summary><b>L3 - LVS With Blackboxes Subcircuits</b></summary>


<img width="940" height="543" alt="image" src="https://github.com/user-attachments/assets/af2329d9-9c71-458e-a313-ae0ec6a6ea00" />


Now change the pin order of netA.spice.
Now try adding an additional pin “D”.


<img width="940" height="477" alt="image" src="https://github.com/user-attachments/assets/cb771e63-2713-4a39-be93-806c8159317c" />


By changing the port names in cell1 from A B C to A B D and re running we get proxypins. Since these are blackbox circuits netgen assumes that port c is missing in circuitA and D is missing in circuit.
Netgen assumes that the cell has all pin A B C D and adds the proxy pin to show the missing pin.


<img width="940" height="480" alt="image" src="https://github.com/user-attachments/assets/ee98b85f-be38-4513-bb68-f54a6bb1fb43" />

By changing the cell1 to cell 4 in both the definition and the instantiation.


We see that cells match and the cells are being flattened. This highlights an issue with black box cells. It cannot recognize when it is a blackbox cell and when it is an empty circuit. 


This can be solved by using the -blackbox flag which tells netgen to treat any empty cells as blackbox entries.

```
$ netgen -batch lvs "netA.spice test" "netB.spice test" \
  /usr/local/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl \
  exercise_3_comp.out -json -blackbox | tee lvs.log
```


<img width="940" height="477" alt="image" src="https://github.com/user-attachments/assets/0c30e9c7-db58-4622-b54e-e6e562e58522" />


We see how this results in a device count mismatch.Both the cells show up in the same partition .This highlights how even though components in the comp.out file may be aligned but are a complete mismatch.


</details>


<details>
<summary><b>L4 - LVS With SPICE Low Level Components</b></summary>


Devices have been added inside the subcircuits (.subckt). Since their instance names do not begin with X, they are not subcircuit instances but primitive (low-level) devices such as MOSFETs, resistors, or capacitors. During LVS, some low-level devices, like resistors, have interchangeable (permutable) terminals because swapping their two pins does not change their electrical behavior. Netgen can be configured to recognize these pin permutations so that it does not report false LVS mismatches when the resistor terminals are reversed between the schematic and the layout.
First copy the tech file to the same directory:


```
cp /usr/share/pdk/sky130A/libs.tech/netgen/sky130A_setup.tcl .Editing the run_lvs.sh script
```

```
$ netgen -batch lvs "netA.spice test" "netB.spice test" \
  sky130A_setup.tcl \
  exercise_4_comp.out -json | tee lvs.log
```


Apending the following lines to the bottom of sky130A_setup.tcl

```
permute "-circuit1 cell1" A C
permute "-circuit2 cell1" A C
```


<img width="940" height="427" alt="image" src="https://github.com/user-attachments/assets/f30edf1f-a423-4990-8e4c-d81bcd0bca48" />


Now the circuits match.


<img width="940" height="427" alt="image" src="https://github.com/user-attachments/assets/1a7fa771-22bb-4a15-a292-55c4b18a8ecb" />


For the diode subckt when pins A and C are swapped both at the port name and low level cells, after running lvs we get no error but the comp.out file highlights how pins A and C have been swapped.


</details>


<details>
<summary><b>L5 - LVS For Small Analog Block - Power-On Reset - Part 1</b></summary>

To go inside the block, its “e”, to come back “ctrl+e”


```
->Click netlist option
```


While netlisting, make sure that lvs is a subckt is selected.


<img width="940" height="339" alt="image" src="https://github.com/user-attachments/assets/fc325d3f-f37a-4fa4-9b81-5b67592a97b1" />


<img width="940" height="444" alt="image" src="https://github.com/user-attachments/assets/c0f54355-b381-4114-8b00-97c33cced868" />


Now we have to extract the magic netlist.


<img width="940" height="410" alt="image" src="https://github.com/user-attachments/assets/89b9b5c3-db2f-41b4-afb6-db7359923e7b" />


<img width="940" height="420" alt="image" src="https://github.com/user-attachments/assets/470ff292-79d0-40bc-a407-1fb647c4c5aa" />


<img width="940" height="508" alt="image" src="https://github.com/user-attachments/assets/44077cf4-2c00-4961-8cb1-3a67b767882f" />


<img width="940" height="405" alt="image" src="https://github.com/user-attachments/assets/74e2ac71-9a77-4e60-a877-8c44cd396322" />


On comparing the netlists using netgen we can see that the issue is with the defination of standard cells, as they are missing in the netlist they are treated as blackbox cells.


<img width="940" height="358" alt="image" src="https://github.com/user-attachments/assets/5e3db340-4429-4e4d-975a-260194f93115" />


<img width="940" height="501" alt="image" src="https://github.com/user-attachments/assets/207b3889-fb51-4f3e-b095-9e6c88f3e482" />


</details>


<details>
<summary><b>L6 - LVS For Small Analog Block - Power-On Reset - Part 2</b></summary>


By analyzing the example_por, we observe that the layout netlist has a hierarchical structure:


o	Top-level circuit → Parameterized devices → Low-level devices


•	In contrast, the schematic netlist has a simpler hierarchy:


o	Top-level circuit → Low-level devices


•	During LVS, Netgen automatically flattens the hierarchy of both the layout and schematic netlists so that they can be compared on an equivalent basis.


•	Netgen is capable of comparing any specified cells (subcircuits) within the schematic and layout netlists, rather than being limited to only the top-level cell.


•	Parameterized devices (PCells) in the layout are typically extracted as multiple interconnected primitive (low-level) devices, rather than as a single parameterized device.


•	During the LVS process, Netgen automatically flattens these extracted primitive devices, allowing them to be compared with their corresponding schematic representation and ensuring that both implementations are recognized as electrically equivalent.


<img width="940" height="249" alt="image" src="https://github.com/user-attachments/assets/95b5684d-f3da-4c60-83de-4f0990e22d8c" />


<img width="940" height="416" alt="image" src="https://github.com/user-attachments/assets/65847788-40f0-4385-a449-3aabddf3e2df" />


<img width="940" height="440" alt="image" src="https://github.com/user-attachments/assets/6ff45821-afba-43c5-974d-526be55b1286" />


i0_analog[4] error, In the .mag file for the circuit we can see the 2 nets are shorted, that can be fixed by adding a resistor (resmet3) on the layer.


<img width="940" height="411" alt="image" src="https://github.com/user-attachments/assets/51e977dc-c58c-4d24-926f-70e4f2f5ae89" />


<img width="940" height="408" alt="image" src="https://github.com/user-attachments/assets/8d6bb4ed-26a7-48d3-b854-77d6e4ac8e8d" />



<img width="940" height="401" alt="image" src="https://github.com/user-attachments/assets/f2139961-a08d-4546-9406-0d382b8e90a6" />


</details>


<details>
<summary><b>L7 - LVS Layout Vs Verilog For Standard Cell</b></summary>


<img width="940" height="496" alt="image" src="https://github.com/user-attachments/assets/cf67e974-2c72-476c-8f98-d68c5637a8da" />


<img width="940" height="516" alt="image" src="https://github.com/user-attachments/assets/34ece503-6979-424f-9ab5-fa56df7d99de" />


</details>


---
