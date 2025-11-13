Excellent — this is a **Project Dashboard + CPM (Critical Path Method)** task for your **SPM (Software Project Management)** practical (SPPU format). Let’s go step-by-step so you can **make it easily in EdrawMax** and **explain it confidently during viva** tomorrow.

---

## 🎯 Experiment Goal:

To **create a Project Dashboard** for an **Online Home Delivery Management System**, showing:

* Project summary
* Allocated resources
* Project completion status
* Cost vs. Budget
* Allotted tasks
  and then **analyze using CPM (Critical Path Method)**.

---

## 🧾 Step 1: Define the Project Overview

### 🛒 **Project Name:**

**Online Home Delivery Management System**

### 📄 **Project Objective:**

To develop a web-based + mobile platform for managing online food and grocery delivery, including order tracking, delivery agent management, and payment handling.

### 📊 **Project Duration:**

**6 months**

### 💰 **Estimated Budget (BAC):**

**₹10,00,000**

### 👥 **Team Structure / Resources:**

| Role                   | No. of People | Cost/Month (₹) |
| ---------------------- | ------------- | -------------- |
| Project Manager        | 1             | 50,000         |
| Developer              | 3             | 1,20,000       |
| Tester                 | 1             | 40,000         |
| UI/UX Designer         | 1             | 30,000         |
| Database Admin         | 1             | 35,000         |
| **Total Monthly Cost** | 7             | **2,75,000**   |

---

## 🧮 Step 2: Define Key Tasks & Durations (for CPM)

| Task ID | Task Name             | Duration (weeks) | Predecessor(s) |
| ------- | --------------------- | ---------------- | -------------- |
| A       | Requirement Gathering | 2                | -              |
| B       | System Design         | 2                | A              |
| C       | Database Design       | 1                | B              |
| D       | Frontend Development  | 3                | B              |
| E       | Backend Development   | 3                | C              |
| F       | Integration & Testing | 2                | D, E           |
| G       | Deployment            | 1                | F              |

---

## 🕒 Step 3: Calculate CPM (Critical Path Method)

### Step 3.1 – Determine All Paths

1. **A → B → C → E → F → G = 2 + 2 + 1 + 3 + 2 + 1 = 11 weeks**
2. **A → B → D → F → G = 2 + 2 + 3 + 2 + 1 = 10 weeks**

✅ **Critical Path = Path 1 (A–B–C–E–F–G)**
🕓 **Project Duration = 11 weeks**

---

## 📊 Step 4: Project Dashboard Elements in **EdrawMax**

### 👉 Open EdrawMax → Go to **Project Management → Dashboard Templates**

Choose **“Project Summary Dashboard”** template and edit these panels:

### 1. **Project Summary Panel**

| Parameter    | Value                       |
| ------------ | --------------------------- |
| Project Name | Online Home Delivery System |
| Duration     | 6 Months (11 weeks dev)     |
| Status       | On Track                    |
| Completion   | 65%                         |
| Budget       | ₹10,00,000                  |
| Spent        | ₹6,50,000                   |
| CPI          | 1.03                        |
| SPI          | 0.95                        |

### 2. **Resource Allocation Panel**

Use a **Pie Chart**:

* Developers – 40%
* Testers – 15%
* Designers – 10%
* PM & DBA – 35%

*(Insert → Chart → Pie Chart → Enter data manually)*

### 3. **Budget vs Actual Panel**

Use a **Bar Chart:**

| Month | Planned (₹) | Actual (₹) |
| ----- | ----------- | ---------- |
| Jan   | 1,50,000    | 1,60,000   |
| Feb   | 1,50,000    | 1,55,000   |
| Mar   | 2,00,000    | 1,90,000   |
| Apr   | 2,00,000    | 1,80,000   |

---

## 🧩 Step 5: Draw **CPM Diagram** in EdrawMax

### In EdrawMax:

1. Go to **Project Management → Flowcharts**.
2. Choose **“Activity Network Diagram”**.
3. Create nodes for each task:

   * A → B → C → E → F → G
   * B → D → F → G
4. Draw **arrows** for task dependency.
5. Label each node with:

   ```
   Task: A
   Duration: 2 weeks
   ES=0 | EF=2
   LS=0 | LF=2
   Slack=0
   ```

   (Show float/slack as 0 for critical tasks)

✅ Highlight **critical path** (A-B-C-E-F-G) in **red color**.

---

## 📈 Step 6: Final Dashboard Layout

**Top Section:** Project Summary
**Left Panel:** Pie chart – Resource Allocation
**Right Panel:** Bar chart – Budget vs Actual
**Bottom Section:** CPM Diagram
**Footer:** Key metrics (CPI, SPI, Duration, Completion%)

---

## 💬 Viva / Oral Questions (With Short Answers)

| Question                        | Short Answer                                                                           |
| ------------------------------- | -------------------------------------------------------------------------------------- |
| What is a project dashboard?    | A visual summary showing project progress, cost, and performance metrics.              |
| What is the purpose of CPM?     | To identify the longest path and critical tasks that determine total project duration. |
| What is the critical path here? | A–B–C–E–F–G                                                                            |
| What does CPI < 1 indicate?     | Project is over budget.                                                                |
| What does SPI < 1 indicate?     | Project is behind schedule.                                                            |

---

Would you like me to give you the **exact CPM diagram layout (with node times)** so you can replicate it node-by-node in EdrawMax?
It will help you make the flowchart exactly like it should appear in your practical submission.

