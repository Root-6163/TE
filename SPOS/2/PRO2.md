Nice work — good to see the files are in place. I looked over your directory listing, the files you `cat`-ed, and the `Pass2` output you produced. The main issue I see (and what’s causing confusing output like `+ 05 1 A`) is **mismatch between the expected format of `symtab.txt` / `literal.txt` and what your `Pass2` program actually needs**.

Below I’ll:

1. Explain what your current `Pass2` expects vs what you have.
2. Show the **minimal fixes** (file-format + run commands) so `Pass2` prints addresses (not symbol names).
3. Provide a **robust corrected `Pass2.java`** you can compile & run on Kali.
4. Give **sample `symtab.txt` and `literal.txt`** contents and expected `Pass2.txt` output.
5. Give a short checklist & a few viva questions you may be asked.

---

## 1) What’s happening (short)

Your `Pass2` code looks up symbols by index (`(S,n)` in intermediate code) and expects to **replace that `(S,n)` by an address** (from your symbol table). But the `symtab.txt` in your folder currently contains **only symbol names** (no addresses), so `symSymbol.get(index)` returns a symbol name like `A` — that’s why the output shows `A` instead of an address.

Similarly `literal.txt` must contain literal value **and** the address assigned during Pass1 (e.g. `='5' 211`). Your `Pass2` code reads the literal file expecting two columns (literal and address), so make sure `literal.txt` is in `literal address` format (you already have that format — good).

So either:

* Provide `symtab.txt` with addresses (best/fix the files), or
* Change `Pass2` to map symbol index→address using some other source (less ideal).

---

## 2) Minimal quick fix (preferred)

Update `symtab.txt` so each line has:

```
<symbol> <address>
```

Example (one per line):

```
A 211
LOOP 202
B 212
NEXT 208
BACK 202
LAST 210
```

Keep `literal.txt` in:

```
<literal> <address>
```

(you already have lines like `5 211` — but they should be `='5' 211` or consistent with your intermediate file literal form).

Then run:

```bash
cd /home/sweetrat/spos/2
javac Pass2.java
java Pass2
```

If `symtab.txt` lines are `symbol address`, the current `Pass2` needs a tiny tweak to load addresses rather than just the first token. I included a robust `Pass2` below that handles either two-column `symbol address` files or single-column symbol files (and will print a helpful error if addresses are missing).

---

## 3) Robust corrected `Pass2.java`

Save this as `/home/sweetrat/spos/2/Pass2.java` (replace your current file). This version:

* Uses Linux paths
* Loads `symtab.txt` expecting either `symbol address` or a single symbol per line (if single token, it will warn)
* Loads `literal.txt` expecting `literal address`
* Parses `intermediate.txt` reliably using regex for `(IS,xx)`, `(DL,01)(C,x)`, `(S,n)` and `(L,n)`
* Writes machine-format lines with addresses (or meaningful errors if a mapping is missing)

```java
import java.io.*;
import java.util.*;
import java.util.regex.*;

public class Pass2 {
    public static void main(String[] args) {
        String dir = "/home/sweetrat/spos/2";
        File fiInter = new File(dir, "intermediate.txt");
        File fiSym = new File(dir, "symtab.txt");
        File fiLit = new File(dir, "literal.txt");
        File fo = new File(dir, "Pass2.txt");

        HashMap<Integer, String> symIndexToAddr = new HashMap<>();
        HashMap<Integer, String> litIndexToAddr = new HashMap<>();

        try (
            BufferedReader b1 = new BufferedReader(new FileReader(fiInter));
            BufferedReader b2 = new BufferedReader(new FileReader(fiSym));
            BufferedReader b3 = new BufferedReader(new FileReader(fiLit));
            BufferedWriter out = new BufferedWriter(new FileWriter(fo))
        ) {
            // Load Symbol Table
            // Accept lines: "SYMBOL ADDRESS" or "SYMBOL" (warn)
            String line;
            int symPtr = 1;
            while ((line = b2.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty()) continue;
                String[] tok = line.split("\\s+");
                if (tok.length >= 2) {
                    // format: SYMBOL ADDRESS
                    symIndexToAddr.put(symPtr++, tok[1]);
                } else {
                    // format: SYMBOL (no address) -- store symbol name as placeholder (not ideal)
                    System.err.println("Warning: symtab line has no address: '" + line + "'. You should include addresses.");
                    symIndexToAddr.put(symPtr++, tok[0]); // placeholder so code doesn't NPE
                }
            }

            // Load Literal Table
            // Expect lines: "literal address" (e.g. ='5' 211)
            int litPtr = 1;
            while ((line = b3.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty()) continue;
                String[] tok = line.split("\\s+");
                if (tok.length >= 2) {
                    litIndexToAddr.put(litPtr++, tok[1]);
                } else {
                    System.err.println("Warning: literal line has no address: '" + line + "'");
                    litIndexToAddr.put(litPtr++, tok[0]);
                }
            }

            // Patterns to parse intermediate file
            Pattern isPattern = Pattern.compile("\\(IS,\\s*(\\d+)\\)");
            Pattern dl01Pattern = Pattern.compile("\\(DL,01\\)\\(C,(\\d+)\\)");
            Pattern sPattern = Pattern.compile("\\(S,(\\d+)\\)");
            Pattern lPattern = Pattern.compile("\\(L,(\\d+)\\)");

            while ((line = b1.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty()) continue;

                // If IS,00 (no-operation)
                if (line.contains("(IS,00)")) {
                    out.write("+ 00 0 000");
                    out.newLine();
                    continue;
                }

                Matcher isM = isPattern.matcher(line);
                if (isM.find()) {
                    // Extract opcode number
                    String opcodeNum = isM.group(1);
                    // We'll print opcode number as two digits
                    String op = String.format("%02d", Integer.parseInt(opcodeNum));
                    StringBuilder sb = new StringBuilder();
                    sb.append("+ ").append(op).append(" ");

                    // find operand type S or L (if present)
                    Matcher sM = sPattern.matcher(line);
                    Matcher lM = lPattern.matcher(line);
                    if (sM.find()) {
                        int idx = Integer.parseInt(sM.group(1));
                        String addr = symIndexToAddr.get(idx);
                        if (addr == null) {
                            System.err.println("Error: Symbol index " + idx + " not found in symtab.");
                            addr = "???";
                        }
                        sb.append("1 ").append(addr); // assuming register code 1; adapt if needed
                    } else if (lM.find()) {
                        int idx = Integer.parseInt(lM.group(1));
                        String addr = litIndexToAddr.get(idx);
                        if (addr == null) {
                            System.err.println("Error: Literal index " + idx + " not found in littab.");
                            addr = "000";
                        }
                        sb.append("0 ").append(addr);
                    } else {
                        // No operand
                        sb.append("0 000");
                    }
                    out.write(sb.toString());
                    out.newLine();
                    continue;
                }

                // Handle DL,01 constants (like (DL,01)(C,5))
                Matcher dlM = dl01Pattern.matcher(line);
                if (dlM.find()) {
                    String c = dlM.group(1);
                    // pad to 3 digits
                    String s2 = String.format("%03d", Integer.parseInt(c));
                    out.write("+ 00 0 " + s2);
                    out.newLine();
                    continue;
                }

                // default: blank line in output for directives
                out.newLine();
            }

            System.out.println("✅ Pass2 completed. Output: " + fo.getAbsolutePath());

        } catch (FileNotFoundException e) {
            System.err.println("File missing: " + e.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

**Notes on the new code:**

* It expects `symtab.txt` lines as `SYMBOL ADDRESS` (preferred). If only symbol present it warns; better to add addresses.
* `literal.txt` must be `literal address` (e.g. `='5' 211`). Your earlier `literal.txt` shows `5 211` — prefer `='5' 211` to match intermediate tokens, or adjust the tokens consistently.
* The code uses regex to find `(IS,xx)` and `(S,n)` / `(L,n)` patterns so it’s tolerant to whitespace.

---

## 4) Sample input files (exact contents) — copy these into your folder

**intermediate.txt**
(keep as you already have — but here for completeness)

```
(AD,01)(C,200)
(IS,04)(1)(L,1)
(IS,05)(1)(S,1)
(IS,04)(1)(S,1)
(IS,04)(3)(S,3)
(IS,01)(3)(L,2)
(IS,07)(6)(S,4)
(DL,01)(C,5)
(DL,01)(C,1)
(IS,02)(1)(L,3)
(IS,07)(1)(S,5)
(IS,00)
(AD,03)(S,2)+2
(IS,03)(3)(S,3)
(AD,03)(S,6)+1
(DL,02)(C,1)
(DL,02)(C,1)
(AD,02)
(DL,01)(C,1)
```

**symtab.txt** — *must* contain symbol and address (one per line):

```
A 211
LOOP 202
B 212
NEXT 208
BACK 202
LAST 210
```

**literal.txt** — literal and address (one per line):

```
='5' 205
='1' 206
='1' 207
```

After running the corrected `Pass2`, you should see `Pass2.txt` with lines like:

```
+ 04 1 205
+ 05 1 211
+ 04 1 211
...
+ 00 0 005
+ 00 0 001
...
```

Addresses will be used instead of raw symbol names.

---

## 5) How to compile & run (Kali)

From the folder `/home/sweetrat/spos/2`:

```bash
# make sure files are present
ls -l intermediate.txt symtab.txt literal.txt Pass2.java

# compile
javac Pass2.java

# run
java Pass2

# check output
cat Pass2.txt
```

If `javac` produces any errors, copy the error message and I’ll fix them.

---

## 6) Quick checklist if output still looks odd

* Ensure `symtab.txt` lines contain both symbol and address. If not, modify as shown.
* Ensure `literal.txt` lines are `literal address` (use same literal format as in intermediate, e.g. `='5'`).
* Make sure file encoding and line endings are Unix (`\n`), not Windows CRLF.
* Make sure file permissions are readable: `ls -l` should show `-rw-r--r--` for the files.

---

## 7) Viva / Examiner expectations around Pass2

Be ready to explain:

* How `intermediate.txt` format denotes (IS,opcode)(r)(S,n)/(L,n) etc.
* Why symbol table must include addresses.
* How you map `(S,n)` to the address for object code: `symIndexToAddr.get(n)`.
* How literals are assigned addresses in Pass1 (LTORG) and used in Pass2.
* What to do if a symbol index is missing (error handling).
* The difference between AD / DL / IS classes and how Pass2 treats them.

---

If you want, I can:

* Edit your actual `symtab.txt` / `literal.txt` in `/home/sweetrat/spos/2` (you can paste current contents here) and produce the corrected `Pass2.txt` for you, or
* Produce a short printable **lab note** explaining Pass2 step-by-step with the corrected files and sample output.

Which would you like next?
