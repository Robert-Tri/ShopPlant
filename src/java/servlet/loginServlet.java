/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.AccountDAO;
import dto.Account;

/**
 *
 * @author ADMIN
 */
public class loginServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");

            Account acc = null;
            try {
                if (email == null || email.equals("") || password == null || password.equals("")) {
                    response.sendRedirect("checkloi.html");
                } else {
                    acc = AccountDAO.getAccount(email, password);
                    
                        if (acc != null) {
                            if (acc.getStatus() == 1) {
                                //admin
                                if (acc.getRole().trim().equals("AD")) {
                                    //chuyen qua admin home page
                                    HttpSession session = request.getSession(true);
                                    if (session != null) {
                                        session.setAttribute("name", acc.getFullname());
                                        session.setAttribute("email", email);
                                        session.setAttribute("password", password);
                                        session.setAttribute("role", acc.getRole());
                                        //create a cookie and attach it to reponse abject

                                        response.sendRedirect("adminPage.jsp");
                                    }
                                } //user
                                else if (acc.getRole().trim().equals("US")) {
                                    //cuyen qua welcome page
                                    //response.sendRedirect("welcome.html");
                                    HttpSession session = request.getSession(true);
                                    if (session != null) {
                                        session.setAttribute("name", acc.getFullname());
                                        session.setAttribute("email", email);
                                        session.setAttribute("password", password);
                                        session.setAttribute("role", acc.getRole());
                                        //create a cookie and attach it to reponse abject

                                        response.sendRedirect("userPage.jsp");
                                    }
                                }
                            } else {
                                request.setAttribute("report", "The account has been blocked!!");
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                        } else {
                            request.setAttribute("report", "Wrong Account!!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }

                }
            } catch (Exception e) {
                e.printStackTrace();
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
