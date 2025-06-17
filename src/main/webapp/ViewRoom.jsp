<%-- 
    Document   : ViewRoom
    Created on : 12 Jun 2025, 10:43:20 PM
    Author     : ahnur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.roomModule.Room" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Available Rooms</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <%
            List<java.roomModule.Room> roomList = (List<java.roomModule.Room>) request.getAttribute("roomList");

            if (roomList == null) {
                out.println("<p style='text-align:center; color:red;'>No room data available. Please contact admin.</p>");
            } else {
        %>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Available Rooms</h2>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Capacity</th>
                <th>Status</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            <%
                for (Room room : roomList) {
                    if (!"available".equalsIgnoreCase(room.getRoomStatus()))
                        continue;
            %>
            <tr>
                <td><%= room.getRoomID()%></td>
                <td><%= room.getRoomName()%></td>
                <td><%= room.getRoomCapa()%></td>
                <td><%= room.getRoomStatus()%></td>
                <td><%= room.getRoomDesc()%></td>
                <td><a href="booking.jsp">Booking</a>
            </tr>
            <%
                }
            %>
        </table>

        <%
            }
        %>

    </body>
</html>