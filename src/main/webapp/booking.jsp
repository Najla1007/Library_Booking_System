<%-- 
    Document   : booking
    Created on : 12 Jun 2025, 11:41:41 PM
    Author     : ahnur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <style>
            p {
                width: 99%;
                padding: 8px;
                margin-top: 5px;
                border-radius: 5px;
                border: 1px solid #aaa;
                text-align: center;
                background-color: white;
            }
        </style>
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Book a Study Room</h2>
        <form action="BookingServlet" method="post">
            <input type="hidden" name="action" value="book"/>
            Student Name:<input type="text" name="name"><br>
            Room Name:<input type="text" name="roomName"><br>
            Date: <input type="date" name="bookingDate"><br>
            Time Slot: <input type="text" name="timeSlot"><br>
            <input type="submit" value="Book">
        </form>

        <h2>All Bookings</h2>
        <table border="1">
            <tr><th>ID</th><th>Student</th><th>Room</th><th>Date</th><th>Time</th><th>Action</th></tr>
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_booking", "root", "admin");
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM booking_details");
                            while (rs.next()) {
                    %>
            <tr>
                <td><%= rs.getInt("bookingId")%></td>
                <td><%= rs.getString("name")%></td>
                <td><%= rs.getString("roomName")%></td>
                <td><%= rs.getDate("bookingDate")%></td>
                <td><%= rs.getString("timeSlot")%></td>
                <td>
                    <form action="BookingServlet" method="post">
                        <input type="hidden" name="action" value="cancel">
                        <input type="hidden" name="bookingId" value="<%= rs.getInt("bookingId")%>">
                        <input type="submit" value="Cancel">
                    </form>
                </td>
            </tr>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </table>
    </body>
</html>
