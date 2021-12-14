package ua.lviv.iot;

import java.sql.*;

/**
 * Hello world!
 *
 */
public class App {

    public static void main(String[] args) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/post", "root", "123456");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from city");

            while (resultSet.next()) {
                System.out.println(resultSet.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

