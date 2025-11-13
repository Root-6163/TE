Excellent 👍 — you’re referring to your **SPOS (System Programming & Operating System) Practical**
**Experiment: “Pass 1 of Two Pass Assembler”** using Java.

Let’s break this **entire question + code + output + viva concepts** in a way that you can **explain clearly to your examiner**, and also handle **expected viva questions** confidently.

---

## 🔹 **Aim of the Experiment**

> **To implement Pass 1 of a Two-Pass Assembler using Java.**

---

## 🔹 **Theory / Concept Behind the Experiment**

An **Assembler** is a program that converts **assembly language** into **machine code**.

A **two-pass assembler** processes the source program in two passes:

* **Pass 1:**

  * Scans the source code.
  * Assigns **addresses** to all statements.
  * Builds tables such as **Symbol Table, Literal Table, Pool Table, and Opcode Table**.
  * It does **not** generate the final machine code.

* **Pass 2:**

  * Uses the tables built in Pass 1 to generate **machine code**.

👉 You are implementing **Pass 1** only.

---

## 🔹 **Main Objective of Pass 1**

1. **Assign Location Counters (LC)** to each instruction.
2. **Generate**:

   * **Symbol Table** (labels + addresses)
   * **Literal Table** (constants + addresses)
   * **Opcode Table** (mnemonics + class)
   * **Pool Table** (group of literals)
3. Identify **Assembler Directives** (START, END, LTORG, ORIGIN, EQU, etc.)
4. Prepare data for **Pass 2**.

---

## 🔹 **Input File Example (input.txt)**

```
START 100
READ A
LABEL MOVER
LTORG
='5'
='1'
='6'
='7'
MOVEM
LTORG
A,B
A,B
='2'
LOOP READ B
A DS 1
B DC '1'
='1'
END
```

This file contains:

* **Assembler directives** (START, END, LTORG)
* **Instructions** (MOVEM, READ)
* **Literals** (='5', ='1', etc.)
* **Labels** (LOOP, LABEL)
* **Declarations** (DS, DC)

---

## 🔹 **Step-by-Step Explanation of the Java Code**

Let’s go through the program logically 👇

---

### 🧩 Step 1: Import and Initialize

```java
import java.io.*;

public class Pass1 {
    public static void main(String[] args) throws Exception {
        BufferedReader bufferedReader = new BufferedReader(
            new FileReader("/home/sweetrat/spos/1/input.txt")
        );
```

✅ Reads the **assembly program** line-by-line from a file.

---

### 🧩 Step 2: Declare Tables

```java
final int MAX = 100;
String[][] SymbolTab = new String[MAX][3];
String[][] OpTab = new String[MAX][3];
String[][] LitTab = new String[MAX][2];
int[] PoolTab = new int[MAX];
```

✅ Declares the **four major tables**:

* `SymbolTab` → Symbol, Address, Length
* `OpTab` → Mnemonic, Class, Info
* `LitTab` → Literal, Address
* `PoolTab` → Points to literals group (used with LTORG)

---

### 🧩 Step 3: Initialize Counters

```java
int LC = 0, line_count = 0;
int symTabLine = 0, opTabLine = 0, litTabLine = 0, poolTabLine = 0;
```

✅ `LC` (Location Counter) keeps track of memory address for each instruction.

---

### 🧩 Step 4: Read Each Line

```java
while ((line = bufferedReader.readLine()) != null) {
    String[] tokens = line.trim().split("\\s+");
```

✅ Splits every line into tokens (mnemonic, operand, etc.)

---

### 🧩 Step 5: Handle START Statement

```java
if (line_count == 0) {
    LC = Integer.parseInt(tokens[1]);
    System.out.println(line);
}
```

✅ If it’s the first line (START 100),
sets `LC = 100` → starting address.

---

### 🧩 Step 6: Handle Labels

```java
if (!tokens[0].isEmpty() && !tokens[0].equalsIgnoreCase("START")) {
    SymbolTab[symTabLine++] = new String[]{tokens[0], Integer.toString(LC), "1"};
}
```

✅ Adds label (like LOOP or LABEL) to the **Symbol Table** with its current address (LC).

---

### 🧩 Step 7: Handle Literals

```java
for (String token : tokens) {
    if (token.startsWith("='")) {
        LitTab[litTabLine++] = new String[]{token, Integer.toString(LC)};
    }
}
```

✅ Whenever a literal (='5') appears, adds it to the **Literal Table**.

---

### 🧩 Step 8: Identify Opcode Type

```java
if ("START END ORIGIN EQU LTORG".contains(mnemonic.toUpperCase())) {
    OpTab[opTabLine++] = new String[]{mnemonic, "AD", "R11"};
} else if ("DS DC".contains(mnemonic.toUpperCase())) {
    OpTab[opTabLine++] = new String[]{mnemonic, "DL", "R7"};
} else {
    OpTab[opTabLine++] = new String[]{mnemonic, "IS", "(04,1)"};
}
```

✅

* AD → Assembler Directive
* DL → Declarative
* IS → Imperative Statement

Adds mnemonics to the **Opcode Table**.

---

### 🧩 Step 9: Increment LC

```java
LC++;
```

✅ Every instruction increases location counter.

---

### 🧩 Step 10: Display All Tables

After finishing reading:

```java
displayTable("SYMBOL TABLE", ...);
displayTable("OPCODE TABLE", ...);
displayTable("LITERAL TABLE", ...);
```

✅ Prints all tables neatly.

---

### 🧩 Step 11: Pool Table Generation

```java
for (int i = 0; i < litTabLine - 1; i++) {
    if (LitTab[i][0] != null &&
        (i == 0 || Integer.parseInt(LitTab[i][1]) < Integer.parseInt(LitTab[i + 1][1]) - 1)) {
        PoolTab[poolTabLine++] = i + 1;
    }
}
```

✅ Pool Table helps manage **groups of literals** separated by **LTORG**.
Example:
If LTORG appears twice, we have two literal pools.

---

## 🔹 **Final Output Explanation**

After running, you’ll get something like:

```
----- PASS 1 OUTPUT -----

SYMBOL TABLE
SYMBOL  ADDRESS LENGTH
LABEL   101     1
LOOP    110     1
A       111     1
B       112     1

OPCODE TABLE
MNEMONIC   CLASS  INFO
START      AD     R11
READ       IS     (04,1)
MOVER      IS     (04,1)
LTORG      AD     R11
DS         DL     R7
DC         DL     R7
END        AD     R11

LITERAL TABLE
LITERAL   ADDRESS
='5'      102
='1'      103
='6'      104
='7'      105
='2'      109
='1'      113

POOL TABLE
LITERAL NUMBER
1
5
------------------
```

---

## 🔹 **Viva Questions with Answers**

| **Q**                          | **A**                                                                                          |
| ------------------------------ | ---------------------------------------------------------------------------------------------- |
| What is the purpose of Pass 1? | To create symbol, literal, and opcode tables, and assign memory addresses to each instruction. |
| What is a symbol table?        | It stores labels with their addresses and lengths.                                             |
| What is a literal table?       | Stores constants used in the program and their assigned addresses.                             |
| What is a pool table?          | Keeps track of literal pools (groups of literals handled by LTORG).                            |
| What does LTORG do?            | It assigns addresses to all literals encountered so far.                                       |
| What is LC?                    | Location Counter, keeps the current memory address being processed.                            |
| Difference between AD, DL, IS? | AD → Assembler Directive, DL → Declarative, IS → Imperative Statement.                         |
| What is the output of Pass 1?  | Symbol Table, Literal Table, Opcode Table, Pool Table.                                         |
| What happens in Pass 2?        | Final machine code is generated using tables from Pass 1.                                      |

---

## 🔹 **Examiner “Trick” Questions**

* What if START is missing?
  → The program starts from LC = 0 by default.
* How do you handle EQU or ORIGIN directives?
  → By updating LC or assigning symbol addresses manually.
* What if the same symbol appears twice?
  → The assembler should give an error or overwrite depending on policy.
* Why do we need Pool Table?
  → To manage literals separately when multiple LTORGs exist.

---

## 🔹 **Summary**

| Part        | Description                                           |
| ----------- | ----------------------------------------------------- |
| **Input**   | Assembly code with labels, directives, literals       |
| **Process** | Scans, assigns LC, updates tables                     |
| **Output**  | Symbol Table, Literal Table, Pool Table, Opcode Table |
| **Pass**    | Pass 1 only (analysis, not machine code generation)   |

---

Would you like me to show you **how to manually draw a Pass 1 Table diagram (like for your journal)** in EdrawMax or Word (Symbol Table + Literal Table + Opcode Table + Pool Table) for your file?
It’s often required to show in printout or viva sheet.
