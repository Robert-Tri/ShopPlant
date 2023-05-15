/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CategoriesDAO;
import dao.PlantDAO;
import dto.Plant;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 17148
 */
public class updatePlantsServlet extends HttpServlet {

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
            int plantid = Integer.parseInt(request.getParameter("plantid"));
            String name= request.getParameter("txtnameupdate").trim();
            String image= request.getParameter("txtimageupdate").trim();
            String price= request.getParameter("txtpriceupdate").trim();
            String categories= request.getParameter("txtcategoriesupdate").trim();
            String description= request.getParameter("txtdescriptionupdate").trim();
            String status= request.getParameter("txtstatussupdate").trim();
            Plant plant = PlantDAO.getPlant(plantid);
            String[] pla = {plant.getName(), plant.getImgpath(), String.valueOf(plant.getPrice()), plant.getCatename(), plant.getDescription(), String.valueOf(plant.getStatus())};
            String[] check = {name,image,price,categories,description,status};
            for (int i = 0; i < check.length; i++) {
                if(check[i] == null || check[i].isEmpty()){
                    check[i] = pla[i];
                }
            }
            String thongbao = "Update successfully!!";
            PlantDAO.updatePlant(plantid, check[0], check[1], Integer.parseInt(check[2]), CategoriesDAO.getCateIDByName(check[3]), check[4], Integer.parseInt(check[5]));
            request.setAttribute("report", thongbao);
            request.getRequestDispatcher("updatePlantsByAdmin.jsp").forward(request, response);

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
