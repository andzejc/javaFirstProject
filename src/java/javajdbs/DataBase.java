package javajdbs;

import com.person.Person;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataBase {

    public static List<Person> client = new ArrayList();

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<Person> showDB() throws SQLException {
        List<Person> list = new ArrayList();

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("select * from persons;")) {
            while (rs.next()) {
                Person person;
                person = new Person(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getBigDecimal(5));
                list.add(person);
            }
            rs.close();
            st.close();
            conn.close();
        }
        return list;
    }

    public static void addDB(String name, String surname, String data, String salary) throws SQLException {
        Integer intSalary = Integer.parseInt(salary);
        name = "'" + name + "'";
        surname = "'" + surname + "'";
        data = "'" + data + "'";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                Statement st = conn.createStatement()) {
            st.execute("insert into persons (first_name, last_name, birtch_date, salary) values (" + name + "," + surname + "," + data + "," + intSalary + ");");
            st.close();
            conn.close();
        }
    }

    public static void deletePerson(Integer id) throws SQLException {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                Statement st = conn.createStatement()) {
            st.execute("delete from persons where id = " + id + ";");
            st.close();
            conn.close();
        }
    }

    public static void editPerson(Integer id, String name, String surname, String data, String salary) throws SQLException {
        name = "'" + name + "'";
        surname = "'" + surname + "'";
        data = "'" + data + "'";
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                Statement st = conn.createStatement()) {
            st.execute("update persons set first_name=" + name + ", last_name=" + surname + ", birtch_date=" + data + ", salary=" + salary + " where id=" + id + ";");
            st.close();
            conn.close();
        }
    }

    public static List<Person> findUser(Integer idUser) throws SQLException {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM my_data_base.persons where id=?")) {
                ps.setInt(1, idUser);
                ResultSet rs = ps.executeQuery();
//                Statement st = conn.createStatement();
//                ResultSet rs = st.executeQuery("SELECT * FROM my_data_base.persons where id=\" " + idUser + " \";");
            while (rs.next()) {
                Person person;
                person = new Person(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getBigDecimal(5));

                if (rs.getInt(1) > 0) {
                    client.add(person);
                    if (client.size() > 1) {
                        client.remove(0);
                    }
                } else {
                    client.clear();
                }
            }
        }
        return client;
    }
        public static void addAddressById() throws SQLException {
       

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data_base?serverTimezone=UTC", "root", "root");
                 PreparedStatement ps = conn.prepareStatement("INSERT INTO my_data_base.addresses (person_id, address, city, postal_code) VALUES ('41', 'misko g. 9', 'Vilnius', 'LT14888');")) {
//           ResultSet rs = ps.executeQuery();
            System.out.println("test from database");
//            rs.close();
            ps.close();
            conn.close();
        }
    }
}
