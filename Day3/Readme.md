# Day 3 - Front-End and Back-End Verification Concepts

### PV_D3SK1 - Introduction to DRC rules

<details>
<summary><b>L1 - Introduction To Basic Silicon Manufacturing Process</b></summary>


<img width="701" height="457" alt="image" src="https://github.com/user-attachments/assets/0db70d3a-e1ee-451b-ba3b-ec4917e31bd0" />


The planar silicon manufacturing process is the foundation of modern CMOS fabrication, where semiconductor devices and interconnects are built layer by layer on a flat silicon wafer. The process begins with a P-type substrate, followed by the formation of an N-well for PMOS devices. Source and drain regions are created through ion implantation, while polysilicon is deposited to form the transistor gates. After insulating oxide layers are added, Metal 1 is used for the first level of routing, and vias provide vertical connections to higher metal layers such as Metal 2. This layered and planar approach enables precise device fabrication, reliable electrical interconnections, and the high integration density required for modern VLSI circuits.


<img width="940" height="1411" alt="image" src="https://github.com/user-attachments/assets/b50f3601-2664-426c-befe-a509cdf02bbe" />


<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/2c386527-3778-460e-a948-dabcf8145a5e" />

</details>

<details>
<summary><b>L2 - Backend Metal Layer Rules</b></summary>

**Minimum width:** Because below this, the routing wires might become fragile & results in short circuit.

<img width="648" height="542" alt="image" src="https://github.com/user-attachments/assets/affd5141-14a2-4199-878c-b568a23ec079" />

**Spacing:** If no proper spacing, then shorts can happen.


<img width="719" height="554" alt="image" src="https://github.com/user-attachments/assets/b05de471-df95-46b5-b98a-f9d6f2f845ab" />


<img width="860" height="604" alt="image" src="https://github.com/user-attachments/assets/82490628-999d-40df-a47b-7aef57b4fa15" />


<img width="706" height="589" alt="image" src="https://github.com/user-attachments/assets/3a029bc4-dc27-4210-b5a2-b82a7bebe1f0" />


<img width="903" height="598" alt="image" src="https://github.com/user-attachments/assets/41e18cb9-114c-44ce-83fd-f4caebaa40aa" />


<img width="819" height="445" alt="image" src="https://github.com/user-attachments/assets/305358fe-8556-47b4-8a47-0250fd74ea20" />


<img width="791" height="476" alt="image" src="https://github.com/user-attachments/assets/2dd23e4e-6d33-40a3-abfb-b34f867ea216" />


<img width="747" height="589" alt="image" src="https://github.com/user-attachments/assets/2918ad87-2638-4df2-87a6-41d04e339129" />

These are the cuts on the oxide of the below layer(here on metal 1, when metal 2 must be connected.


<img width="876" height="632" alt="image" src="https://github.com/user-attachments/assets/be839d49-f537-42cd-a5d6-dec95bde7cd0" />


<img width="859" height="617" alt="image" src="https://github.com/user-attachments/assets/45d6a3c1-c826-4fe1-8819-e2583a3d0ed7" />


<img width="789" height="592" alt="image" src="https://github.com/user-attachments/assets/6f176a81-49c2-4bbf-8114-924d35d1c334" />


</details>

<details>
<summary><b>L3 - Local Interconnect Rules</b></summary>

<img width="867" height="581" alt="image" src="https://github.com/user-attachments/assets/b6983d29-c48b-4cdd-ac76-f9259389fd42" />


Local interconnect is a new concept in sky water pdks. Mostly after poly, through a contact metal 1 will be the next routing layer. But in skywater pdk, there is another layer made of TiN which lies between poly & Metal 1. Since its resistance is high, it should be used as a short wire only. 


<img width="713" height="506" alt="image" src="https://github.com/user-attachments/assets/37c31bf6-9e80-49cc-833a-dd67a1053534" />


</details>

<details>
<summary><b>L4 - Front-End Rules, Transistors Implants, ID and Boundary Layers, Wells And Same Net Rules</b></summary>


<img width="940" height="501" alt="image" src="https://github.com/user-attachments/assets/20cdd60f-c2e2-4470-b8c3-f49410348c0e" />


<img width="756" height="525" alt="image" src="https://github.com/user-attachments/assets/4bb3e4dd-3c3e-48a4-901a-c15b505bd56b" />


<img width="940" height="627" alt="image" src="https://github.com/user-attachments/assets/99fdf365-89bb-4197-b750-b702856d240a" />

Note: An AI created image.


<img width="726" height="442" alt="image" src="https://github.com/user-attachments/assets/2644e769-512a-4ff1-a6cf-027246a22486" />


<img width="717" height="359" alt="image" src="https://github.com/user-attachments/assets/3ec67f7e-2cf4-40a9-b184-66b6527aaecf" />


<img width="940" height="475" alt="image" src="https://github.com/user-attachments/assets/db9c2f64-c327-485a-a5a8-c0b5218599f5" />


</details>

<details>
<summary><b>L5 - Deep N-Well And High Voltage Rules</b></summary>


<img width="767" height="554" alt="image" src="https://github.com/user-attachments/assets/7b4b47ff-e0d8-4c97-b5fb-46836feab138" />


In this normal CMOS, the pmos is protected from the substrate noise (the noise generated from other devices connected to the substrate). But at the same time. Nmos is connected to the substrate & the noise will directly get coupled to nmos. Inorder to avoid this, we introduce another layer names, deep nwell into this.


<img width="940" height="563" alt="image" src="https://github.com/user-attachments/assets/caf7e19e-c9d7-400d-81c8-1a9583dfaddf" />


<img width="940" height="552" alt="image" src="https://github.com/user-attachments/assets/964608d0-7710-4291-b646-60f8ff9dd22e" />


<img width="760" height="578" alt="image" src="https://github.com/user-attachments/assets/cefe4c47-ac18-4dbd-aa4f-077a98a59937" />


<img width="882" height="553" alt="image" src="https://github.com/user-attachments/assets/a92f55b5-73b1-4d86-bae1-52e278772536" />


<img width="742" height="642" alt="image" src="https://github.com/user-attachments/assets/023cdd21-acde-43ed-8781-3108a301a389" />


<img width="731" height="626" alt="image" src="https://github.com/user-attachments/assets/7ff44c7c-5c68-4efe-8bc3-be0f0f6f9527" />


</details>

<details>
<summary><b>L6 - Device Rules</b></summary>


<img width="1024" height="1536" alt="ChatGPT Image Jul 2, 2026, 04_03_41 PM" src="https://github.com/user-attachments/assets/f94ce0db-3d27-4d79-a6c3-59f53b5e7216" />

## Device Rules – Capacitors & Diodes

Integrated circuits employ different capacitor structures depending on the required capacitance, linearity, voltage range, and application. The commonly used capacitor types are **Varactors**, **MOS Capacitors (MOScap)**, **Vertical Parallel Plate (VPP) Capacitors**, and **Metal-Insulator-Metal (MiM) Capacitors**.

### Varactor
A **Varactor** is a voltage-controlled capacitor whose capacitance varies with the applied bias voltage. It is formed at the **gate-to-channel interface** and is widely used in RF circuits, Voltage-Controlled Oscillators (VCOs), and Phase-Locked Loops (PLLs).

**Design Rules:**
- Channel Length (L) ≥ **0.18 μm**
- Channel Width (W) ≥ **1.0 μm**
- Gate-to-channel interface forms the capacitor.

---

### MOS Capacitor (MOScap)
A **MOS Capacitor (MOScap)** is formed using the MOS transistor gate. The gate acts as one capacitor plate, while the channel forms the other. In this implementation, the **source and drain terminals are tied together**, and the structure follows the **same DRC rules as a standard MOSFET**. MOScaps are commonly used as **decoupling capacitors (decaps)** and in analog filtering applications.

---

### Vertical Parallel Plate (VPP) Capacitor
A **Vertical Parallel Plate (VPP) Capacitor** is constructed using multiple parallel metal fingers. The capacitance is mainly generated due to the **sidewall capacitance** between adjacent metal fingers.

**Key Points:**
- Multiple metal layers are used to increase capacitance.
- Metal **width** and **spacing** must satisfy standard DRC rules.
- Commonly used in analog layouts requiring higher capacitance density and better matching.

---

### Metal-Insulator-Metal (MiM) Capacitor
A **Metal-Insulator-Metal (MiM) Capacitor** consists of two metal plates separated by a thin dielectric layer, providing highly linear and accurate capacitance.

**Design Rules:**
- MiM capacitor width ≥ **1.0 μm**
- MiM capacitor must surround **Via3** by **≥ 0.14 μm**

MiM capacitors are widely used in **precision analog**, **RF**, and **mixed-signal circuits** due to their excellent matching and linearity.

---

### Diodes
The diode shown is implemented using an **N-diffusion to substrate junction**, where the diffusion region and substrate naturally form a **parasitic PN junction**. Such structures are commonly utilized for **ESD protection**, **voltage clamping**, and other protection circuits.

---

### Summary

| Device | Key Design Rule | Purpose |
|---------|-----------------|---------|
| **Varactor** | L ≥ 0.18 μm, W ≥ 1.0 μm | Voltage-dependent capacitor |
| **MOScap** | Follows MOSFET DRC rules | Decoupling and analog capacitor |
| **VPP Capacitor** | Follow metal width & spacing rules | Sidewall capacitance using metal fingers |
| **MiM Capacitor** | Width ≥ 1.0 μm, Surround Via3 ≥ 0.14 μm | High-precision linear capacitor |
| **Diode** | Follow diode/device rules | Protection and parasitic diode structures |

> **Note:** The figures presented in this section are **adapted from the lecture screenshots** used in the course. They have been **reorganized, annotated, and enhanced using AI** to improve clarity and readability while preserving the original technical concepts. The original layouts and teaching material belong to their respective instructor.


</details>

<details>
<summary><b>L7 - Miscellaneous Rules Latch-up Antenna Stress Rules</b></summary>


<img width="934" height="592" alt="image" src="https://github.com/user-attachments/assets/97740354-5dc5-4984-92f9-540e8fb4d223" />



<img width="742" height="600" alt="image" src="https://github.com/user-attachments/assets/a38d868e-1892-404a-b420-329719d5cf78" />


Latch-up is an undesirable condition in CMOS integrated circuits where a low-resistance path is unintentionally formed between the power supply (VDD) and ground (VSS) due to the activation of parasitic PNPN structures inherent in the CMOS process. This results in excessive current flow, which can lead to circuit malfunction, overheating, and permanent device damage if not interrupted. Latch-up can be triggered by voltage spikes, substrate noise, or electrostatic discharge (ESD). To improve latch-up immunity, CMOS layouts incorporate design techniques such as guard rings, well and substrate contacts, proper device spacing, and adherence to foundry-defined design rules.


<img width="1199" height="1312" alt="ChatGPT Image Jul 2, 2026, 04_11_59 PM" src="https://github.com/user-attachments/assets/6e10e1e5-12e9-4998-bb45-9c8a226eaed2" />



## Antenna Rules

The **Antenna Effect** occurs during IC fabrication when long metal interconnects accumulate electrical charge during plasma etching. If the accumulated charge is connected only to a MOS transistor gate, it can discharge through the thin gate oxide, causing permanent oxide damage and reducing device reliability. To prevent this, foundries define **Antenna Rules** that limit the amount of metal connected to a gate during intermediate fabrication steps.

The infographic illustrates the complete antenna rule concept, beginning with the cause of the antenna effect, followed by examples of how antenna violations occur during fabrication, and finally the commonly used techniques for eliminating these violations.

### Key Concepts

- Long metal routing connected only to a transistor gate behaves like an **antenna**, collecting plasma-induced charge during fabrication.
- Although the completed layout may appear electrically safe, intermediate fabrication stages can temporarily leave the gate connected to an isolated metal segment, making it vulnerable to charge accumulation.
- Antenna rule checking is based on the **antenna ratio**, which limits the amount of metal connected to a transistor gate relative to the gate oxide area.
- Excessive antenna ratio can result in **gate oxide breakdown**, permanently damaging the transistor.
- A common solution is to connect an **antenna diode**, providing a discharge path for accumulated charge through the diffusion junction.
- Another widely used solution is the **metal jumper technique**, where the routing transitions to a higher metal layer early, reducing the lower-metal area connected to the gate.
- Standard-cell libraries typically include **antenna diodes on input pins** to improve protection against plasma-induced charging.

### Summary

| Topic | Description |
|--------|-------------|
| Antenna Effect | Plasma-induced charge accumulation on isolated metal connected to a MOS gate |
| Main Risk | Gate oxide damage due to charge discharge |
| Antenna Rule | Limits the metal-to-gate antenna ratio |
| Fix 1 | Add an antenna diode to safely discharge accumulated charge |
| Fix 2 | Use metal jumpers to higher metal layers to reduce antenna ratio |
| Standard Practice | Digital standard-cell inputs generally include antenna protection diodes |

> **Note:** The concepts presented in the infographic are **adapted from the lecture screenshots** of the VSD workshop/course. The original lecture material belongs to its respective instructor(s). The infographic included in this repository has been **generated and enhanced using AI** by reorganizing and annotating the lecture content into a concise study aid for educational purposes.


</details>

<details>
<summary><b>L8 - Density Rules</b></summary>


Polishing in VLSI manufacturing refers to the Chemical Mechanical Polishing (CMP) process, which is used to flatten (planarize) the wafer surface after the deposition of materials such as silicon dioxide (SiO₂), metals, or other dielectric layers. CMP combines chemical reactions with mechanical abrasion to remove excess material, resulting in a smooth and uniform surface for subsequent fabrication steps.


<img width="739" height="534" alt="image" src="https://github.com/user-attachments/assets/753efa20-9c44-4bb3-9680-22b55f688360" />

So before polishing, the metal layers should be uniform in the surface. In this figure when there is a gap between two metal layers & polishing is been done, we can see some bump on the overall layer.


<img width="734" height="532" alt="image" src="https://github.com/user-attachments/assets/e56a33be-59e3-481b-aa3a-adf680a93f1b" />


But as see if there are some fills metal & then polishing been done, the surface becomes flat.
But for analog circuits, it will create unwanted capacitances & it becomes very difficult to tackle. So that time we use a fill blockage layer where these filler cells should not be added.


</details>

<details>
<summary><b>L9 - Recommended Rules, Manufacturing Rules and ERC Rules</b></summary>


<img width="791" height="585" alt="image" src="https://github.com/user-attachments/assets/cc422700-2168-497a-ac6d-14734c08c214" />


## Rules for Production vs. Test

### 1. Manufacturing Rules (Production Rules)

> **Any violation of these rules results in immediate rejection of the layout by the foundry.**

These rules ensure that the layout can be fabricated reliably.

#### Types of Manufacturing Rules

* **Width Rules**

  * Specify the minimum and maximum width of layout geometries (metal, poly, diffusion, etc.).
  * Prevent open circuits and fabrication defects.

* **Spacing (Notch) Rules**

  * Define the minimum spacing between adjacent geometries.
  * Include notch rules to prevent narrow gaps that are difficult to manufacture.

* **Minimum Area Rules**

  * Ensure every polygon has a minimum allowable area.
  * Prevent incomplete pattern formation during fabrication.

* **Overlap (Surround) Rules**

  * Specify how much one layer must surround another.
  * Example: Contact must be sufficiently enclosed by metal.

* **Extension Rules**

  * Define the minimum extension of one layer beyond another.
  * Example: Metal must extend beyond a via by a specified amount.

* **Angle and Off-Grid Rules**

  * Restrict illegal angles (other than allowed angles like 45° or 90°).
  * Ensure all layout objects lie on the manufacturing grid.

* **Density Rules (Rarely)**

  * Control the percentage of material present in a region.
  * Used to maintain uniform polishing and fabrication quality.

---

## Rule Waivers

### Manufacturing Waiver

A **manufacturing waiver** is a formal declaration by the customer stating that:

* The layout is **known to violate** a particular manufacturing rule.
* The customer accepts the associated risks.
* The **foundry is not responsible** for any failures or issues caused by that violation.

> Rule waivers are granted only in exceptional situations and are generally avoided in production designs.

---

## ERC (Electrical Rule Checks)

ERC verifies the **electrical reliability** of the design rather than just its physical geometry.

### Common ERC Checks

* **Electromigration (Maximum Current Density)**

  * Ensures that metal wires do not carry current beyond their safe limit.
  * Excessive current density can cause metal atoms to migrate, eventually leading to open circuits.

* **Overvoltage Conditions**

  * Detects nets or devices operating above their allowable voltage limits.
  * Prevents oxide breakdown and long-term device reliability issues.

---


| Category                      | Purpose                             | Examples                                                         |
| ----------------------------- | ----------------------------------- | ---------------------------------------------------------------- |
| **Manufacturing Rules (DRC)** | Ensure the layout is manufacturable | Width, Spacing, Minimum Area, Overlap, Extension, Angle, Density |
| **Manufacturing Waiver**      | Accept a known rule violation       | Customer takes responsibility; foundry is not liable             |
| **ERC**                       | Ensure electrical reliability       | Electromigration, Overvoltage checks                             |

</details>


### PV_D3SK2 - Labs for all DRC rules



<details>
<summary><b>L1 - Lab For Width Rule And Spacing Rule</b></summary>

```
% git clone https://github.com/RTimothyEdwards/vsd_drc_lab.git
% ./run_magic
```

File->open

<img width="940" height="443" alt="image" src="https://github.com/user-attachments/assets/6a2a9644-1a10-4543-852b-6ea877c3ea4c" />

<img width="940" height="378" alt="image" src="https://github.com/user-attachments/assets/f1b9bb8b-6cd6-444f-afb2-fd0107139d69" />

<img width="940" height="364" alt="image" src="https://github.com/user-attachments/assets/5250cfd0-dce3-4fae-9252-52da626ac0c3" />


To get the error, put the cursor in the layout window near the error region & press “?”. It will automatically give the error message in the console.


<img width="417" height="564" alt="image" src="https://github.com/user-attachments/assets/b73fd716-2f35-4e41-8b4e-9b0f5e96c36d" />


The white dot rectangle is the region to which the metal should be extended. That is from the left side of the pink metal rectangle to the right end of the white rectangle will be 0.14 u (error message).


<img width="940" height="365" alt="image" src="https://github.com/user-attachments/assets/c30312e1-73f6-49b7-b4a8-42a8034adb35" />


To get the dimensions:

```
% Select the region (“s” key) then press “b”
```


<img width="940" height="346" alt="image" src="https://github.com/user-attachments/assets/3005fb22-a076-4d72-b413-9746119a65c3" />


For grid lines select 0.10u.


<img width="940" height="346" alt="image" src="https://github.com/user-attachments/assets/386c755f-1cdb-4065-beb7-a081788a2a42" />


To remove the error. Select the whole rectangle including the white one. Hover the cursor on the region, press middle button(painting). Then the pink metal 2 will expand to the white one. This will make the width as 0.14u. This is a manual method.


<img width="940" height="345" alt="image" src="https://github.com/user-attachments/assets/27d5f467-ae07-4cbf-9ddd-d0290d491bf9" />


Select the box, press “:” to get the access to the console. Then type these

```
% box width 0.14um
% paint m2
```


For the next cell: Spacing Rule:

<img width="940" height="326" alt="image" src="https://github.com/user-attachments/assets/251b8e6d-64a0-47fb-9b29-5e5abb518e17" />


<img width="940" height="411" alt="image" src="https://github.com/user-attachments/assets/b7a98719-29bc-4f1b-9527-38461fe76e87" />


Press the second box, then press the “^” key (number 6) to move to right.

</details>

<details>
<summary><b>L2-Lab For Wide Spacing Rule And Notch Rule</b></summary>

**Wide spacing rule**

<img width="940" height="343" alt="image" src="https://github.com/user-attachments/assets/2eaf796f-7323-46ef-91a4-87c23ec22058" />


<img width="940" height="456" alt="image" src="https://github.com/user-attachments/assets/74e61c53-372a-4c9e-abea-8c435940f896" />


After the wide metal spacing is solved, the drc errors are gone.

**Notch rule :**


<img width="940" height="398" alt="image" src="https://github.com/user-attachments/assets/1be21c57-e096-4456-b239-83212a72ef51" />


For notch, select the area, then press “a” to get the area. Then press “8” (number key to move up). For normal stretching, we can use:


<img width="248" height="60" alt="image" src="https://github.com/user-attachments/assets/3f850b87-05a9-4c27-9004-2cf2c2a9a463" />


</details>

<details>
<summary><b>L3 - Lab For Via Size, Multiple Vias, Via Overlap and Autogenerate Vias</b></summary>


**Exercise_2a via_size**

<img width="940" height="473" alt="image" src="https://github.com/user-attachments/assets/713f4691-3407-444e-9b4e-3e6d855fd6eb" />


After stretching the via error is gone.

**Exercise_2b Multiple Vias**


<img width="940" height="368" alt="image" src="https://github.com/user-attachments/assets/38003918-4d75-4cb9-a2e9-6f200c757191" />


To see the via cuts we need to know the name of the via. This can be obtained from the documentation. Here the via is between the interconnect layer and the M1. Its name is MCON. 


```
% cif see MCON
% cif see MCON
% feedback why
CIF layer "MCON"
% feeedback clear
% feedback clear
```


**Exercise_2c Via overlap**


<img width="940" height="334" alt="image" src="https://github.com/user-attachments/assets/f3922a47-812b-4410-bc6c-d678565213d6" />


<img width="940" height="339" alt="image" src="https://github.com/user-attachments/assets/d62d7bde-3c1a-4fd3-a8dc-e5276ebd0685" />


Select the M1 square & extend the edges by 0.03 um.

**Exercise_2d Auto generate Via**


<img width="401" height="370" alt="image" src="https://github.com/user-attachments/assets/c461b88a-7004-47ec-9e91-def328889324" />


Press the “space key” for wiring. But if need to change the wire to other metal, press “shift” without leaving the mouse. This will generate a auto via and jumps to next metal.


</details>

<details>
<summary><b>L4 - Lab For Minumum Area Rule And Minimum Hole Rule</b></summary>


**Exercise_3a Minimum area rule**


<img width="940" height="370" alt="image" src="https://github.com/user-attachments/assets/b542750d-8b94-42c0-8270-d38b9583f07e" />


<img width="940" height="658" alt="image" src="https://github.com/user-attachments/assets/97556582-d18a-4411-a111-e99d5695395e" />


Strech the box to increase the area.


<img width="940" height="377" alt="image" src="https://github.com/user-attachments/assets/485f6b97-68a6-4ce8-b435-1d112add9fd0" />


To jump to M2 from li, drag shift+ 2 times left mouse button, again drag.


<img width="940" height="589" alt="image" src="https://github.com/user-attachments/assets/131466ed-24aa-4586-a069-ea37396bb3d6" />


**Exercise_3B Minimum Hole Rule**


<img width="940" height="460" alt="image" src="https://github.com/user-attachments/assets/8b73db06-1a08-441b-8e09-79654dbc7f86" />


<img width="940" height="334" alt="image" src="https://github.com/user-attachments/assets/f246c43f-a3c2-47da-9e4f-1d09e60eb2b6" />


<img width="940" height="375" alt="image" src="https://github.com/user-attachments/assets/28f0ffcd-9071-4546-8b24-7a128f584678" />


Now inorder to increase the hole area, we can erase some metal1 portion.


<img width="940" height="378" alt="image" src="https://github.com/user-attachments/assets/e3b9fa62-2b15-4caa-b938-ee0f17b502a7" />


<img width="940" height="331" alt="image" src="https://github.com/user-attachments/assets/96ab0a43-809b-47a6-86ab-cb790ac532ad" />


After erasing, the drc error goes away.


</details>

<details>
<summary><b>L5 - Lab For Wells And Deep N-Well</b></summary>


**Exercise_4a wells**

<img width="940" height="386" alt="image" src="https://github.com/user-attachments/assets/fa97ecd7-0c00-4a88-9222-af895f955a57" />


n-well need a n-tap which can connect it to corresponding potential. N-tap is made of n-diff layer. So we need to draw a n-diff layer. Then usually the contact should be made till the “li” layer. But right now we don’t need that.


<img width="940" height="327" alt="image" src="https://github.com/user-attachments/assets/587a26a8-ed24-4008-b1b8-c5ff830925e3" />


So the compromise in contact can be made by using the contact “nsubstratencontact”.


<img width="940" height="311" alt="image" src="https://github.com/user-attachments/assets/80f731da-1d92-4b5c-a402-4e3023e07e68" />


<img width="514" height="428" alt="image" src="https://github.com/user-attachments/assets/22ddaacf-edf4-4fff-9e0a-e033e85c6f27" />


**Exercise_4b wells**


<img width="940" height="422" alt="image" src="https://github.com/user-attachments/assets/3a2b6e01-3d46-43bc-84f1-e60e63ac0385" />


<img width="940" height="379" alt="image" src="https://github.com/user-attachments/assets/d9747799-5b83-438b-b95a-728f17ab607c" />


**Exercise_4c deep nwell**


<img width="940" height="389" alt="image" src="https://github.com/user-attachments/assets/1b316fd8-899b-411c-b8dd-cec70de756fc" />


After stretching,


<img width="940" height="394" alt="image" src="https://github.com/user-attachments/assets/2c9dbe74-8ade-4fc3-a947-d3c6fd3af245" />


<img width="940" height="467" alt="image" src="https://github.com/user-attachments/assets/e730d241-e883-4eda-8d34-c25271bbb16a" />


</details>

<details>
<summary><b>L6 - Lab For Derived Layers</b></summary>


**Exercise_5a derived layers**


<img width="940" height="371" alt="image" src="https://github.com/user-attachments/assets/ec1addd7-21f6-445f-9e71-e98a2334ee36" />


<img width="940" height="411" alt="image" src="https://github.com/user-attachments/assets/d8d4982b-6ab0-4738-a1d5-f06b6e5eee37" />


<img width="940" height="648" alt="image" src="https://github.com/user-attachments/assets/f5e0219a-0f6e-412f-94f6-a672f3a44af7" />


**Exercise_5b**


<img width="940" height="416" alt="image" src="https://github.com/user-attachments/assets/e2b99735-f263-479c-9183-7c8bfe040398" />


**Exercise_5c**


<img width="940" height="208" alt="image" src="https://github.com/user-attachments/assets/c235fe39-e2e0-497f-b62b-a9c9d15d12cc" />


</details>

<details>
<summary><b>L7 - Lab For Paramterized And PDK Devices</b></summary>


Since there are sub cells, first select “s”, then “x” to expand.


**Exercise_6a Parametrised cells**


<img width="940" height="533" alt="image" src="https://github.com/user-attachments/assets/ae2ac51e-ba25-4140-b38b-4ddc0556efa3" />


Even though it’s a parametrised cell whose layout is scalable, we can find metal 1 area errors. This is intentionally not solved because once this device is used somewhere for some routing purpose, we will draw metal line over it & it will be gone.


<img width="940" height="445" alt="image" src="https://github.com/user-attachments/assets/d8a1bf5e-6758-4a50-9829-bad631787aa4" />


<img width="940" height="425" alt="image" src="https://github.com/user-attachments/assets/38162a56-d28c-439c-a790-aec99047c4b4" />



</details>

<details>
<summary><b>L8 - Lab For Angle Error And Overlap Rule</b></summary>


<img width="940" height="362" alt="image" src="https://github.com/user-attachments/assets/8a917cc1-7ca2-4454-aebe-643a0884f59c" />


<img width="940" height="387" alt="image" src="https://github.com/user-attachments/assets/37b1032e-69c6-4f98-a207-4e00250e1680" />


<img width="940" height="372" alt="image" src="https://github.com/user-attachments/assets/34e136b2-f101-417d-a632-a85c3cb981b5" />


<img width="940" height="314" alt="image" src="https://github.com/user-attachments/assets/79c37267-30d9-485b-9a2f-c6554416994e" />


</details>

<details>
<summary><b>L9 - Lab For Unimplemented Rules</b></summary>


Sealring is used to protect the chip from outside catastrophes.
Sealring generation: w=2000 l=2000


<img width="940" height="278" alt="image" src="https://github.com/user-attachments/assets/168cc738-d27c-44a7-87f6-b8eac19c5a3c" />


<img width="940" height="396" alt="image" src="https://github.com/user-attachments/assets/e5f212a9-a070-4a89-ae1f-c301b747ee35" />


This the seal ring which is generated through scripts.


```
quit : quit the magic, go to the same terminal where we created sealring
% ./gds_magic
```


<img width="940" height="412" alt="image" src="https://github.com/user-attachments/assets/fc3e8a8f-9aa5-418b-ac94-08dab7166211" />


<img width="940" height="452" alt="image" src="https://github.com/user-attachments/assets/2e224271-89f2-4f39-b435-f3b91ac8aa80" />


Before it was abstract view, now in the gds view, we could see layers.


</details>

<details>
<summary><b>L10 - Latch-up And Antenna Rules</b></summary>


<img width="940" height="347" alt="image" src="https://github.com/user-attachments/assets/3478e156-4503-4d58-9aae-6e1c30e52c32" />


<img width="940" height="465" alt="image" src="https://github.com/user-attachments/assets/7f9fa3ae-2ba1-469d-aeda-4026d37b748a" />


For electrical rule checks, first the layout has to be extracted.


```
% extract do local
% extract all
% antennacheck
```


<img width="940" height="415" alt="image" src="https://github.com/user-attachments/assets/d3b0a867-99b8-4514-af63-a4e76ebd265e" />


<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/c14dc3be-42be-4fcf-ac54-223a5e211973" />


<img width="940" height="460" alt="image" src="https://github.com/user-attachments/assets/8bcb9124-98ae-45d4-a2da-9726dc930f8d" />


Inorder to avoid antenna violations(due to long m2), we can directly connect this metal2 to a diffusion diode which will expel the excess charge.


<img width="940" height="438" alt="image" src="https://github.com/user-attachments/assets/ea8db2f3-66e2-41e5-b59b-1b6932f28ddb" />


<img width="940" height="415" alt="image" src="https://github.com/user-attachments/assets/b2671269-99f4-4026-8a61-debae4b6439a" />


<img width="940" height="430" alt="image" src="https://github.com/user-attachments/assets/4401e537-020b-47a0-8ba6-0daf1c65f89c" />


Removing M3 & routing via M1 removes antenna violation. Because M3 is fabricated after M2, so all the metal ions which will be accumulated on a M2 layer creates a huge area to be connected to the gate. But when M1 is get connected, since its fabricated first, no charge accumulation occurs.
Removing the Metal 3 (M3) segment and routing the connection through Metal 1 (M1) eliminates the antenna violation. Since Metal 1 is fabricated before the higher metal layers, the gate is connected earlier in the manufacturing process, preventing excessive plasma charge from accumulating on a large floating conductor. If the connection is made through M3, the lower metal layers (such as M1 and M2) remain electrically connected to the gate but are not yet connected to the higher routing, allowing plasma-induced charge to build up during fabrication. This increases the effective metal area connected to the gate and raises the antenna ratio. Routing through M1 provides an earlier discharge path, thereby reducing charge accumulation and eliminating the antenna violation.


</details>

<details>
<summary><b>L11 - Lab For Density Rules</b></summary>


<img width="860" height="579" alt="image" src="https://github.com/user-attachments/assets/21bb1c44-6438-4191-a81c-476df067c9f8" />

Metal 1 is under-dense, whereas Metal 2 is over-dense.

<img width="940" height="430" alt="image" src="https://github.com/user-attachments/assets/dfcc4bbb-eafd-46f1-94ce-9643a43d620b" />


<img width="940" height="269" alt="image" src="https://github.com/user-attachments/assets/33db8615-060a-428f-b604-6543a80954c4" />


<img width="940" height="421" alt="image" src="https://github.com/user-attachments/assets/4f8244f7-2dd6-4ae4-aecd-a7f637bbbf00" />


<img width="940" height="418" alt="image" src="https://github.com/user-attachments/assets/ade34aba-be31-4863-a1d9-ea31847caa4f" />


<img width="940" height="406" alt="image" src="https://github.com/user-attachments/assets/1802d5b9-ef6b-4455-b243-88045759a63b" />


<img width="940" height="428" alt="image" src="https://github.com/user-attachments/assets/021d4efc-ccb6-4515-882d-977f79520fb4" />


<img width="940" height="414" alt="image" src="https://github.com/user-attachments/assets/3461c407-c681-42fc-a3b2-437883aabcd7" />


Select the cell “s” and expand “x”


<img width="940" height="433" alt="image" src="https://github.com/user-attachments/assets/92d30b6b-eb3e-4d0f-9d57-e6d1757eb0c3" />


<img width="940" height="431" alt="image" src="https://github.com/user-attachments/assets/f9afe509-7583-4021-af20-4660890cab86" />


</details>

--
