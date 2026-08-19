# Physical Verification Workshop — SKY130 PDK

This repository presents a hands-on **Physical Verification (PV) workshop** based on the open-source **SKY130 Process Design Kit (PDK)**. It provides practical exposure to industry-standard verification methodologies and workflows required to validate an IC layout prior to fabrication and tapeout.

The workshop progresses through multiple learning modules covering **Design Rule Checking (DRC), Layout Versus Schematic (LVS), parasitic extraction, hierarchy management, GDSII generation, density verification, antenna analysis, Electrical Rule Checking (ERC), and tapeout sign-off concepts**.

The training combines fundamental concepts with practical implementation using **Magic VLSI, Netgen, OpenLane, and the SKY130 PDK**. Each module includes verification procedures, command references, debugging methodologies, screenshots, and detailed analysis of verification reports. The repository demonstrates how physical design data is systematically validated for **manufacturability, electrical connectivity, design-rule compliance, and overall tapeout readiness**.

Key areas covered include:

* **DRC:** Verification of layout geometries against foundry-defined design rules.
* **LVS:** Verification of layout-versus-schematic connectivity and device correspondence.
* **Parasitic Extraction:** Extraction and analysis of parasitic resistance and capacitance for post-layout characterization.
* **Hierarchy Management:** Understanding and validating hierarchical layout structures and extracted netlists.
* **CIF/GDSII Generation:** Preparation and verification of industry-standard layout exchange formats.
* **Density and Fill Verification:** Analysis of metal density and fill requirements, including CMP-aware design considerations.
* **Antenna Checks:** Identification and mitigation of plasma-induced antenna violations.
* **ERC:** Detection of electrical connectivity and reliability issues beyond geometric DRC.
* **Tapeout Sign-Off:** Understanding the sequence of physical verification checks required before manufacturing release.

Overall, the repository provides practical experience with **open-source physical verification flows and SKY130-based IC design**, bridging theoretical knowledge with real-world implementation. It is intended to build foundational skills relevant to careers in **Physical Verification, Design Enablement, PDK Development, Custom Layout, and Semiconductor Physical Design**.



<img width="1536" height="1024" alt="ChatGPT Image Jul 2, 2026, 05_50_54 PM" src="https://github.com/user-attachments/assets/a0acdbdd-cd1a-491f-ab72-56ea50cc1e8d" />


 
## 🛠️ Tools Used
 
 
| Category | Tool | Purpose |
|----------|------|----------|
| PDK | SKY130A | Open-source Process Design Kit |
| Layout Editor | Magic VLSI | Layout creation, DRC and extraction |
| LVS Tool | Netgen | Layout Versus Schematic verification |
| Physical Design | OpenLane | RTL-to-GDSII automated flow |
| Simulator | NGSPICE | Circuit simulation and analysis |
| Operating System | Ubuntu Linux | Development environment |
| Version Control | Git & GitHub | Source control and documentation |
---

# [Day 1 – Introduction to SKY130 and Open-Source Tools](https://github.com/pavankumarka/physical_verification_workshop_by_vsd/tree/main/Day1)

# [Day 2 - DRC and LVS Theory and labs](https://github.com/pavankumarka/physical_verification_workshop_by_vsd/tree/main/Day2)

# [Day 3 - Front-End and Back-End Verification Concepts](https://github.com/pavankumarka/physical_verification_workshop_by_vsd/tree/main/Day3)

# [Day 4 - OpenLane and Physical Verification Flow - Additional Content](https://github.com/pavankumarka/physical_verification_workshop_by_vsd/tree/main/Day4)

# [Day 5 - Running LVS and Debugging](https://github.com/pavankumarka/physical_verification_workshop_by_vsd/tree/main/Day5)
