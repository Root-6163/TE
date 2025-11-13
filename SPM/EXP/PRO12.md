Perfect ✅ — you’re doing the **SPM Experiment No. 12** —
**“Create a Project Dashboard for Online Clothes Delivery Management System”** with **Project Summary, Allocated Resources, Project Completion Cost and Budget, Allotted Tasks, and CPM (Critical Path Method)**.

Below I’ll give you a **complete, exam-ready explanation + full dataset** to directly use in **EdrawMax**, along with **step-by-step EdrawMax instructions**, **CPM (calculated)**, and **viva preparation**.
This is structured exactly like your earlier ones (Experiments 10 & 11).

---

## 🧾 1. **Project Summary (for dashboard header)**

**Project:** Online Clothes Delivery Management System
**Objective:**
Develop a platform that allows customers to browse, purchase, and get doorstep delivery of clothes. The system includes inventory management, online payment, order tracking, vendor management, and customer feedback.

**Duration:** 10 weeks
**Budget (BAC):** ₹10,00,000
**Current Progress:** 70% complete
**Actual Cost so far (AC):** ₹6,80,000
**Planned Value (PV):** ₹6,00,000
**Earned Value (EV):** 70% × 10,00,000 = ₹7,00,000
**CPI = EV/AC = 1.03 (on cost)**
**SPI = EV/PV = 1.16 (ahead of schedule)**

---

## 🧩 2. **Tasks, Duration, Cost, and Dependencies**

| ID | Task                           | Duration (Weeks) | Predecessors | Planned Cost (₹) |
| -- | ------------------------------ | ---------------: | -----------: | ---------------: |
| T1 | Requirement Gathering          |                1 |            - |           50,000 |
| T2 | UI/UX Design                   |                1 |           T1 |           80,000 |
| T3 | Database Design                |                1 |           T1 |           70,000 |
| T4 | Backend Development            |                3 |           T3 |          200,000 |
| T5 | Frontend Development           |                3 |           T2 |          180,000 |
| T6 | API & Payment Integration      |                2 |       T4, T5 |          150,000 |
| T7 | Testing & QA                   |                2 |           T6 |          120,000 |
| T8 | Deployment & Maintenance Setup |                1 |           T7 |           50,000 |
| T9 | Marketing & Launch             |                1 |           T8 |          100,000 |

**Total Budget (BAC)** = ₹10,00,000
**Planned Duration** = *calculated via CPM below*

---

## ⚙️ 3. **Resource Allocation (for pie chart / table)**

| Role                | Count | Cost per person (₹/month) |  Monthly Cost (₹) |
| ------------------- | ----: | ------------------------: | ----------------: |
| Project Manager     |     1 |                    80,000 |            80,000 |
| Backend Developer   |     2 |                    60,000 |           120,000 |
| Frontend Developer  |     2 |                    55,000 |           110,000 |
| UI/UX Designer      |     1 |                    40,000 |            40,000 |
| QA Engineer         |     1 |                    35,000 |            35,000 |
| DevOps Engineer     |     1 |                    50,000 |            50,000 |
| Marketing Officer   |     1 |                    45,000 |            45,000 |
| **Total (Approx.)** |     9 |                         — | **480,000/month** |

📊 **In EdrawMax Pie Chart:**
Backend (25%), Frontend (23%), QA (10%), UI/UX (8%), Marketing (9%), DevOps (10%), PM (15%)

---

## 🧮 4. **CPM Calculation (Critical Path Method)**

### Tasks (based on dependencies):

T1 → T2 → T5 → T6 → T7 → T8 → T9
T1 → T3 → T4 → T6 → T7 → T8 → T9

Let’s calculate ES, EF, LS, LF, Slack:

| ID | Dur |   Pred | ES | EF | LS | LF | Slack | Critical |
| -- | --: | -----: | -: | -: | -: | -: | ----: | :------: |
| T1 |   1 |      - |  0 |  1 |  0 |  1 |     0 |     ✅    |
| T2 |   1 |     T1 |  1 |  2 |  1 |  2 |     0 |     ✅    |
| T3 |   1 |     T1 |  1 |  2 |  1 |  2 |     0 |     ✅    |
| T4 |   3 |     T3 |  2 |  5 |  2 |  5 |     0 |     ✅    |
| T5 |   3 |     T2 |  2 |  5 |  2 |  5 |     0 |     ✅    |
| T6 |   2 | T4, T5 |  5 |  7 |  5 |  7 |     0 |     ✅    |
| T7 |   2 |     T6 |  7 |  9 |  7 |  9 |     0 |     ✅    |
| T8 |   1 |     T7 |  9 | 10 |  9 | 10 |     0 |     ✅    |
| T9 |   1 |     T8 | 10 | 11 | 10 | 11 |     0 |     ✅    |

**Total Duration:** 11 weeks
**Critical Path:** T1 → T3 → T4 → T6 → T7 → T8 → T9
*(T2-T5 path also critical since both merge at T6 with equal duration)*

---

## 💰 5. **Dashboard Data Summary (for EdrawMax widgets)**

| KPI            |                 Value | Remark                             |
| -------------- | --------------------: | ---------------------------------- |
| BAC            |            ₹10,00,000 | Total project budget               |
| PV             |             ₹6,00,000 | Planned progress till week 8       |
| EV             |             ₹7,00,000 | Value of work done                 |
| AC             |             ₹6,80,000 | Actual cost spent                  |
| CPI            |                  1.03 | Good — cost efficiency             |
| SPI            |                  1.16 | Ahead of schedule                  |
| % Completed    |                   70% |                                    |
| Remaining Cost |             ₹3,20,000 |                                    |
| Predicted EAC  | BAC / CPI = ₹9,70,873 | Estimated total cost at completion |

---

## 🧠 6. **Steps to Create in EdrawMax**

### 🟦 Step 1: Create Dashboard Layout

* **Template:** Go to **New → Project Management → Dashboard / Project Overview**.
* Use **3 main panels**:

  * **Top:** Project summary (text)
  * **Left:** Resource Pie Chart
  * **Center:** CPM Network
  * **Right:** Budget Bar Chart
  * **Bottom:** Table (task schedule and metrics)

---

### 📈 Step 2: Create CPM Network

1. Use **PERT Chart or Flowchart** template.
2. Draw each node (T1–T9) with:

   ```
   T4: Backend Development
   Duration: 3 weeks
   ES: 2 EF: 5 LS: 2 LF: 5
   Slack: 0
   ```
3. Connect arrows:

   * T1→T2→T5→T6→T7→T8→T9
   * T1→T3→T4→T6→T7→T8→T9
4. Highlight critical path in **red** or **bold arrows**.

---

### 🥧 Step 3: Resource Pie Chart

* Insert → **Chart → Pie Chart**
* Enter roles and percentages:

  ```
  Backend 25
  Frontend 23
  QA 10
  UI/UX 8
  Marketing 9
  DevOps 10
  PM 15
  ```

---

### 📊 Step 4: Budget vs Actual Bar Chart

* Insert → **Chart → Column Chart**
* X-axis = Phases (Design, Dev, Integration, Testing, Deployment)
* Y-axis = Cost (₹)
* Planned = [50k, 250k, 150k, 120k, 100k]
* Actual = [55k, 240k, 160k, 125k, 90k]

---

### 📋 Step 5: Add KPI Tiles (Text boxes)

Create rectangular shapes for:

```
EV = ₹7,00,000
PV = ₹6,00,000
AC = ₹6,80,000
CPI = 1.03
SPI = 1.16
Status: On Track ✅
```

Give each tile a color:

* EV → Blue
* PV → Orange
* AC → Green
* CPI → Red
* SPI → Yellow

---

## 🎤 7. **Viva Questions (Exam tips)**

| Question                 | Short Answer                                                                                                   |
| ------------------------ | -------------------------------------------------------------------------------------------------------------- |
| What is CPM?             | A project scheduling method to identify the longest path (critical path) determining minimum project duration. |
| What are EV, PV, and AC? | EV = Earned Value (value of work done), PV = Planned Value, AC = Actual Cost.                                  |
| What is CPI and SPI?     | CPI = EV/AC (cost performance), SPI = EV/PV (schedule performance).                                            |
| What if CPI < 1?         | The project is over budget.                                                                                    |
| What if SPI < 1?         | The project is behind schedule.                                                                                |
| How is dashboard useful? | It visually tracks cost, schedule, and progress to support decisions.                                          |

---

## ✅ **Summary of CPM Path**

🟥 **Critical Path:**
**T1 → T3 → T4 → T6 → T7 → T8 → T9**
🕓 **Total Duration:** 11 weeks
💸 **BAC:** ₹10,00,000
📊 **CPI = 1.03**, **SPI = 1.16** → Project is *slightly ahead of schedule and under budget.*

---

Would you like me to now make a **visual layout plan (with block placements)** for how the dashboard should look in EdrawMax (like a wireframe you can follow)?
It will help you recreate it quickly in your practical exam tomorrow.

