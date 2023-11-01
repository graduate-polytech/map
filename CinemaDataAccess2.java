package DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CinemaDataAccess2 extends DatabaseConnection {
    public CinemaDataAccess2() {
        List<Cinema2> cinema2List = getAllCinema2Data();
        List<Cinema3> cinema3List = getAllCinema3Data();
        List<Cinema4> cinema4List = getAllCinema4Data();
        List<Cinema5> cinema5List = getAllCinema5Data();
        List<Cinema6> cinema6List = getAllCinema6Data();
        List<Cinema7> cinema7List = getAllCinema7Data();
        List<Cinema8> cinema8List = getAllCinema8Data();
        List<Cinema9> cinema9List = getAllCinema9Data();
    }

    public static void main(String[] args) {
        new CinemaDataAccess2();
    }

    public static CinemaDataAccess2 createInstance() {
        return new CinemaDataAccess2();
    }

    public List<Cinema2> getAllCinema2Data() {
        List<Cinema2> cinema2List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema2 cinema2 = new Cinema2(resultSet.getString("name"));
                cinema2List.add(cinema2);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema2List;
    }

    public List<Cinema3> getAllCinema3Data() {
        List<Cinema3> cinema3List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema3 cinema3 = new Cinema3(resultSet.getString("Area_1"));
                cinema3List.add(cinema3);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema3List;
    }
    
    public List<Cinema4> getAllCinema4Data() {
        List<Cinema4> cinema4List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema4 cinema4 = new Cinema4(resultSet.getString("Area_2"));
                cinema4List.add(cinema4);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema4List;
    }
    
    public List<Cinema5> getAllCinema5Data() {
        List<Cinema5> cinema5List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema5 cinema5 = new Cinema5(resultSet.getFloat("location_x"));
                cinema5List.add(cinema5);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema5List;
    }
    
    public List<Cinema6> getAllCinema6Data() {
        List<Cinema6> cinema6List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema6 cinema6 = new Cinema6(resultSet.getFloat("location_y"));
                cinema6List.add(cinema6);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema6List;
    }
    
    public List<Cinema7> getAllCinema7Data() {
        List<Cinema7> cinema7List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema7 cinema7 = new Cinema7(resultSet.getString("address"));
                cinema7List.add(cinema7);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema7List;
    }
    
    public List<Cinema8> getAllCinema8Data() {
        List<Cinema8> cinema8List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema8 cinema8 = new Cinema8(resultSet.getString("tel"));
                cinema8List.add(cinema8);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema8List;
    }
    
    public List<Cinema9> getAllCinema9Data() {
        List<Cinema9> cinema9List = new ArrayList<>();
        Connection connection = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM cinema ORDER BY name ASC"; // Replace with the actual table name
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Cinema9 cinema9 = new Cinema9(resultSet.getString("wep"));
                cinema9List.add(cinema9);
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(connection);
        }
        return cinema9List;
    }
}
