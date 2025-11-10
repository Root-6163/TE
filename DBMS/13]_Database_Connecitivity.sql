"
13  Database Connectivity: Write a program to implement MongoDB database connectivity with any front end language to implement Database navigation operations (add, delete, edit etc.)s
"
import com.mongodb.client.*;
import org.bson.Document;
import java.util.Scanner;

public class MongoCRUD {
    public static void main(String[] args) {
        try (MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017")) {
            MongoDatabase db = mongoClient.getDatabase("StudentDB");
            MongoCollection<Document> collection = db.getCollection("Students");

            Scanner sc = new Scanner(System.in);
            int choice;

            System.out.println("✅ Connected to MongoDB Successfully!");

            do {
                System.out.println("\n--- MongoDB CRUD Menu ---");
                System.out.println("1. Add Record");
                System.out.println("2. View All Records");
                System.out.println("3. Update Record");
                System.out.println("4. Delete Record");
                System.out.println("5. Exit");
                System.out.print("Enter your choice: ");
                choice = sc.nextInt();
                sc.nextLine();

                switch (choice) {
                    case 1:
                        System.out.print("Enter Roll No: ");
                        int roll = sc.nextInt();
                        sc.nextLine();
                        System.out.print("Enter Name: ");
                        String name = sc.nextLine();
                        System.out.print("Enter Marks: ");
                        int marks = sc.nextInt();
                        collection.insertOne(new Document("rollno", roll)
                                .append("name", name)
                                .append("marks", marks));
                        System.out.println("✅ Record Added Successfully!");
                        break;

                    case 2:
                        System.out.println("\n--- All Records ---");
                        for (Document d : collection.find()) {
                            System.out.println(d.toJson());
                        }
                        break;

                    case 3:
                        System.out.print("Enter Roll No to update: ");
                        int rollToUpdate = sc.nextInt();
                        System.out.print("Enter new Marks: ");
                        int newMarks = sc.nextInt();
                        collection.updateOne(
                                new Document("rollno", rollToUpdate),
                                new Document("$set", new Document("marks", newMarks)));
                        System.out.println("✅ Record Updated Successfully!");
                        break;

                    case 4:
                        System.out.print("Enter Roll No to delete: ");
                        int rollToDelete = sc.nextInt();
                        collection.deleteOne(new Document("rollno", rollToDelete));
                        System.out.println("🗑️ Record Deleted Successfully!");
                        break;

                    case 5:
                        System.out.println("👋 Exiting Program...");
                        break;

                    default:
                        System.out.println("❌ Invalid choice!");
                }

            } while (choice != 5);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
