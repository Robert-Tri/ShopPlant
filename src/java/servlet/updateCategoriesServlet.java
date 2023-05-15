/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.CategoriesDAO;
import dto.Categories;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class updateCategoriesServlet extends HttpServlet {

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
            int cateid = Integer.parseInt(request.getParameter("cateid"));
            String cateName= request.getParameter("txtnameCategories");
            Categories cate = CategoriesDAO.getCategories(cateid);
            String report1 = "Trùng !!";
            String report2 = "Update Finished !!";
            String report3 = "Trống !!";
            
            if(cateName.isEmpty() || cateName==null){
                request.setAttribute("report", report3);
                request.getRequestDispatcher("updateCategoriesByAdmin.jsp").forward(request, response);
            }                  
            else {
                int check = CategoriesDAO.getCateIDByName(cateName);
                
                if (check > 0) {
                    request.setAttribute("report", report1);
                    request.getRequestDispatcher("updateCategoriesByAdmin.jsp").forward(request, response);
                } else {
                    CategoriesDAO.updateCategories(cateid, cateName);
                    request.setAttribute("report", report2);
                    request.getRequestDispatcher("updateCategoriesByAdmin.jsp").forward(request, response);
                }
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
