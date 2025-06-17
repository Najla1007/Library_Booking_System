<%-- 
    Document   : roomForm
    Created on : 11 Jun 2025, 6:10:20 PM
    Author     : irfah
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.roomModule.Room" %>
<%
    Room room = (Room) request.getAttribute("room");
%>
<html>
    <head>
        <title>Room Form</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
        <h2><%= (room != null) ? "Edit" : "Add"%> Room</h2>

        <form action="RoomController" method="post">
            <input type="hidden" name="action" value="<%= (room != null) ? "update" : "add"%>" />
            <input type="hidden" name="roomID" value="<%= (room != null) ? room.getRoomID() : ""%>" />

            Room Name: <input type="text" name="roomName" value="<%= (room != null) ? room.getRoomName() : ""%>" /><br/><br/>
            Capacity: <input type="number" name="roomCapa" value="<%= (room != null) ? room.getRoomCapa() : ""%>" /><br/><br/>

            Status:
            <select name="roomStatus">
                <option value="available" <%= (room != null && "available".equals(room.getRoomStatus())) ? "selected" : ""%>>Available</option>
                <option value="booked" <%= (room != null && "booked".equals(room.getRoomStatus())) ? "selected" : ""%>>Booked</option>
                <option value="under maintenance" <%= (room != null && "under maintenance".equals(room.getRoomStatus())) ? "selected" : ""%>>Under Maintenance</option>
            </select><br/><br/>

            Description: <input type="text" name="roomDesc" value="<%= (room != null) ? room.getRoomDesc() : ""%>" /><br/><br/>

            <input type="submit" value="<%= (room != null) ? "Update" : "Add"%> Room" />
        </form>

        <br/>
        <a href="roomList.jsp">Back to Room List</a>
    </body>
</html>

