import java.util.concurrent.Semaphore;

// Shared data between readers and writers
class SharedData {
    int data = 0;
    int readCount = 0;
    Semaphore mutex;
    Semaphore wrt;

    public SharedData() {
        mutex = new Semaphore(1);
        wrt = new Semaphore(1);
    }
}

// Reader Thread
class Reader extends Thread {
    private int id;
    private SharedData shared;

    public Reader(int id, SharedData shared) {
        this.id = id;
        this.shared = shared;
    }

    public void run() {
        try {
            while (true) {
                // Entry section
                shared.mutex.acquire();
                shared.readCount++;
                if (shared.readCount == 1) {
                    shared.wrt.acquire(); // First reader locks writers
                }
                shared.mutex.release();

                // Critical section
                System.out.println("Reader " + id + " is reading: " + shared.data);
                Thread.sleep(1000);

                // Exit section
                shared.mutex.acquire();
                shared.readCount--;
                if (shared.readCount == 0) {
                    shared.wrt.release(); // Last reader releases writers
                }
                shared.mutex.release();

                Thread.sleep(2000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

// Writer Thread
class Writer extends Thread {
    private int id;
    private SharedData shared;

    public Writer(int id, SharedData shared) {
        this.id = id;
        this.shared = shared;
    }

    public void run() {
        try {
            while (true) {
                shared.wrt.acquire(); // Writers need exclusive access

                // Critical section
                shared.data++;
                System.out.println("Writer " + id + " wrote: " + shared.data);
                Thread.sleep(1000);

                shared.wrt.release(); // Release access
                Thread.sleep(3000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

// Main class
public class ReaderWriterProblem {
    public static void main(String[] args) {
        SharedData shared = new SharedData();

        // Create Readers
        for (int i = 1; i <= 5; i++) {
            new Reader(i, shared).start();
        }

        // Create Writers
        for (int i = 1; i <= 2; i++) {
            new Writer(i, shared).start();
        }
    }
}

