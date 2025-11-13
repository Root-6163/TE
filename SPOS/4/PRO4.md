Perfect 👏 — I see you’ve got **all four CPU Scheduling algorithms (Assignment 4 of SPOS)** implemented in Java inside your Kali Linux student folder:
✅ `Ass4_FCFS.java` → **First Come First Serve**
✅ `Ass4_SJFS.java` → **Shortest Job First (Non-preemptive)**
✅ `Ass4_Prio.java` → **Priority Scheduling**
✅ `Ass4_RR.java` → **Round Robin Scheduling**

Let’s go step-by-step so you can **run**, **verify outputs**, and **understand what to show** in your lab file or viva.

---

## 🧩 1. **FCFS (First Come First Serve)**

### 🔹 Concept:

Processes are executed in the order they arrive.

### 🔹 Command to run:

```bash
javac Ass4_FCFS.java
java Ass4_FCFS
```

### 🔹 Sample Input:

```
Enter no. of processes: 
3
Enter process 1 arrival time and burst time: 
0 5
Enter process 2 arrival time and burst time: 
2 3
Enter process 3 arrival time and burst time: 
4 1
```

### 🔹 Sample Output:

```
Pid  Arrival  Burst  Complete  Turnaround  Waiting
1    0        5      5         5           0
2    2        3      8         6           3
3    4        1      9         5           4

Average waiting time: 2.33
Average turnaround time: 5.33
```

---

## 🧩 2. **SJF (Shortest Job First — Non-Preemptive)**

### 🔹 Concept:

The process with the shortest burst time is executed next.

### 🔹 Command:

```bash
javac Ass4_SJFS.java
java Ass4_SJFS
```

### 🔹 Sample Input:

```
Enter no. of processes:
3
Enter process 1 arrival time:
0
Enter process 1 burst time:
7
Enter process 2 arrival time:
2
Enter process 2 burst time:
4
Enter process 3 arrival time:
4
Enter process 3 burst time:
1
```

### 🔹 Sample Output:

```
Pid  Arrival  Burst  Complete  Turnaround  Waiting
1    0        7      7         7           0
2    2        4      12        10          6
3    4        1      8         4           3

Average turnaround time: 7.0
Average waiting time: 3.0
```

---

## 🧩 3. **Priority Scheduling**

### 🔹 Concept:

The process with **highest priority (lowest number)** runs first.

### 🔹 Command:

```bash
javac Ass4_Prio.java
java Ass4_Prio
```

### 🔹 Sample Input:

```
Enter No. of processes: 3
Enter Process 1 Burst Time: 5
Enter Process 1 Priority: 3
Enter Process 2 Burst Time: 3
Enter Process 2 Priority: 1
Enter Process 3 Burst Time: 2
Enter Process 3 Priority: 2
```

### 🔹 Sample Output:

```
Priority   Process   Burst   Completion   WT   TAT
1          2         3       3            0    3
2          3         2       5            3    5
3          1         5       10           5    10

Average Turnaround Time: 6.0
Average Wait Time: 2.67
```

---

## 🧩 4. **Round Robin (RR)**

### 🔹 Concept:

Each process gets equal CPU time in cyclic order using **Time Quantum (TQ)**.

### 🔹 Command:

```bash
javac Ass4_RR.java
java Ass4_RR
```

### 🔹 Sample Input:

```
Enter How Many Processes You Want: 3
Enter Process 1 burst time: 5
Enter Process 2 burst time: 3
Enter Process 3 burst time: 1
Enter Time Quantum: 2
```

### 🔹 Sample Output:

```
Process  Burst Time  Completion  Turnaround Time  Waiting Time
1        5           9           9                4
2        3           8           8                5
3        1           3           3                2

Average Waiting Time = 3.67
Average Turnaround Time = 6.67
```

---

## 🧠 Viva/Exam Preparation

| Algorithm | Scheduling Type | Preemptive | Basis        | Example Command  |
| --------- | --------------- | ---------- | ------------ | ---------------- |
| FCFS      | Non-Preemptive  | ❌          | Arrival Time | `java Ass4_FCFS` |
| SJF       | Non-Preemptive  | ❌          | Burst Time   | `java Ass4_SJFS` |
| Priority  | Non-Preemptive  | ❌          | Priority     | `java Ass4_Prio` |
| RR        | Preemptive      | ✅          | Time Quantum | `java Ass4_RR`   |

---

## 📊 Gantt Chart Representation (for your Record File)

### Example for FCFS:

```
Process Sequence: P1 → P2 → P3
Gantt Chart:
| P1 | P2 | P3 |
0    5    8    9
```

### Example for RR (TQ=2):

```
Process Sequence: P1 → P2 → P3 → P1 → P2 → P1
Gantt Chart:
|P1|P2|P3|P1|P2|P1|
0  2  4  5  7  8  9
```

---

## 🧾 If you want to create a **Project Dashboard in EdrawMax**

You can make a **CPU Scheduling Dashboard** showing:

* **Algorithm type:** FCFS / SJF / Priority / RR
* **Processes table:** Arrival, Burst, Waiting, Turnaround
* **Bar chart or Gantt chart** visualization
* **Average times summary box**

Would you like me to give you a **ready layout / diagram plan for EdrawMax** for these scheduling algorithms (like where to place process table, Gantt chart, and averages)?
