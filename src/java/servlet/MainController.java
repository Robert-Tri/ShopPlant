/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

    private String url = "errorpage.html";

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
            String action = request.getParameter("action");

            if (action == null || action.equals("")) {
                url = "homePage.jsp";
            } else if (action.equals("login")) {
                url = "loginServlet";
            } else if (action.equals("logout")) {
                url = "logoutServlet";
            } else if (action.equals("search")) {
                url = "homePage.jsp";
            } else if (action.equals("register")) {
                url = "registerServlet";
            } else if(action.equals("update")){
                url = "updateCartServlet";
            } else if(action.equals("delete")){
                url = "deleteCartServlet";
            } else if(action.equals("saveOrder")){
                url = "saveShoppingCartServlet";
            } else if (action.equals("manageAccount")) {
                url ="manageAccountServlet";
            } else if (action.equals("updateStatusAccount")) {
                url = "updateStatusAccountServlet";
            } else if(action.equals("updateStatusOrder")){
                url = "updateStatusOrderServlet";
            } else if (action.equals("managePlants")){
                url ="managePlantsServlet";
            } else if (action.equals("createPlant")){
                url = "createPlants.jsp";
            } else if (action.equals("addPlant")){
                url = "createPlantsServlet";
            } else if (action.equals("updatePlants")){
                url = "updatePlantsServlet";
            } else if(action.equals("updateStatusOrder")){
                url = "updateStatusOrderServlet";
            } else if (action.equals("manageOrder")) {
                url ="manageOrdersServlet";
            } else if (action.equals("addtocart")) {
                url ="AddToCartServlet";
            } else if (action.equals("viewcart")) {
                url ="viewCart.jsp";
            } else if (action.equals("updateProfileAccount")) {
                url ="updateProfileAccountServlet";
            } else if (action.equals("manageCategories")) {
                url ="manageCategoriesServlet";
            } else if (action.equals("updateCategories")) {
                url ="updateCategoriesServlet";
            } else if (action.equals("addCategory")) {
                url ="addCategoryServlet";
            } else if (action.equals("searchAccount")) {
                url ="searchAccountServlet";
            }
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
