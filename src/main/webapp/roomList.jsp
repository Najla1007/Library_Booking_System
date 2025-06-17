<%-- 
    Document   : roomList
    Created on : 11 Jun 2025, 6:16:21 PM
    Author     : irfah
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.roomModule.RoomDAO, java.roomModule.Room" %>
<html>
    <head>
        <title>Room Management</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2>Room List</h2>

        <a href="roomForm.jsp">Add New Room</a><br/><br/>

        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Capacity</th>
                <th>Status</th>
                <th>Description</th>
                <th>Update</th>
            </tr>

            <%
                List<Room> roomList = (List<Room>) request.getAttribute("roomList");
                if (roomList != null && !roomList.isEmpty()) {
                    for (Room room : roomList) {
            %>
            <tr>
                <td><%= room.getRoomID()%></td>
                <td><%= room.getRoomName()%></td>
                <td><%= room.getRoomCapa()%></td>
                <td><%= room.getRoomStatus()%></td>
                <td><%= room.getRoomDesc()%></td>
                <td>
                    <a href="RoomController?action=edit&roomID=<%= room.getRoomID()%>">Edit</a> |
                    <a href="RoomController?action=delete&roomID=<%= room.getRoomID()%>" onclick="return confirm('Delete this room?')">Delete</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6">No rooms available.</td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>




