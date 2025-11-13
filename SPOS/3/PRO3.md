Perfect 👍 — you’ve posted the **Reader–Writer Problem using Java Semaphores**, which is a classic **SPOS (Systems Programming and Operating Systems)** experiment.
Let’s go step by step — I’ll **explain your program in detail**, **why each part exists**, **what output to expect**, and **what the examiner may ask you** in the practical or viva.

---

## 🧠 **Concept: Reader–Writer Problem**

It’s a synchronization problem in OS (Operating Systems).

* You have a **shared resource** (like a file or database) accessed by multiple **readers** and **writers**.
* **Readers** can read simultaneously (no harm).
* **Writers** need **exclusive access** (no other thread can read or write while one writer writes).

Goal:
✅ Allow **multiple readers** to access the shared data at the same time.
🚫 Prevent **any reader** from reading when a **writer** is writing.
🚫 Prevent **writers** from writing at the same time.

---

## ⚙️ **Code Explanation**

### **1. SharedData Class**

```java
class SharedData {
    int data = 0;         // Shared resource
    int readCount = 0;    // Number of readers currently reading
    Semaphore mutex;      // Protects readCount
    Semaphore wrt;        // Controls writer access
}
```

* `mutex` → ensures **mutual exclusion** while updating `readCount`.
* `wrt` → ensures **only one writer or multiple readers** can enter the critical section.

---

### **2. Reader Class**

```java
class Reader extends Thread {
    public void run() {
        shared.mutex.acquire();   // Lock before changing readCount
        shared.readCount++;
        if (shared.readCount == 1)
            shared.wrt.acquire(); // First reader locks writers
        shared.mutex.release();   // Unlock after updating

        // 🔹 Critical section
        System.out.println("Reader " + id + " is reading: " + shared.data);
        Thread.sleep(1000);

        // 🔹 Exit section
        shared.mutex.acquire();
        shared.readCount--;
        if (shared.readCount == 0)
            shared.wrt.release(); // Last reader unlocks writers
        shared.mutex.release();

        Thread.sleep(2000);
    }
}
```

### 🧩 Explanation:

* First reader locks writers (`shared.wrt.acquire()`).
* Other readers read simultaneously.
* When the last reader finishes, it releases the writer semaphore (`shared.wrt.release()`).

---

### **3. Writer Class**

```java
class Writer extends Thread {
    public void run() {
        shared.wrt.acquire();     // Exclusive access
        shared.data++;            // Modify shared resource
        System.out.println("Writer " + id + " wrote: " + shared.data);
        Thread.sleep(1000);
        shared.wrt.release();     // Release lock
        Thread.sleep(3000);
    }
}
```

### 🧩 Explanation:

* A writer always waits if any **reader** or another **writer** is active.
* It increments `shared.data` as a simulation of writing.

---

### **4. Main Class**

```java
public class ReaderWriterProblem {
    public static void main(String[] args) {
        SharedData shared = new SharedData();
        for (int i = 1; i <= 5; i++) new Reader(i, shared).start();
        for (int i = 1; i <= 2; i++) new Writer(i, shared).start();
    }
}
```

* Creates **5 Readers** and **2 Writers** threads.
* All threads share the same `SharedData` instance.

---

## 🖥️ **Expected Output (Sample)**

Output order can vary due to threading:

```
Writer 1 wrote: 1
Reader 1 is reading: 1
Reader 2 is reading: 1
Writer 2 wrote: 2
Reader 3 is reading: 2
Reader 4 is reading: 2
Reader 5 is reading: 2
Writer 1 wrote: 3
...
```

This shows writers and readers accessing the shared variable `data` while maintaining synchronization.

---

## 🧮 **Synchronization Summary Table**

| Resource    | Controlled by    | Purpose                                               |
| ----------- | ---------------- | ----------------------------------------------------- |
| `mutex`     | Binary Semaphore | Ensures only one reader updates `readCount` at a time |
| `wrt`       | Binary Semaphore | Ensures writers have exclusive access                 |
| `readCount` | Counter          | Tracks how many readers are currently reading         |

---

## 🧑‍🏫 **Viva / Practical Questions**

### 🔹 Conceptual Questions:

1. **What problem does this program solve?**
   → Synchronization between readers and writers on shared data.

2. **Why do we use semaphores?**
   → To control access and prevent race conditions.

3. **What’s the difference between mutex and semaphore?**
   → Mutex → binary (1 or 0); Semaphore → count-based synchronization.

4. **Can multiple readers read at the same time?**
   → Yes, because reading doesn’t modify data.

5. **Can multiple writers write at the same time?**
   → No, because writing changes shared data → leads to inconsistency.

6. **What is starvation?**
   → When readers continuously occupy access and writers never get a chance (this code doesn’t handle writer starvation).

---

## 🧩 **Improvement Ideas**

You can mention these if the examiner asks for “enhancements”:

* Add **writer priority** to prevent writer starvation.
* Add a **finite number of read/write iterations** instead of infinite loops.
* Record timestamps/logs of read/write operations.

---

## 🧱 **How to Run in Kali**

1. Save the file as `ReaderWriterProblem.java`
2. Compile:

   ```bash
   javac ReaderWriterProblem.java
   ```
3. Run:

   ```bash
   java ReaderWriterProblem
   ```

If you get:

```
error: can't find main(String[]) method in class: SharedData
```

✅ Ensure you’re running the **main file**, not `SharedData.java`
Use:

```
java ReaderWriterProblem
```

not:

```
java SharedData
```

---

Would you like me to also show you **how to draw the Reader-Writer synchronization diagram (flow of semaphores)** in **EdrawMax**, as it might be asked for theory/lab record submission?
