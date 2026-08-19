# Day 4 - OpenLane and Physical Verification Flow - Additional Content

### PV_D4SK1 - Understanding PNR and physical verification


<details>
<summary><b>L1 - The OpenLANE Flow</b></summary>


<img width="940" height="420" alt="image" src="https://github.com/user-attachments/assets/25b4a23f-eb67-4574-a5d1-1be1001ebe23" />


The steps used here are explained over here.


OpenLane Digital Physical Design Flow:


**Synthesis:** During synthesis, the Register Transfer Level (RTL) design written in Verilog is converted into a gate-level netlist using standard cells from the target technology library. In OpenLane, Yosys performs RTL synthesis, while ABC carries out technology mapping and logic optimization to generate an optimized gate-level representation.


**Static Timing Analysis (STA):** After synthesis, OpenSTA performs static timing analysis on the generated gate-level netlist to evaluate timing performance. It checks whether the design satisfies setup and hold timing constraints and generates detailed timing reports. At this stage, the analysis assumes ideal clocks, as the actual clock distribution network has not yet been created.


**Floorplanning:** Floorplanning defines the physical structure of the chip by determining the core area, placement rows, and routing tracks. It also places the input and output ports, inserts well tap and decoupling capacitor (decap) cells, and generates the Power Distribution Network (PDN) to ensure reliable power delivery throughout the design.


**Placement:** During placement, standard cells are positioned within the defined floorplan to minimize wire length and optimize timing, power, and area. The process begins with global placement, followed by optimization steps, and concludes with detailed placement, which legalizes cell locations while ensuring that all placement constraints are satisfied.



**Clock Tree Synthesis (CTS):** Clock Tree Synthesis is performed using TritonCTS to construct the clock distribution network. The tool inserts clock buffers and builds a balanced clock tree that minimizes clock skew and latency, enabling accurate clock propagation throughout the design. After CTS, the design contains real clocks instead of ideal clocks.


**Global Routing:** Global routing, performed by FastRoute, determines the approximate routing paths for all signal nets without generating the final wire geometries. It estimates routing resources, identifies congestion, and prepares the design for detailed routing. Fill insertion is also performed where required to satisfy manufacturing constraints.


**Antenna Diode Insertion:** Antenna diode insertion mitigates plasma-induced antenna effects that may damage transistor gate oxides during fabrication. OpenLane supports multiple DIODE_INSERTION_STRATEGY options, including no diode insertion, diode spraying, fake diode replacement, antenna avoidance routing, custom diode insertion scripts, or combinations of these methods, depending on the design requirements.


**Detailed Routing:** Detailed routing is carried out using TritonRoute, which converts the global routing solution into an exact physical routing layout while satisfying all design rules. The resulting DEF (Design Exchange Format) file accurately represents the physical placement and routing of the design.


**RC Extraction:** After routing, Magic performs resistance and capacitance (RC) extraction to generate a parasitic netlist that includes all layout-induced parasitic effects. This extracted information is used for post-layout static timing analysis, providing the most accurate timing evaluation because it accounts for the physical characteristics of the fabricated layout.


**Physical Verification:** Physical verification ensures that the layout is both manufacturable and electrically equivalent to the intended design. Magic performs Design Rule Checks (DRC) and antenna checks, KLayout provides an additional DRC verification, Netgen performs Layout Versus Schematic (LVS) verification, and CVC (Circuit Validity Checker) verifies the electrical correctness of the final circuit.


**GDSII Generation:** Once all verification stages are successfully completed, the final layout is streamed out as a GDSII file, which serves as the industry-standard format for IC fabrication. Both Magic and KLayout can generate the final GDSII file, with KLayout often used as a backup stream-out tool.


**Configuration (config.tcl):** The config.tcl file contains the configuration parameters that control the OpenLane flow, including synthesis, floorplanning, placement, routing, timing, and verification settings. By modifying these parameters, users can customize the physical design flow to meet the specific requirements of their design.


All the information about the project can be found in the openlANE documentation: 


https://openlane.readthedocs.io/en/latest/index.html


**config.tcl**

This file is necessary for running the openLANE flow and its documentation can be found at: 


https://openlane.readthedocs.io/en/latest/reference/configuration.html

________________________________________
Running the Complete OpenLane Flow (Non-Interactive)
The complete RTL-to-GDSII implementation can be executed in a single command. This mode automatically performs every stage of the ASIC design flow, including synthesis, floorplanning, placement, clock tree synthesis, routing, physical verification, and finally generates the GDSII and Magic (.mag) layout files.
export PDK_ROOT=/usr/local/share/pdk
make mount
./flow.tcl -design spm -tag run1
________________________________________
Running OpenLane in Interactive Mode
Interactive mode provides the flexibility to execute each stage of the design flow individually. This is particularly useful for understanding each step, debugging issues, and observing intermediate design outputs.
Launch OpenLane in Interactive Mode
export PDK_ROOT=/usr/local/share/pdk
make mount
./flow.tcl -interactive
________________________________________
Initialize the Design Environment
Load the OpenLane package, prepare the selected design, and create a dedicated run directory for storing all generated outputs.
package require openlane
prep -design spm -tag run1
________________________________________
Run Logic Synthesis
Convert the RTL description into a technology-mapped gate-level netlist using the synthesis engine.
run_synthesis
________________________________________
Execute Floorplanning
Create the chip floorplan by defining the core area, placement rows, routing tracks, power network, and locations for I/O pins and well tap cells.
run_floorplan
________________________________________
Perform Standard Cell Placement
Place all standard cells within the floorplan while optimizing utilization and ensuring a legal placement.
run_placement
________________________________________
Generate the Clock Tree
Build a balanced clock distribution network and perform timing analysis using propagated clocks.
run_cts
________________________________________
Optimize Clock Timing
Improve timing by resizing cells and optimizing critical timing paths after clock tree synthesis.
run_resizer_timing
________________________________________
Perform Signal Routing
Complete the physical interconnections between all placed standard cells through global and detailed routing.
run_routing
________________________________________
Generate the Powered Verilog Netlist
Create an updated gate-level netlist containing explicit power and ground connections for subsequent verification stages.
write_powered_verilog
set_netlist $::env(lvs_result_file_tag).powered.v
________________________________________
Stream Out the GDSII Layout Using Magic
Generate the final layout database in GDSII format from the routed design.
run_magic
________________________________________
Generate an Alternate GDSII Using KLayout
Create a second GDSII database using KLayout, which can later be used for layout comparison.
run_klayout
________________________________________
Perform XOR Verification
Compare the Magic and KLayout generated GDSII files to confirm that both layouts are geometrically identical.
run_klayout_gds_xor
________________________________________
Export the SPICE Netlist
Extract a transistor-level SPICE netlist from the completed layout for electrical verification.
run_magic_spice_export
________________________________________
Perform LVS Verification
Compare the extracted SPICE netlist with the synthesized Verilog netlist to verify logical and electrical equivalence.
run_lvs
________________________________________
Execute Design Rule Checking (DRC)
Verify that the completed layout satisfies all technology-specific design rules before fabrication.
run_magic_drc
________________________________________
Run Antenna Checks
Check the routed layout for antenna violations that may damage transistor gate oxides during fabrication.
run_antenna_check
________________________________________
Perform Circuit Validity Checks (CVC)
Analyze the design for electrical issues such as floating supplies, incorrect power connections, and other circuit integrity problems.
run_lef_cvc
________________________________________
Generate the Final Summary Report
Create a consolidated report containing the overall status of synthesis, timing, routing, DRC, LVS, antenna checks, and other verification results.
generate_final_summary_report
________________________________________

</details>

---
