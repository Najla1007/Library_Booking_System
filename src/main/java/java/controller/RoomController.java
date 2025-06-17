package java.controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.roomModule.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author irfah
 */
public class RoomController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RoomController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RoomController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        RoomDAO dao = new RoomDAO();

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("roomID"));
            Room room = dao.getRoomById(id);
            request.setAttribute("room", room);
            request.getRequestDispatcher("roomForm.jsp").forward(request, response);
            return; 
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("roomID"));
            dao.deleteRoom(id);
            response.sendRedirect("RoomController"); // reload list after delete
            return; 
        }

        //show list
        List<Room> roomList = dao.getAllRooms();
        request.setAttribute("roomList", roomList);
        request.getRequestDispatcher("roomList.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        RoomDAO dao = new RoomDAO();

        Room room = new Room();
        room.setRoomName(request.getParameter("roomName"));
        room.setRoomCapa(Integer.parseInt(request.getParameter("roomCapa")));
        room.setRoomStatus(request.getParameter("roomStatus"));
        room.setRoomDesc(request.getParameter("roomDesc"));

        if ("add".equals(action)) {
            dao.addRoom(room);
        } else if ("update".equals(action)) {
            room.setRoomID(Integer.parseInt(request.getParameter("roomID")));
            dao.updateRoom(room);
        }

        response.sendRedirect("RoomController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
