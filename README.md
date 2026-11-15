# HDLBits — Complete Solutions

Clean, well-documented Verilog solutions to the [HDLBits](https://hdlbits.01xz.net/) problem set.

Every solution is a **self-contained `.v` file** that includes the **full problem statement**, the **module declaration**, and a **verified solution** — so each file can be read and understood on its own, without opening the HDLBits website.

> Maintained by **Karankumar Nevage** · *Fluxray Electronics*

---

## Why this repo

HDLBits is one of the best ways to learn digital design and Verilog. This repository re-organizes the solutions so they are **easy to navigate, easy to read, and easy to learn from**:

- **One file per problem** — no giant combined files.
- **The question lives with the answer** — the full problem statement is written in the file header, so you never lose context.
- **Consistent, predictable layout** — the same header format and folder convention everywhere.
- **One commit per solution** — clean, reviewable git history.

---

## Repository structure

Problems are grouped by HDLBits chapter. Each chapter (a "set") is a folder, and every problem inside it is named `question_NN.v`.

```
HDLBits-Complete-Solution/
├── 1_getting_started/
│   ├── question_01.v
│   └── question_02.v
├── 2_verilog_language/
│   ├── 1_basics/              question_01.v … question_08.v
│   ├── 2_vector/              question_01.v … question_09.v
│   ├── 3_modules/             question_01.v … question_09.v
│   ├── 4_procedures/          question_01.v … question_08.v
│   └── 5_more_verilog_features/ question_01.v … question_07.v
└── 3_circuits/
    └── 1_combinational_logic/
        ├── 1_basic_gates/            question_01.v … question_17.v
        ├── 2_multiplexers/           question_01.v … question_05.v
        ├── 3_arithmetic_circuits/    question_01.v … question_07.v
        └── 4_karnaugh_map_to_circuit/ question_01.v … question_08.v
```

---

## Progress

| # | Set | Folder | Solutions |
|---|-----|--------|:---------:|
| 1 | Getting Started | `1_getting_started/` | 2 |
| 2 | Verilog Language → Basics | `2_verilog_language/1_basics/` | 8 |
| 3 | Verilog Language → Vectors | `2_verilog_language/2_vector/` | 9 |
| 4 | Verilog Language → Modules: Hierarchy | `2_verilog_language/3_modules/` | 9 |
| 5 | Verilog Language → Procedures | `2_verilog_language/4_procedures/` | 8 |
| 6 | Verilog Language → More Verilog Features | `2_verilog_language/5_more_verilog_features/` | 7 |
| 7 | Circuits → Combinational Logic → Basic Gates | `3_circuits/1_combinational_logic/1_basic_gates/` | 17 |
| 8 | Circuits → Combinational Logic → Multiplexers | `3_circuits/1_combinational_logic/2_multiplexers/` | 5 |
| 9 | Circuits → Combinational Logic → Arithmetic Circuits | `3_circuits/1_combinational_logic/3_arithmetic_circuits/` | 7 |
| 10 | Circuits → Combinational Logic → Karnaugh Map to Circuit | `3_circuits/1_combinational_logic/4_karnaugh_map_to_circuit/` | 8 |
| | | **Total** | **80** |

*Circuits → Combinational Logic is complete. More chapters (Sequential Logic, Verification, etc.) will be added over time.*

---

## File format

Every `.v` file follows the same template:

```verilog
/*==========================================================================================
 * HDLBits Problem : <problem name>
 * Category        : <chapter -> section>
 * Link            : <official HDLBits URL>
 * Author          : Karankumar Nevage (Fluxray Electronics)
 ==========================================================================================
 * Problem Statement:
 *   <the full problem description, in plain words>
 *------------------------------------------------------------------------------------------
 * Module Declaration:
 *   module top_module ( ... );
 */
//==========================================================================================
module top_module ( ... );

    // solution

endmodule
//==========================================================================================
```

- The header holds everything you need to understand the task.
- The `//====` rails mark where the actual synthesizable code begins and ends.

---

## How to use

1. **Browse by chapter** — open the folder for the topic you're studying.
2. **Read the header first** — understand the problem before looking at the code.
3. **Try it yourself** — attempt the problem on [HDLBits](https://hdlbits.01xz.net/) using the link in the header.
4. **Compare** — check your answer against the solution.

You can simulate any solution with standard Verilog tools, for example:

```bash
# Using Icarus Verilog (iverilog)
iverilog -o sim 2_verilog_language/1_basics/question_05.v
vvp sim
```

> Note: some HDLBits problems reference helper modules (e.g. `add16`, `my_dff`) that are
> provided by the HDLBits grader. Those files instantiate such modules but do not redefine
> them, matching the HDLBits environment.

---

## Disclaimer

These are personal learning solutions, shared to help others study digital design. HDLBits
problem statements are the property of their author (Henry Wong / University of Toronto).
Use this repository to **learn** — try each problem yourself first.

---

## Author

**Karankumar Nevage** — *Fluxray Electronics*

If this repository helped you, consider giving it a ⭐ on GitHub.
