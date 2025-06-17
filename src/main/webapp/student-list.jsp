<%-- 
    Document   : student-list
    Created on : 12 Jun 2025, 2:39:45 PM
    Author     : ahnur
--%>

<%@page import="java.model.Student"%>
<%@page import="java.dao.StudentDAO"%>
<%@page import="util.DBUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Connection conn = DBUtil.getConnection();
    StudentDAO dao = new StudentDAO(conn);
    List<Student> students = dao.getAllStudents();
%>
<html>
    <head>
        <title>Student List</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Student List</h2>
        <a href="student-form.jsp">Add Student</a><br><br>
        <table border="1">
            <tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Action</th></tr>
                    <%
                        for (Student s : students) {
                    %>
            <tr>
                <td><%= s.getStudentId()%></td>
                <td><%= s.getName()%></td>
                <td><%= s.getEmail()%></td>
                <td><%= s.getPhone()%></td>
                <td>
                    <a href="student-form.jsp?id=<%= s.getStudentId()%>">Edit</a> |
                    <a href="DeleteStudentServlet?id=<%= s.getStudentId()%>" onclick="return confirm('Are you sure?')">Delete</a> 
                </td>
            </tr>
            <% }%>
        </table>
        <br><br>
        <a href="RoomController">Room List</a>
    </body>
</html>


