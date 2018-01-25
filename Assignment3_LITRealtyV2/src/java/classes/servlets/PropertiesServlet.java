/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import classes.db.PropertiesDB;
import classes.entities.Properties;
import classes.entities.Styles;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gatez1511
 */
public class PropertiesServlet extends HttpServlet {

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
         String page;
            try {
                if(request.getParameter("singleView") != null){
                    Properties property = PropertiesDB.getPropertyByID(Integer.parseInt(request.getParameter("singleView")));
                    if (property == null) {
                        address = "/error.jsp";
                        page = "Error!!";
                        request.setAttribute("page", page);
                    } else {

                        List<Properties> recommenedList = PropertiesDB.getRecommendedProperties();
                        String abso = getServletContext().getRealPath("/images/properties/large/" + property.getPhoto()+"/");
                        File b = new File(abso);
                        String[] imageList = b.list();

                        address = "/property_detail.jsp";
                        page = property.getStreet(); 
                        request.setAttribute("page", page);
                        request.setAttribute("property", property);
                        request.setAttribute("imageList", imageList);
                        request.setAttribute("recommened", recommenedList);
                    }
                }else
                {
                    List<Properties> allPropList = PropertiesDB.getAllPropertiesOrdered();
                    List<Properties> recommenedList = PropertiesDB.getRecommendedProperties();

                    if ( allPropList.isEmpty()) {
                        address = "/error.jsp";
                        page = "Error!!";
                        request.setAttribute("page", page);
                    } else {
                        SortedSet cities = new TreeSet();
                        SortedSet styles = new TreeSet();
                        SortedSet beds = new TreeSet();
                        
                        
                        for(final Properties property : allPropList){
                            String city = property.getCity();
                            Styles styletype = property.getStyleId();
                            String style = styletype.getPStyle();
                            Integer bed = property.getBedrooms();
                            cities.add(city);
                            styles.add(style);
                            beds.add(bed);
                            
                        }
                        
                        address = "/allProperties.jsp";
                        page = "All Listings";
                        request.setAttribute("page", page);
                        request.setAttribute("cities", cities);
                        request.setAttribute("styles", styles);
                        request.setAttribute("beds", beds);
                        request.setAttribute("returnPropList", allPropList);
                        request.setAttribute("recommened", recommenedList);

                    }
                }
            }//end try
            catch (Exception ex) {
                 address = "/error.jsp";
                 page = "Error!!";
                request.setAttribute("page", page);
                String message = MessageFormat.format("Error message: {0} ", ex);
                request.setAttribute("message", message);
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
