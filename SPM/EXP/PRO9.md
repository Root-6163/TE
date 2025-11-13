Nice — I created the **EVA line chart** for the hydroelectric power plant example and plotted both interpretations of Earned Value (EV):

* **PV (Planned Value)** after 1 year = ₹10,000,000 (planned to complete Phase 1)
* **EV (reported)** = ₹8,000,000 (the team reports work worth ₹8M completed)
* **EV (derived from 90% of Phase 1)** = ₹9,000,000 (90% × ₹10M) — included to show the discrepancy
* **BAC (Budget at Completion)** = ₹15,000,000

You can download or view the generated chart image in the UI (it was displayed in the notebook).

---

## How to explain this in your practical/viva

1. **State the facts clearly**

   * “The project has two phases. Phase 1 is worth ₹10,000,000 and Phase 2 is worth ₹5,000,000, so BAC = ₹15,000,000.”
   * “One year passed (first phase scheduled to be completed). PV = ₹10,000,000.”
   * “Team reports EV = ₹8,000,000, but 90% of Phase 1 would imply EV = ₹9,000,000 — this inconsistency must be clarified.”

2. **Compute SPI (Schedule Performance Index)**

   * Using reported EV: `SPI = EV / PV = 8,000,000 / 10,000,000 = 0.8` → **Behind schedule**
   * Using EV from 90%: `SPI = 9,000,000 / 10,000,000 = 0.9` → still behind schedule

3. **(Optional) Compute CPI if AC is given**

   * You’ll need **AC (Actual Cost)** to compute `CPI = EV / AC`. Ask examiner if AC is available; if not, present scenarios or assume a reasonable AC.

4. **Explain discrepancy**

   * Possible causes: measurement error, incomplete reporting, or rework. Recommend auditing earned-work reports (deliverable acceptance criteria).

5. **Use the chart**

   * Point to the PV → EV gap to show schedule variance.
   * Point to EV vs BAC to show remaining work.

---

## Deliverables you can present in lab

* The line chart (as shown) — insert into EdrawMax or a Word doc.
* A short table with PV, EV (both reported and derived), BAC, SPI calculations.
* A one-line recommendation: **verify EV reporting and re-evaluate AC to compute CPI and forecast EAC.**

---

Want me to:

* Export the plotted chart as an image file you can import into EdrawMax, **or**
* Produce a concise one-page lab note (Word/PDF) with the chart, calculations, and short recommendations for submission?

Got it — you want a clear, exam-ready **explanation and write-up** for the **hydroelectric power plant** EVA example (no charts). I’ll give you everything you need: precise calculations, possible examiner questions and answers, things to watch for (the EV discrepancy), what you should say in the lab, and how to handle follow-ups. Ready? Here we go.

---

# Problem restatement (short)

A hydroelectric power plant project has **2 phases**, each lasting **1 year**.

* **Phase 1 value** = ₹10,000,000
* **Phase 2 value** = ₹5,000,000
  So **BAC = ₹15,000,000**.
  At the current state, **1 year has passed** (phase 1 was scheduled to be done). The team reports:
* **Work completed worth** = **EV_reported = ₹8,000,000**.
  Also we are told **90% of phase 1** would be = **0.9 × ₹10,000,000 = ₹9,000,000** (this is a derived EV if you accept the percent).

You must analyze Earned Value (PV, EV, AC, SPI, CPI, EAC, VAC) and explain.

> **Important:** AC (Actual Cost) is NOT given in the statement — so CPI and EAC that require AC cannot be computed unless AC is provided or assumed. I’ll show both: calculations you *can* do and how to proceed if AC is available or not.

---

## Step-by-step EVA (what we can compute)

### 1. Compute BAC

BAC = Phase1 + Phase2 = ₹10,000,000 + ₹5,000,000 = **₹15,000,000**.

### 2. Planned Value (PV)

After 1 year (out of 2), the planned work was to finish Phase 1. So:

* PV = value scheduled = **Phase1 = ₹10,000,000**.

### 3. Earned Value (EV)

Two possible EV numbers appear in the problem:

* **EV (reported by team)** = **₹8,000,000** (given).
* **EV (derived from %complete)** = 90% of Phase1 = **0.9 × ₹10,000,000 = ₹9,000,000**.

**Note:** These two disagree. You must mention the discrepancy in your answer and say you will present both calculations (and recommend clarifying which EV is correct — acceptance criteria may cause the difference).

### 4. Actual Cost (AC)

* **AC is not given.** You should explicitly say CPI and EAC cannot be calculated without AC, unless an AC is assumed or provided.

---

## Step: Schedule Performance Index (SPI)

SPI = EV / PV

Compute SPI using both EV interpretations:

* Using **EV_reported = ₹8,000,000**:
  [
  SPI = 8{,}000{,}000 \div 10{,}000{,}000 = 0.8
  ]
  **SPI = 0.8 → project behind schedule (only 80% of planned value achieved).**

* Using **EV_derived = ₹9,000,000**:
  [
  SPI = 9{,}000{,}000 \div 10{,}000{,}000 = 0.9
  ]
  **SPI = 0.9 → still behind schedule but better than 0.8.**

**How to report:** Show both results, explicitly state the EV source, and recommend verifying the EV measurement (deliverable acceptance).

---

## Step: Cost Performance Index (CPI)

CPI = EV / AC

* **Cannot compute CPI** because AC is not provided.
* If the examiner asks, say: “AC is required to compute CPI. If AC were provided I would compute CPI = EV / AC and interpret >1 as under budget, <1 as over budget.”
* If you want to present an example, you may assume an AC and show how to compute — but label it an assumption.

---

## Estimating EAC and VAC

There are several EAC formulas. The common ones:

1. **If future performance = current CPI (cost performance dominates):**
   [
   EAC = BAC / CPI
   ]
   (needs CPI → needs AC)

2. **If both cost & schedule affect future performance (CPI × SPI):**
   [
   EAC = BAC / (CPI \times SPI)
   ]
   (needs CPI and SPI)

3. **If work remaining will be at planned rate:**
   [
   EAC = AC + (BAC - EV)
   ]
   (needs AC)

Because AC is missing, you **cannot** compute a reliable EAC or VAC without assuming AC. State that clearly. If asked to assume AC, do so and show numeric example — but emphasize it's an assumption.

---

## What to say in the lab/report (concise, examiner-ready)

**1. State given facts**

> “BAC = ₹15,000,000 (Phase1 = ₹10M, Phase2 = ₹5M). One year passed; PV = ₹10,000,000. Team reports EV = ₹8,000,000, but 90% of phase1 would imply EV = ₹9,000,000 — this inconsistency must be clarified. AC is not provided.”

**2. Show computed SPI (both ways)**

> “Using EV=8M, SPI = 0.8 (behind schedule). Using EV=9M, SPI = 0.9 (still behind schedule).”

**3. State limits for CPI/EAC/VAC**

> “CPI and EAC cannot be computed without AC. If AC is later provided we can compute CPI = EV/AC and EAC using one of the standard formulas.”

**4. Recommendation**

> “Recommend auditor verification of EV measurement (are deliverables accepted?). Also request actual cost (AC) to calculate CPI and to forecast EAC/VAC.”

**5. Short conclusion**

> “Project appears to be behind schedule (SPI < 1). Cost performance is unknown (AC missing). Further data required to forecast final cost.”

---

## Possible examiner questions & short answers (viva prep)

**Q1:** Why are there two different EVs (8M vs 9M)?
**A:** EV can be measured in different ways — either actual accepted deliverables (team reported 8M) or percent complete times budget (90% × 10M = 9M). The difference suggests inconsistency in measurement or acceptance criteria; ask for clarification and prefer accepted deliverables.

**Q2:** How do we compute CPI?
**A:** CPI = EV / AC. We need AC (actuals). Without AC we cannot compute CPI or EAC.

**Q3:** If AC = ₹9,000,000, what is CPI and EAC? (example examiner may ask to assume)
**A (example):** If AC = ₹9,000,000 and using EV = ₹8,000,000 → CPI = 8,000,000 / 9,000,000 = 0.8889. If we take EAC = BAC / (CPI × SPI) and plug in CPI and SPI (use the chosen EV for SPI), we can compute EAC numerically. (Show arithmetic if asked.)

**Q4:** Which SPI/CPI should we trust?
**A:** Trust EV based on accepted deliverables; always clarify measurement baseline (what percent complete means and whether work is accepted).

**Q5:** How to fix low SPI?
**A:** Reallocate resources to critical path, fast-track non-dependent tasks, remove bottlenecks, increase monitoring.

---

## If you must provide a final numeric answer in the practical (recommended approach)

1. Present both EV options (8M reported, 9M derived).
2. Compute SPI for both (0.8 and 0.9).
3. State **CPI/EAC/VAC cannot be computed** without AC; ask examiner whether you should assume AC (and if they permit, pick a reasonable number and compute the rest while labeling it as an assumption).

**Example assumed AC workflow** (only do this if examiner asks you to assume AC):

* Suppose AC = ₹8,500,000.
* Using EV_reported = 8,000,000: CPI = 8,000,000 / 8,500,000 = 0.9412.
* SPI = 0.8 (as earlier).
* EAC = BAC / (CPI × SPI) = 15,000,000 / (0.9412 × 0.8) ≈ 19,888,000.
* VAC = BAC − EAC ≈ −4,888,000 (overrun).
  But repeat: **this used assumed AC**.

---

## How to present this in your lab journal / answer sheet (suggested layout)

**Title:** EVA Analysis — Hydroelectric Power Plant (after 1 year)

**Given:** Phase1 = ₹10,000,000; Phase2 = ₹5,000,000; BAC = ₹15,000,000; PV (after 1 year) = ₹10,000,000; EV (reported) = ₹8,000,000; EV (90% of phase1) = ₹9,000,000; AC = Not provided.

**Calculations:**

* PV = ₹10,000,000
* EV (reported) = ₹8,000,000 → SPI = 0.8
* EV (derived) = ₹9,000,000 → SPI = 0.9

**CPI:** Cannot compute (AC missing).
**EAC / VAC:** Cannot compute without AC. (Show hypothetical calculation if examiner asks to assume AC.)

**Conclusion:** Project is behind schedule (SPI < 1). Cost performance cannot be judged without AC. Recommend verifying EV reporting and asking for AC to compute CPI and forecast EAC/VAC.

**Recommendations / Action Items:**

1. Verify the basis for EV (accepted deliverables vs percent complete).
2. Provide AC (actual costs) so CPI & EAC/VAC can be computed.
3. If SPI remains < 1, consider corrective actions like resource reallocation or schedule compression.

**Viva Notes:** Be ready to explain definitions of PV, EV, AC, CPI, SPI, EAC, VAC and the limitation due to missing AC.

---

If you want, I can now:

* produce a **one-page answer** (Word/PDF) containing the above write-up (ready to print), or
* prepare the **short numerical table** you can copy into your journal, or
* take a plausible AC and produce full numeric CPI/EAC/VAC as an example (clearly labeled “assumed AC = …”).

Which of those would you like next?

Perfect 👍 — let’s focus now on **how to make the Earned Value Analysis (EVA) chart for the Hydroelectric Power Plant** *in EdrawMax*, step by step.

You already have the calculations — now I’ll show exactly **how to visualize** them inside EdrawMax so it looks correct for your practical submission.

---

## 🎯 GOAL

You need to make a **Line Chart (EVA)** that shows:

* Planned Value (PV)
* Earned Value (EV)
* Actual Cost (AC – optional if not given, you can assume)
  over **time (months or years)** for the **Hydroelectric Power Plant Project**.

---

## 🧾 Step-by-Step Guide to Draw in **EdrawMax**

### **Step 1: Open EdrawMax**

1. Launch **EdrawMax**.
2. Go to the top menu → click **[New] → [Graphs & Charts] → [Line Chart]**.
3. Choose a simple **“Line Chart”** template and insert it on the canvas.

---

### **Step 2: Prepare your sample data**

Use the hydroelectric project data:

| Time (Year) | PV (₹)     | EV (₹)    | AC (₹ assumed) |
| ----------- | ---------- | --------- | -------------- |
| 0           | 0          | 0         | 0              |
| 0.5         | 5,000,000  | 4,000,000 | 4,500,000      |
| 1.0         | 10,000,000 | 8,000,000 | 8,500,000      |
| 1.5         | 12,500,000 | 8,000,000 | 9,500,000      |
| 2.0         | 15,000,000 | 9,000,000 | 10,000,000     |

👉 You can use “Year 0”, “Year 0.5”, “Year 1.0”, etc., to represent time.

*(If you don’t want to assume AC, you can just plot PV and EV.)*

---

### **Step 3: Enter the data in EdrawMax**

1. Double-click the chart → a small **“Data Table”** appears.
2. In the table:

   * Column A = “Time (Year)”
   * Column B = “PV”
   * Column C = “EV”
   * Column D = “AC” (if you’re including it)
3. Enter the numbers from the table above.

---

### **Step 4: Format the chart**

1. Right-click → **Chart Properties** or **Data Series**.
2. Choose **different colors**:

   * PV = Blue (Planned)
   * EV = Green (Earned)
   * AC = Red (Actual)
3. Add **Data Labels** → click the chart → “Add Data Labels”.
4. Add chart title:
   **“EVA Analysis – Hydroelectric Power Plant Project”**
5. Add axis titles:

   * **X-Axis:** “Time (Years)”
   * **Y-Axis:** “Value (₹ in Millions)”

---

### **Step 5: Optional – Add a text box**

Add a small note box (Insert → Text Box) with:

> **Interpretation:**
>
> * PV = 10M after 1 year (planned progress)
> * EV = 8M (actual progress → behind schedule)
> * SPI = 0.8 → Project behind schedule
> * CPI = 0.94 (if AC assumed) → Slightly over budget

This adds a professional touch for your examiner.

---

### **Step 6: Save or Export**

* Save the file as `.eddx` (native EdrawMax format)
* Then **Export → Image (PNG)** or **PDF** for printing in your journal

---

## 🧠 Tips for Viva or Practical

Examiner may ask:

| Question                        | Best Short Answer                                                       |
| ------------------------------- | ----------------------------------------------------------------------- |
| What do these three lines show? | PV = planned progress, EV = actual earned work, AC = actual cost spent. |
| What does it mean if EV < PV?   | Project is **behind schedule**.                                         |
| What if EV < AC?                | **Over budget** — cost performance is poor.                             |
| How can we improve SPI?         | Add resources or fast-track critical tasks.                             |

---

Would you like me to give you a **sample data table and look** for how the chart should appear in EdrawMax (e.g., values at each point and description of line trend)?
That way, when you enter it, you can match the chart exactly.
:wq

