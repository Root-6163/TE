import java.io.*;
import java.util.HashMap;

public class Pass2 {
    public static void main(String[] args) {
        try {
            // Corrected Linux paths
            BufferedReader b1 = new BufferedReader(new FileReader("/home/sweetrat/spos/2/intermediate.txt"));
            BufferedReader b2 = new BufferedReader(new FileReader("/home/sweetrat/spos/2/symtab.txt"));
            BufferedReader b3 = new BufferedReader(new FileReader("/home/sweetrat/spos/2/literal.txt"));

            FileWriter f1 = new FileWriter("/home/sweetrat/spos/2/Pass2.txt");

            HashMap<Integer, String> symSymbol = new HashMap<>();
            HashMap<Integer, String> litSymbol = new HashMap<>();
            HashMap<Integer, String> litAddr = new HashMap<>();

            String s;
            int symtabPointer = 1, littabPointer = 1, offset;

            // Load Symbol Table
            while ((s = b2.readLine()) != null && !s.trim().isEmpty()) {
                String[] word = s.trim().split("\\s+");
                symSymbol.put(symtabPointer++, word[0]);
            }

            // Load Literal Table
            while ((s = b3.readLine()) != null && !s.trim().isEmpty()) {
                String[] word = s.trim().split("\\s+");
                if (word.length >= 2) {
                    litSymbol.put(littabPointer, word[0]);
                    litAddr.put(littabPointer++, word[1]);
                }
            }

            // Process intermediate code
            while ((s = b1.readLine()) != null) {
                if (s.contains("IS,00")) {
                    f1.write("+ 00 0 000\n");
                } else if (s.contains("IS")) {
                    f1.write("+ " + s.substring(4, 6) + " ");
                    if (s.charAt(9) == ')') {
                        f1.write(s.charAt(8) + " ");
                        offset = 3;
                    } else {
                        f1.write("0 ");
                        offset = 0;
                    }

                    if (s.charAt(8 + offset) == 'S') {
                        int index = Integer.parseInt(s.substring(10 + offset, s.length() - 1));
                        f1.write(symSymbol.get(index) + "\n");
                    } else {
                        int index = Integer.parseInt(s.substring(10 + offset, s.length() - 1));
                        f1.write(litAddr.get(index) + "\n");
                    }

                } else if (s.contains("DL,01")) {
                    String s1 = s.substring(10, s.length() - 1);
                    StringBuilder s2 = new StringBuilder();
                    for (int i = 0; i < 3 - s1.length(); i++) s2.append("0");
                    s2.append(s1);
                    f1.write("+ 00 0 " + s2 + "\n");
                } else {
                    f1.write("\n");
                }
            }

            // Close everything
            f1.close();
            b1.close();
            b2.close();
            b3.close();

            System.out.println("✅ Pass2 execution complete. Output written to Pass2.txt");

        } catch (FileNotFoundException e) {
            System.out.println("❌ File not found. Please check that intermediate.txt, symtab.txt, and literal.txt exist.");
        } catch (IOException e) {
            System.out.println("❌ I/O error occurred: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

