<%-- 
    Document   : adminLogin
    Created on : 12 Jun 2025, 4:56:53 PM
    Author     : ahnur
--%>

<html>
    <head>
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Admin Login</h2>
        <form action="AdminLoginServlet" method="post">
            Email: <input type="text" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>

        <p style="color:red;">
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
        </p>
    </body>
</html>

