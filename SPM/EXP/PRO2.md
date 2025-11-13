Perfect ✅ — since you’ll be using **EdrawMax** tomorrow for your **SPM (Software Project Management)** practical, let’s make sure you’re fully prepared to **explain the question**, **defend your work if asked**, and **create all diagrams quickly and correctly**.

---

## 🎯 Question Recap (SPM Q2)

> **Draw a pie chart and line chart for Online Food Delivery Management System.
> Compare the planned versus actual status of the project cost, budget, and resources allocated.
> Assume suitable data and make a CPM (Critical Path Method) for the same.**

---

## 🧠 Conceptual Understanding (what examiner may ask)

### 1. **What is SPM (Software Project Management)?**

> Software Project Management involves planning, scheduling, monitoring, and controlling software projects to ensure successful completion within time, cost, and quality constraints.

---

### 2. **What is a Pie Chart (in SPM)?**

> A **Pie Chart** represents the **distribution of total project cost or resources** among different tasks or modules of a project.
> It helps visualize which part of the project consumes more budget or effort.

🧩 **Example (for Online Food Delivery System)**

* UI Design – 20%
* Database – 25%
* Backend – 30%
* Testing – 15%
* Deployment – 10%

So, in EdrawMax, you’ll create a pie chart with **cost share per module**.

---

### 3. **What is a Line Chart (in SPM)?**

> A **Line Chart** shows the **trend over time**, typically comparing **Planned vs Actual progress or cost**.

🧩 **Example Data**

| Time (Week) | Planned Cost (₹) | Actual Cost (₹) |
| ----------- | ---------------- | --------------- |
| Week 1      | 8,000            | 9,000           |
| Week 2      | 15,000           | 17,000          |
| Week 3      | 25,000           | 27,000          |
| Week 4      | 35,000           | 38,000          |
| Week 5      | 50,000           | 53,000          |

Your **line chart** in EdrawMax will have:

* X-axis → Time (weeks)
* Y-axis → Cost (₹)
* Two lines → “Planned Cost” (blue) & “Actual Cost” (red)

---

### 4. **What is CPM (Critical Path Method)?**

> CPM is a **network-based scheduling technique** used to identify the **sequence of activities** that determine the **minimum project duration**.

🧩 **Key terms**:

* **Activity:** Task or job in the project.
* **Duration:** Time required to complete activity.
* **Critical Path:** Longest path in the network, determines total project time.
* **Float/Slack:** Extra time a non-critical activity can delay without affecting project completion.

🧩 **Example Activities for Online Food Delivery System**

| Task | Description           | Duration (days) | Depends On |
| ---- | --------------------- | --------------- | ---------- |
| T1   | Requirement Gathering | 2               | -          |
| T2   | UI/UX Design          | 3               | T1         |
| T3   | Database Design       | 4               | T1         |
| T4   | Backend Development   | 5               | T3         |
| T5   | Testing               | 3               | T2, T4     |
| T6   | Deployment            | 2               | T5         |

🧩 **Critical Path:**
T1 → T3 → T4 → T5 → T6
**Total Duration:** 16 days

You’ll draw this as a **network diagram** in EdrawMax using:

* Rounded rectangles for activities (T1–T6)
* Arrows for dependencies
* Highlight the critical path in red.

---

## 🧰 Steps to Create in **EdrawMax**

### **A. Pie Chart**

1. Go to **Insert → Chart → Pie Chart**
2. Right-click → **Edit Data**
3. Enter:

   * UI Design – 20
   * Database Design – 25
   * Backend – 30
   * Testing – 15
   * Deployment – 10
4. Adjust colors and add a title:
   *“Cost Distribution for Online Food Delivery Project”*

---

### **B. Line Chart**

1. Insert → **Chart → Line Chart**
2. Right-click → **Edit Data**
3. Enter:

   | Time   | Planned | Actual |
   | ------ | ------- | ------ |
   | Week 1 | 8000    | 9000   |
   | Week 2 | 15000   | 17000  |
   | Week 3 | 25000   | 27000  |
   | Week 4 | 35000   | 38000  |
   | Week 5 | 50000   | 53000  |
4. Label the X-axis = “Time (Weeks)”
   Label the Y-axis = “Cost (₹)”
   Add legend: “Planned” & “Actual”.

---

### **C. CPM (Network Diagram)**

1. Choose **Flowchart** or **Project Management → PERT Chart**.
2. Add boxes for each task (T1–T6).
3. Add connectors to show dependencies:

   ```
   T1 → T2 → T5 → T6
   T1 → T3 → T4 → T5 → T6
   ```
4. Color critical path red.
5. Add durations under each node.
6. Add title: *“Critical Path for Online Food Delivery Project”*.

---

## 🧩 Important Formulas (Exam Tips)

| Metric                               | Formula                      | Meaning                                      |
| ------------------------------------ | ---------------------------- | -------------------------------------------- |
| **EV (Earned Value)**                | % of work completed × Budget | Value of actual work done                    |
| **PV (Planned Value)**               | % of planned work × Budget   | Value of planned work                        |
| **AC (Actual Cost)**                 | Actual spending              | Cost incurred                                |
| **CPI (Cost Performance Index)**     | EV ÷ AC                      | >1 = under budget, <1 = over budget          |
| **SPI (Schedule Performance Index)** | EV ÷ PV                      | >1 = ahead of schedule, <1 = behind schedule |

---

## 🗣️ How to Explain to Examiner

> “Sir/Ma’am, this diagram represents the Online Food Delivery Management System project.
> The **pie chart** shows how the total budget is distributed among various modules.
> The **line chart** compares planned and actual project cost over time, showing a small cost overrun.
> The **CPM diagram** highlights the longest path — the critical path — which determines the minimum project duration.
> This analysis helps monitor performance and manage time, cost, and resources efficiently.”

---

Would you like me to give you **step-by-step visuals (screenshots)** of how to make the Pie Chart, Line Chart, and CPM in EdrawMax (so you can follow exactly in lab)?

