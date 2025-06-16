<%-- 
    Document   : student-form
    Created on : 12 Jun 2025, 2:38:59 PM
    Author     : ahnur
--%>

<%@page import="dao.StudentDAO"%>
<%@page import="util.DBUtil"%>
<%@page import="model.Student"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Student student = new Student();
    if (request.getParameter("id") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = DBUtil.getConnection();
        StudentDAO dao = new StudentDAO(conn);
        student = dao.getStudentById(id);
    }
%>
<html>
    <head>
        <title>Student Form</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Student Form</h2>
        <form method="post" action="<%= student.getStudentId() == 0 ? "AddStudentServlet" : "EditStudentServlet"%>">
            <input type="hidden" name="studentId" value="<%= student.getStudentId()%>">
            Name: <input type="text" name="name" value="<%= student.getName()%>" required><br>
            Email: <input type="email" name="email" value="<%= student.getEmail()%>" required><br>
            Phone: <input type="text" name="phone" value="<%= student.getPhone()%>" required><br>
            Password: <input type="password" name="password" value="<%= student.getPassword()%>" required><br>
            Faculty: <input type="text" name="faculty" value="<%= student.getFaculty()%>" required><br>
            Course: <input type="text" name="course" value="<%= student.getCourse()%>" required><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
