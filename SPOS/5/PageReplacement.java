import java.util.Scanner;

// Base abstract class for all page replacement algorithms
abstract class PageReplacementAlgorithm {
    protected int[][] frames;
    protected int numFrames;
    protected int pageFault;
    protected int[] pages;
    protected int pagesLength;

    public PageReplacementAlgorithm(int numFrames, int[] pages) {
        this.numFrames = numFrames;
        this.pages = pages;
        this.pagesLength = pages.length;
        this.pageFault = 0;

        this.frames = new int[pagesLength][numFrames + 1];
        for (int i = 0; i < pagesLength; i++)
            for (int j = 0; j < numFrames + 1; j++)
                frames[i][j] = -1;
    }

    protected boolean isPageFault(int index, int page) {
        for (int i = 0; i < numFrames; i++)
            if (frames[index][i] == page)
                return false;
        return true;
    }

    protected void copyPreviousFrame(int index) {
        if (index == 0) return;
        for (int i = 0; i < numFrames; i++)
            frames[index][i] = frames[index - 1][i];
    }

    protected abstract void replacePage();

    public void displayFrames() {
        for (int i = 0; i < pagesLength; i++)
            System.out.print(pages[i] + " ");
        System.out.println("\n" + "-".repeat(pagesLength * 2));

        for (int i = 0; i < numFrames; i++) {
            for (int j = 0; j < pagesLength; j++) {
                if (frames[j][i] == -1)
                    System.out.print("  ");
                else
                    System.out.print(frames[j][i] + " ");
            }
            System.out.println();
        }

        System.out.println("\nTotal Page Hits: " + (pagesLength - pageFault));
        System.out.println("Total Page Faults: " + pageFault);
    }
}

// FIFO Algorithm
class FIFO extends PageReplacementAlgorithm {
    private int pointer = 0;

    public FIFO(int numFrames, int[] pages) {
        super(numFrames, pages);
    }

    @Override
    protected void replacePage() {
        for (int i = 0; i < pagesLength; i++) {
            int page = pages[i];
            copyPreviousFrame(i);

            if (isPageFault(i, page)) {
                frames[i][pointer] = page;
                frames[i][numFrames] = -3;
                pointer = (pointer + 1) % numFrames;
                pageFault++;
            }
        }
        System.out.println("\nFIFO Page Replacement:");
        displayFrames();
    }
}

// LRU Algorithm
class LRU extends PageReplacementAlgorithm {
    public LRU(int numFrames, int[] pages) {
        super(numFrames, pages);
    }

    private int findLRU(int index, int[] currentFrame) {
        int lruIndex = 0;
        int minLastUsed = index;
        for (int i = 0; i < numFrames; i++) {
            int lastUsed = -1;
            for (int j = index - 1; j >= 0; j--) {
                if (currentFrame[i] == pages[j]) {
                    lastUsed = j;
                    break;
                }
            }
            if (lastUsed == -1)
                return i;
            else if (lastUsed < minLastUsed) {
                minLastUsed = lastUsed;
                lruIndex = i;
            }
        }
        return lruIndex;
    }

    @Override
    protected void replacePage() {
        for (int i = 0; i < pagesLength; i++) {
            int page = pages[i];
            copyPreviousFrame(i);

            if (isPageFault(i, page)) {
                boolean placed = false;

                for (int j = 0; j < numFrames; j++) {
                    if (frames[i][j] == -1) {
                        frames[i][j] = page;
                        frames[i][numFrames] = -3;
                        pageFault++;
                        placed = true;
                        break;
                    }
                }

                if (!placed) {
                    int replaceIndex = findLRU(i, frames[i]);
                    frames[i][replaceIndex] = page;
                    frames[i][numFrames] = -3;
                    pageFault++;
                }
            }
        }
        System.out.println("\nLRU Page Replacement:");
        displayFrames();
    }
}

// Optimal Algorithm
class Optimal extends PageReplacementAlgorithm {
    public Optimal(int numFrames, int[] pages) {
        super(numFrames, pages);
    }

    private int findFurthest(int index, int[] currentFrame) {
        int pos = -1, farthest = index;

        for (int i = 0; i < numFrames; i++) {
            int nextUse = -1;
            for (int j = index + 1; j < pagesLength; j++) {
                if (currentFrame[i] == pages[j]) {
                    nextUse = j;
                    break;
                }
            }
            if (nextUse == -1)
                return i;
            else if (nextUse > farthest) {
                farthest = nextUse;
                pos = i;
            }
        }
        return (pos == -1) ? 0 : pos;
    }

    @Override
    protected void replacePage() {
        for (int i = 0; i < pagesLength; i++) {
            int page = pages[i];
            copyPreviousFrame(i);

            if (isPageFault(i, page)) {
                boolean placed = false;

                for (int j = 0; j < numFrames; j++) {
                    if (frames[i][j] == -1) {
                        frames[i][j] = page;
                        frames[i][numFrames] = -3;
                        pageFault++;
                        placed = true;
                        break;
                    }
                }

                if (!placed) {
                    int replaceIndex = findFurthest(i, frames[i]);
                    frames[i][replaceIndex] = page;
                    frames[i][numFrames] = -3;
                    pageFault++;
                }
            }
        }
        System.out.println("\nOptimal Page Replacement:");
        displayFrames();
    }
}

// Main Class
public class PageReplacement {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number of frames: ");
        int numFrames = sc.nextInt();

        int[] pages = {1, 2, 3, 2, 1, 5, 2, 1, 6, 2, 5, 6, 3, 1, 3, 6, 1, 2, 4, 3};

        FIFO fifo = new FIFO(numFrames, pages);
        LRU lru = new LRU(numFrames, pages);
        Optimal optimal = new Optimal(numFrames, pages);

        fifo.replacePage();
        lru.replacePage();
        optimal.replacePage();

        sc.close();
    }
}

