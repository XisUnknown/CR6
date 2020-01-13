package sample;

import javafx.beans.property.ReadOnlyStringWrapper;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.control.*;

import java.sql.*;

public class Controller {
    @FXML private TableView teachers;
    @FXML private TableView classes;
    @FXML private TextField name;
    @FXML private TextField surname;
    @FXML private TextField email;
    @FXML private TextField idText;
    ResultSet resultset = null;
    Connection con;
    Statement stmt;
    TableColumn<String, String> teachersCol = new TableColumn<String, String>("Teachers");
    TableColumn<String, String> classesCol = new TableColumn<String, String>("Classes");
    ObservableList teachersList = FXCollections.observableArrayList();
    ObservableList classesList = FXCollections.observableArrayList();
    String buff;
    String buff2;
    @FXML
    public void initialize() throws SQLException {
        classes.getColumns().add(classesCol);
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Europe/Berlin", "root","");
        stmt = con.createStatement();
        resultset = stmt.executeQuery("SELECT name,surname FROM teacher WHERE 1");
        teachers.getColumns().add(teachersCol);
        teachersCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()));
        while (resultset.next()) {
            buff = resultset.getString("surname")+", "+resultset.getString("name");
            System.out.println(buff);
            teachersList.add(buff);
        }
        teachers.getItems().clear();
        teachers.setItems(teachersList);
    }

    public void teacherSelect() throws SQLException {
        classes.getItems().clear();
        classes.refresh();
        String selectedItem = teachers.getSelectionModel().getSelectedItem().toString();
        String nameSplit[] = selectedItem.split(", ");
        stmt = con.createStatement();
        ResultSet rs;
        rs = stmt.executeQuery("SELECT teacherID,name,surname,email FROM teacher WHERE name LIKE ('"+nameSplit[1]+"') AND surname LIKE ('"+nameSplit[0]+"')");
        while (rs.next()) {

            name.setText(rs.getString("name"));
            surname.setText(rs.getString("surname"));
            email.setText(rs.getString("email"));
            idText.setText(rs.getString("teacherID"));
            System.out.println(rs.getString("teacherID"));
        }
        rs = stmt.executeQuery("SELECT c.class FROM teacher t INNER JOIN teacherclass tc ON t.teacherID = tc.teacherID INNER JOIN class c ON c.classID=tc.classID WHERE name LIKE ('"+nameSplit[1]+"') AND surname LIKE ('"+nameSplit[0]+"')");
        classesCol.setCellValueFactory(param -> new ReadOnlyStringWrapper(param.getValue()));
        while (rs.next()) {
            buff = rs.getString("c.class");
            System.out.println(buff);
            classesList.add(buff);
        }
        classes.setItems(classesList);
        classes.refresh();
    }
}
