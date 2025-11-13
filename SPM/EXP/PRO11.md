Great — I’ll give you a ready-to-use, exam-ready **project dashboard** plan for an **Online Medicine Delivery Management System**, plus everything you need to **build the dashboard in EdrawMax** and a **complete CPM (node-by-node)** you can paste into EdrawMax quickly.

Below you’ll find:

1. Project summary (one-paragraph)
2. Assumed data (tasks, durations, dependencies, costs, resources) — copy/paste ready
3. Calculated metrics (PV/EV/AC/CPI/SPI/Completion %) — you can use these in dashboard widgets
4. CPM (full ES/EF/LS/LF/Slack, critical path) with exact numbers — node list for EdrawMax
5. Dashboard layout & step-by-step instructions for EdrawMax (charts, tables, colors)
6. Short viva prep: likely questions + short answers

Use this in your lab report and in EdrawMax — no extra thinking needed.

---

# 1) Project Summary (one-paragraph — paste into top of dashboard)

**Project:** Online Medicine Delivery Management System
**Objective:** Build a web + mobile system for ordering prescription medicines, pharmacy integration, payment, and delivery tracking. Features: user registration, prescription upload/verification, order management, pharmacy network, payment gateway, delivery tracking, and admin panel. Duration: **12 weeks**. Budget (BAC): **₹1,200,000**. Current status: **65% complete**, spent **₹780,000**. Critical path determines target delivery date; dashboard shows resource allocation and cost vs budget.

---

# 2) Assumed Data (copy/paste into EdrawMax data tables or Excel)

## Tasks, durations and dependencies

| ID | Task Name             | Duration (weeks) | Predecessor(s) | Planned Cost (₹) |
| -- | --------------------- | ---------------: | -------------: | ---------------: |
| T1 | Requirement Gathering |                1 |              - |           60,000 |
| T2 | UI/UX Design          |                2 |             T1 |          120,000 |
| T3 | Database Design       |                2 |             T1 |          150,000 |
| T4 | Backend Development   |                4 |             T3 |          300,000 |
| T5 | Frontend Development  |                4 |             T2 |          220,000 |
| T6 | Integration & API     |                2 |          T4,T5 |          100,000 |
| T7 | Testing & QA          |                2 |             T6 |           90,000 |
| T8 | Deployment & Handover |                1 |             T7 |           30,000 |

**Total planned cost (BAC)** = ₹1,200,000
**Total planned duration** = compute via CPM below (weeks)

## Resource allocation (monthly or by role)

| Role              | Count | Monthly cost per person (₹) | Monthly cost total (₹) |
| ----------------- | ----: | --------------------------: | ---------------------: |
| Project Manager   |     1 |                      80,000 |                 80,000 |
| Backend Dev       |     2 |                      60,000 |                120,000 |
| Frontend Dev      |     2 |                      55,000 |                110,000 |
| UI/UX Designer    |     1 |                      40,000 |                 40,000 |
| QA/Testers        |     1 |                      35,000 |                 35,000 |
| DBA               |     1 |                      45,000 |                 45,000 |
| DevOps            |     1 |                      50,000 |                 50,000 |
| **Monthly total** |     9 |                           — |  **480,000** (example) |

---

# 3) Current status (assumed snapshot to show on dashboard)

* Time passed: **8 weeks** (of project)
* Planned percent complete (PV% by week 8): compute via CPM timeline (we’ll use CPM results)
* **Actual completion:** 65% of total project work
* **Planned cost to date (PV):** ₹720,000 (assumed)
* **Earned value (EV):** 65% × BAC = 0.65 × 1,200,000 = **₹780,000**
* **Actual cost (AC):** ₹780,000 (assumed equal to EV for simplicity)
* **CPI = EV/AC = 1.00** (neutral)
* **SPI = EV/PV = 780,000/720,000 = 1.083** (slightly ahead)

> You can change numbers; keep consistency: EV = %complete × BAC, PV = planned % × BAC, AC = actual spending.

---

# 4) CPM — full calculation (ES/EF/LS/LF/Slack) & critical path

Use the task list above. I calculated ES/EF/LS/LF/Slack below (weeks). Insert these numbers as node text in EdrawMax.

### Build adjacency and perform forward/back passes (I did and provide results):

| ID | Dur (wks) |  Pred | ES | EF | LS | LF | Slack | Critical? |
| -- | --------: | ----: | -: | -: | -: | -: | ----: | :-------: |
| T1 |         1 |     - |  0 |  1 |  0 |  1 |     0 |    Yes    |
| T2 |         2 |    T1 |  1 |  3 |  1 |  3 |     0 |    Yes    |
| T3 |         2 |    T1 |  1 |  3 |  1 |  3 |     0 |    Yes    |
| T4 |         4 |    T3 |  3 |  7 |  3 |  7 |     0 |    Yes    |
| T5 |         4 |    T2 |  3 |  7 |  4 |  8 |     1 |     No    |
| T6 |         2 | T4,T5 |  7 |  9 |  7 |  9 |     0 |    Yes    |
| T7 |         2 |    T6 |  9 | 11 |  9 | 11 |     0 |    Yes    |
| T8 |         1 |    T7 | 11 | 12 | 11 | 12 |     0 |    Yes    |

* **Project duration = 12 weeks**
* **Critical path = T1 → T3 → T4 → T6 → T7 → T8** (sum durations = 1 + 2 + 4 + 2 + 2 + 1 = 12)
* Task T5 (frontend) has **1 week slack** — can delay up to 1 week without affecting project end date.

**How to place in EdrawMax:** create nodes with the fields:

```
T1
Req Gathering
Dur=1 wk
ES=0 EF=1 LS=0 LF=1 Slack=0
```

and so on for each task. Connect arrows based on predecessors.

---

# 5) Dashboard Layout (recommended page in EdrawMax)

Design the dashboard as a single A4 landscape or slide:

**Top Header:** Project name, one-line objective, status badge (On track / At risk / Delayed)

**Left column (vertical panels):**

* Project Summary (text box): BAC, duration, start date, projected end date, completion %
* Key metrics (small KPI tiles): EV, PV, AC, CPI, SPI, Remaining Budget

**Center (main visuals):**

* Gantt or CPM mini (use CPM network for critical path) — large visual
* Under CPM: critical path highlighted red

**Right column (charts):**

* Resource allocation pie chart (roles & %)
* Budget vs Actual bar chart (months)

**Bottom (tables):**

* Task list table (ID, Task, Dur, Pred, ES/EF/LS/LF/Slack, %complete)
* Resource assignment table (role → names → allocated tasks)

**Footer:** Notes & recommendations (e.g., “T5 has 1 wk slack — can reassign 1 frontend week to critical backend if delay occurs”)

---

# 6) Step-by-step in EdrawMax (fastest way tomorrow)

## To create the CPM network

1. In EdrawMax: **New → Business → Project Management → PERT Chart** (or flowchart)
2. Drag **Activity** nodes for each task (8 nodes).
3. For each node paste the text block (ID, Dur, ES/EF/LS/LF/Slack).
4. Connect arrows from predecessor → successor.
5. Select the nodes on the critical path → change border color to **red** and line thickness to make it stand out.
6. Add small labels near arrows for durations if you want.

## To create KPI tiles (EV/PV/AC/CPI/SPI)

1. Insert → Shapes → rectangle; create 5 small tiles.
2. Fill with background color; put bold number (e.g., **EV = ₹780,000**) and subtext (**65% complete**).
3. Add icons (Edraw has icon library) to look professional.

## To create Pie Chart (Resources)

1. Insert → Chart → Pie Chart → Edit Data → paste resource data
2. Enable labels with percentages and legend.

## To create Bar Chart (Budget vs Actual per month)

1. Insert → Chart → Column Chart; set columns = months (or milestones) and two series = Planned vs Actual.
2. Example monthly data (6 months): Planned: [200k,200k,200k,200k,200k,200k]; Actual: [190k,210k,200k,130k,...] — use your snapshot numbers.

## To create Task Table

1. Insert → Table → paste the task table from above (ID, Task, Dur, Pred, ES, EF, LS, LF, Slack, %complete).

## Final polish

* Add title at top, date, author (your name), footnote: “Assumed data — change values as required”.
* Export: File → Export → PDF or PNG for print.

---

# 7) Quick talking points for viva (copy-paste)

* “Critical path is T1–T3–T4–T6–T7–T8 with duration 12 weeks; any delay there delays project.”
* “CPI = EV/AC = 1.00 (neutral) — cost on track; SPI = EV/PV = 1.083 — slightly ahead of schedule.”
* “T5 (Frontend) has 1 week slack — we can borrow one frontend resource for backend if needed.”
* “Recommendation: focus monitoring on backend (T4) and integration (T6) as they are critical.”

---

# 8) Deliverables I can prepare instantly (choose one)

* A. An **EdrawMax .eddx template** pre-populated with all nodes, text and charts ready to open (I can prepare if you want — tell me “Make eddx”)
* B. A **printable one-page dashboard PDF** (with charts & CPM) that you can hand in.
* C. A **copy-paste Excel table** with Gantt/CPM data (so you can import into EdrawMax quickly).

Which one do you want me to make next? (A / B / C) — I’ll produce it exactly for your practical.

