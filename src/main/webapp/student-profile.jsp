<%-- 
    Document   : student-profile
    Created on : 12 Jun 2025, 2:40:24 PM
    Author     : ahnur
--%>

<%@page import="java.model.Student"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
    <head>
        <title>Student Profile</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            div {
                max-width: 400px;
                margin: auto;
                background-color: #eb82ba;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <div>
            <h2>Welcome, <%= student.getName()%></h2><br>
            <p>Email: <%= student.getEmail()%></p>
            <p>Phone: <%= student.getPhone()%></p>
            <p>Faculty: <%= student.getFaculty()%></p>
            <p>Course: <%= student.getCourse()%></p>
        </div>
        <a href="StudentRoomController">Want to book?</a>
    </body>
</html>

