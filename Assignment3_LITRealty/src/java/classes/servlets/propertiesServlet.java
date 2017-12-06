/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import classes.db.PropertiesDB;
import classes.entities.Properties;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gatez1511
 */
public class propertiesServlet extends HttpServlet {

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
        
        
         String address;
         String type;
            try {
        
                if(request.getParameter("singleView") != null)
                {
                    Properties property = PropertiesDB.getPropertyByID(Integer.parseInt(request.getParameter("singleView")));
                    if (property == null) {
                        address = "/error.jsp";
                    } else {
                       
                        String abso = getServletContext().getRealPath("/images/properties/large/" + property.getPhoto()+"/");
                        File b = new File(abso);
                        String[] imageList = b.list();

                        address = "singleView.jsp";
                        request.setAttribute("property", property);
                      request.setAttribute("imageList", imageList);
                    }
                }
                else if(request.getParameter("resSingle") != null)
                {
                    List<Properties> list = PropertiesDB.getAllResSingle();
                    if (list.isEmpty()) {
                        address = "/error.jsp";
                    } else {

                        address = "gallery.jsp";
                        type = "Residential-Single";
                        request.setAttribute("propertiesList", list);
                        request.setAttribute("propertiesType", type);
                    }
                }
                else if(request.getParameter("resMulti") != null)
                {
                    List<Properties> list = PropertiesDB.getAllResMulti();
                    if (list.isEmpty()) {
                        address = "/error.jsp";
                    } else {

                        address = "gallery.jsp";
                        type = "Residential-Multi";
                        request.setAttribute("propertiesList", list);
                        request.setAttribute("propertiesType", type);
                    }
                
                }
                else if(request.getParameter("commercial") != null)
                {
                    List<Properties> list = PropertiesDB.getAllCommercial();
                    if (list.isEmpty()) {
                        address = "/error.jsp";
                    } else {

                        address = "gallery.jsp";
                        type = "Commercial";
                        request.setAttribute("propertiesList", list);
                        request.setAttribute("propertiesType", type);
                    }
                
                }
                else
                {
                    List<Properties> list = PropertiesDB.getAllProperties();

                    if (list.isEmpty()) {
                        address = "/error.jsp";
                    } else {

                        address = "gallery.jsp";
                        type = "All Properties";
                        request.setAttribute("propertiesList", list);
                        request.setAttribute("propertiesType", type);
                    }
                }

            }//end try
            catch (Exception ex) {
                address = "/error.jsp";
            }//end catch
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(address);
            dispatcher.include(request, response);
        
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
