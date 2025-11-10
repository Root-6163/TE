import java.io.*;

public class Pass1 {
    public static void main(String[] args) throws Exception {
        // Use a Linux-compatible path
        BufferedReader bufferedReader = new BufferedReader(
            new FileReader("/home/sweetrat/spos/1/input.txt")
        );

        final int MAX = 100;
        String[][] SymbolTab = new String[MAX][3];
        String[][] OpTab = new String[MAX][3];
        String[][] LitTab = new String[MAX][2];
        int[] PoolTab = new int[MAX];

        int LC = 0, line_count = 0;
        int symTabLine = 0, opTabLine = 0, litTabLine = 0, poolTabLine = 0;

        String line;
        System.out.println("----- PASS 1 OUTPUT -----");

        while ((line = bufferedReader.readLine()) != null) {
            String[] tokens = line.trim().split("\\s+");

            if (tokens.length == 0) continue;

            if (line_count == 0) {
                // First line START
                LC = Integer.parseInt(tokens[1]);
                System.out.println(line);
            } else {
                System.out.println(line);

                // Handle labels and symbols
                if (!tokens[0].isEmpty() && !tokens[0].equalsIgnoreCase("START")) {
                    SymbolTab[symTabLine++] = new String[]{tokens[0], Integer.toString(LC), "1"};
                }

                // Handle literals
                for (String token : tokens) {
                    if (token.startsWith("='")) {
                        LitTab[litTabLine++] = new String[]{token, Integer.toString(LC)};
                    }
                }

                // Handle opcodes
                if (tokens.length > 1) {
                    String mnemonic = tokens[0];
                    if ("START END ORIGIN EQU LTORG".contains(mnemonic.toUpperCase())) {
                        OpTab[opTabLine++] = new String[]{mnemonic, "AD", "R11"};
                    } else if ("DS DC".contains(mnemonic.toUpperCase())) {
                        OpTab[opTabLine++] = new String[]{mnemonic, "DL", "R7"};
                    } else {
                        OpTab[opTabLine++] = new String[]{mnemonic, "IS", "(04,1)"};
                    }
                }
            }

            line_count++;
            LC++;
        }

        bufferedReader.close();

        displayTable("SYMBOL TABLE", "SYMBOL\tADDRESS\tLENGTH", SymbolTab, symTabLine);
        displayTable("OPCODE TABLE", "MNEMONIC\tCLASS\tINFO", OpTab, opTabLine);
        displayTable("LITERAL TABLE", "LITERAL\tADDRESS", LitTab, litTabLine);

        // Pool Table
        for (int i = 0; i < litTabLine - 1; i++) {
            if (LitTab[i][0] != null &&
                (i == 0 || Integer.parseInt(LitTab[i][1]) < Integer.parseInt(LitTab[i + 1][1]) - 1)) {
                PoolTab[poolTabLine++] = i + 1;
            }
        }

        System.out.println("\nPOOL TABLE");
        System.out.println("-----------------");
        System.out.println("LITERAL NUMBER");
        for (int i = 0; i < poolTabLine; i++)
            System.out.println(PoolTab[i]);
        System.out.println("------------------");
    }

    private static void displayTable(String title, String header, String[][] table, int count) {
        System.out.println("\n" + title);
        System.out.println("--------------------------");
        System.out.println(header);
        for (int i = 0; i < count; i++) {
            if (table[i] != null) {
                for (String col : table[i]) {
                    if (col != null)
                        System.out.print(col + "\t");
                }
                System.out.println();
            }
        }
        System.out.println("--------------------------");
    }
}

