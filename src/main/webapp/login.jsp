<%-- 
    Document   : login
    Created on : 12 Jun 2025, 2:38:01 PM
    Author     : ahnur
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>Student Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Student Login</h2>
        <form method="post" action="LoginServlet">
            Email: <input type="email" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <p style="color:red;"><%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%></p>
    </body>
</html>
