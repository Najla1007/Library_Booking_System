package java.dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ahnur
 */
import java.model.Student;
import java.sql.*;
import java.util.*;

public class StudentDAO {

    private Connection conn;

    public StudentDAO(Connection conn) {
        this.conn = conn;
    }

    public void addStudent(Student student) throws SQLException {
        String sql = "INSERT INTO student (name, email, phone, password, faculty, course) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setString(4, student.getPassword());
            stmt.setString(5, student.getFaculty());
            stmt.setString(6, student.getCourse());
            stmt.executeUpdate();
        }
    }

    public void updateStudent(Student student) throws SQLException {
        String sql = "UPDATE student SET name=?, email=?, phone=?, password=?, faculty=?, course=? WHERE studentId=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setString(4, student.getPassword());
            stmt.setString(5, student.getFaculty());
            stmt.setString(6, student.getCourse());
            stmt.setInt(7, student.getStudentId());
            stmt.executeUpdate();
        
        }
    }

    public void deleteStudent(int studentId) throws SQLException {
        String sql = "DELETE FROM student WHERE studentId=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.executeUpdate();
        }
    }

    public Student getStudentByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM student WHERE email=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Student student = new Student();
                    student.setStudentId(rs.getInt("studentId"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setPhone(rs.getString("phone"));
                    student.setPassword(rs.getString("password"));
                    student.setFaculty(rs.getString("faculty"));
                    student.setCourse(rs.getString("course"));
                    return student;
                }
            }
        }
        return null;
    }

    public Student getStudentById(int id) throws SQLException {
        String sql = "SELECT * FROM student WHERE studentId=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Student student = new Student();
                    student.setStudentId(rs.getInt("studentId"));
                    student.setName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setPhone(rs.getString("phone"));
                    student.setPassword(rs.getString("password"));
                    student.setFaculty(rs.getString("faculty"));
                    student.setCourse(rs.getString("course"));
                    return student;
                }
            }
        }
        return null;
        
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM student";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Student student = new Student();
                student.setStudentId(rs.getInt("studentId"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setPassword(rs.getString("password"));
                student.setFaculty(rs.getString("faculty"));
                student.setCourse(rs.getString("course"));
                list.add(student);
            }
        }
        return list;
    }
}
