import java.sql.*;
import java.util.Scanner;

public class MySQLConnect {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        try {
            // ✅ Step 1: Load & Connect
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/class", "root", "your_password_here");

            System.out.println("✅ Connected to MySQL Database Successfully!");

            // ✅ Step 2: Create Table (if not exists)
            Statement st = con.createStatement();
            st.executeUpdate("CREATE TABLE IF NOT EXISTS Personal (sno INT PRIMARY KEY, name VARCHAR(50), telephone VARCHAR(15), gender VARCHAR(10))");

            // ✅ Step 3: Insert Records
            PreparedStatement insert = con.prepareStatement("INSERT INTO Personal VALUES (?, ?, ?, ?)");
            System.out.print("Enter number of records to insert: ");
            int n = sc.nextInt();

            for (int i = 1; i <= n; i++) {
                System.out.println("Record " + i + ":");
                System.out.print("Enter Sno: ");
                int sno = sc.nextInt();
                sc.nextLine();
                System.out.print("Enter Name: ");
                String name = sc.nextLine();
                System.out.print("Enter Telephone: ");
                String tel = sc.nextLine();
                System.out.print("Enter Gender: ");
                String gender = sc.nextLine();

                insert.setInt(1, sno);
                insert.setString(2, name);
                insert.setString(3, tel);
                insert.setString(4, gender);
                insert.executeUpdate();
            }

            // ✅ Step 4: Display Data
            ResultSet rs = st.executeQuery("SELECT * FROM Personal");
            System.out.println("\n--- After Insertion ---");
            System.out.println("Sno\tName\tTelephone\tGender");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t" + rs.getString(4));
            }

            // ✅ Step 5: Delete Records
            PreparedStatement delete = con.prepareStatement("DELETE FROM Personal WHERE sno = ?");
            System.out.print("\nEnter number of records to delete: ");
            int delCount = sc.nextInt();
            for (int i = 1; i <= delCount; i++) {
                System.out.print("Enter Sno to delete: ");
                int sno = sc.nextInt();
                delete.setInt(1, sno);
                delete.executeUpdate();
            }

            // ✅ Step 6: Display After Deletion
            rs = st.executeQuery("SELECT * FROM Personal");
            System.out.println("\n--- After Deletion ---");
            System.out.println("Sno\tName\tTelephone\tGender");
            while (rs.next()) {
                System.out.println(rs.getInt(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t" + rs.getString(4));
            }

            con.close();
            System.out.println("\n✅ Connection Closed Successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
