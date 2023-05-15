/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dao.OrderDAO;
import dto.Account;
import dto.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class manageOrdersServlet extends HttpServlet {

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
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            String keyword = request.getParameter("txtsearch");
            
            ArrayList<Order> list = new ArrayList<>();
            ArrayList<Account> listacc = AccountDAO.getAccounts();           
            
            Date datenow = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String date = dateFormat.format(datenow);
            
            if (keyword == null || keyword.isEmpty()) {                
                if ((from == null || from.isEmpty()) && (to == null || to.isEmpty())) {                
                list = OrderDAO.getAllOrders();
                } else if (to == null || to.isEmpty()) {
                    list = OrderDAO.getAllOrdersByDate(from, date);
                } else if (from == null || from.isEmpty()) {
                    list = OrderDAO.getAllOrdersByDate(from, to);
                } else {                
                    list = OrderDAO.getAllOrdersByDate(from, to);
                }
            } else if (keyword != null || !keyword.isEmpty()) {
                list = OrderDAO.getSearchOrders(keyword);
            }
            
            request.setAttribute("ordersList", list);
            request.setAttribute("accountsList", listacc);
            request.getRequestDispatcher("ManageOrders.jsp").forward(request, response);     
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
        processRequest(request, response);
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
        processRequest(request, response);
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
