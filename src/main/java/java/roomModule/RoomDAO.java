package java.roomModule;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author irfah
 */ 

import util.DBUtil;
import java.sql.*;
import java.util.*;

public class RoomDAO {

    public void addRoom(Room room) {
        String sql = "INSERT INTO rooms (roomName, roomCapa, roomStatus, roomDesc) VALUES (?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room.getRoomName());
            ps.setInt(2, room.getRoomCapa());
            ps.setString(3, room.getRoomStatus());
            ps.setString(4, room.getRoomDesc());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateRoom(Room room) {
        String sql = "UPDATE rooms SET roomName=?, roomCapa=?, roomStatus=?, roomDesc=? WHERE roomID=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, room.getRoomName());
            ps.setInt(2, room.getRoomCapa());
            ps.setString(3, room.getRoomStatus());
            ps.setString(4, room.getRoomDesc());
            ps.setInt(5, room.getRoomID());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRoom(int roomID) {
        String sql = "DELETE FROM rooms WHERE roomID=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, roomID);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Room getRoomById(int roomID) {
        Room room = null;
        String sql = "SELECT * FROM rooms WHERE roomID=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, roomID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomName(rs.getString("roomName"));
                room.setRoomCapa(rs.getInt("roomCapa"));
                room.setRoomStatus(rs.getString("roomStatus"));
                room.setRoomDesc(rs.getString("roomDesc"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return room;
    }

    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM rooms";
        try (Connection con = DBUtil.getConnection(); 
            Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomName(rs.getString("roomName"));
                room.setRoomCapa(rs.getInt("roomCapa"));
                room.setRoomStatus(rs.getString("roomStatus"));
                room.setRoomDesc(rs.getString("roomDesc"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
}


