/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class updateProfileAccountServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");
            String password = (String) session.getAttribute("password");
            String fullname= request.getParameter("txtfullnameupdate");
            String phone= request.getParameter("txtphoneupdate");
            Account acc = AccountDAO.getAccount(email, password);
            String thongbao = "Update successfully!!";
            String thongbao2 = "Update Error!!";
            if(phone.isEmpty() && fullname.isEmpty()){
                request.setAttribute("report", thongbao2);
                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
            }
            else if(phone.isEmpty() || phone==null){
                request.setAttribute("report", thongbao);
                AccountDAO.updateProfileAccount(email, fullname, acc.getPhone());
                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
            }
            else if (phone.length() == 10) {
                if(fullname.isEmpty() || fullname==null){
                    request.setAttribute("report", thongbao);
                    AccountDAO.updateProfileAccount(email, acc.getFullname(), phone);
                    request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                }       
                else {
                    request.setAttribute("report", thongbao);
                    AccountDAO.updateProfileAccount(email, fullname, phone);
                    request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
                }
            }
            else {
                request.setAttribute("report", thongbao2);
                request.getRequestDispatcher("changeProfile.jsp").forward(request, response);
            }
            
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
