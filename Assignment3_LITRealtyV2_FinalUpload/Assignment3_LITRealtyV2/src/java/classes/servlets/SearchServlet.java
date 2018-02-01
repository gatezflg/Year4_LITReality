/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import classes.db.PropertiesDB;
import classes.entities.Properties;
import classes.entities.Styles;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
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
public class SearchServlet extends HttpServlet {

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
        
         String address, page, location, sqFoot, style, price;
         Integer beds = null;
         
        SortedSet allCities = new TreeSet();
        SortedSet allStyles = new TreeSet();
        SortedSet allBeds = new TreeSet();
        SortedSet searchCriteria = new TreeSet();
        
        List<Properties> filteredList = new LinkedList<>();
        List<Properties> finalList = new LinkedList<>();
                        
 
            try {
                location = request.getParameter("location");
                price = request.getParameter("price");
                String bed = request.getParameter("beds");
                if(bed != null){
                    beds = Integer.parseInt(bed);
                }
                sqFoot = request.getParameter("size");
                style = request.getParameter("type");
                List<Properties> allPropList = PropertiesDB.getAllPropertiesOrdered();
                
                if(allPropList.isEmpty()){
                    address = "/error.jsp";
                    page = "Error!!";
                    request.setAttribute("page", page);
                    
                }else{
                    
                    for (Properties prop : allPropList) {
                        
                            String city = prop.getCity();
                            allCities.add(city);
                            String thisStyle = prop.getStyleId().getPStyle();
                            allStyles.add(thisStyle);
                            Integer thisBed = prop.getBedrooms();
                            allBeds.add(thisBed);
                        if(location == null || prop.getCity().equals(location)){
                            if(location != null){ searchCriteria.add("Location");}
                            
                            if(beds == null || prop.getBedrooms().equals(beds)){
                                if(beds != null){ searchCriteria.add("Bedrooms");}
                                
                                if(style == null || thisStyle.equals(style)){
                                    if(style != null){ searchCriteria.add("Style");}

                                    if(sqFoot != null){
                                        searchCriteria.add("Square Foot");
                                    switch(sqFoot){
                                    case "1":
                                        if(prop.getSquarefeet() < 1000){
                                            filteredList.add(prop);
                                        }
                                        break;
                                    case "2":
                                          if(prop.getSquarefeet() >= 1000 && prop.getSquarefeet() <= 1500){
                                            filteredList.add(prop);
                                        }
                                        break;
                                    case "3":
                                          if(prop.getSquarefeet() >= 1500 && prop.getSquarefeet() <= 2000){
                                            filteredList.add(prop);
                                        }
                                        break;
                                    case "4":
                                         if(prop.getSquarefeet() > 2000){
                                            filteredList.add(prop);
                                        }
                                        break;
                                    }
                                }else{
                                        filteredList.add(prop);
                                    }
                                }
                            }
                        }  
                    }
                    if(!filteredList.isEmpty())
                    {
                        for (Properties finalProp : filteredList)
                        {
                            if(price != null){
                                searchCriteria.add("Price");
                              switch(price){
                                        case "1":
                                            if(finalProp.getPrice() < 150000.00){
                                                finalList.add(finalProp);
                                            }
                                            break;
                                        case "2":
                                          if(finalProp.getPrice() <= 200000.00 && finalProp.getPrice() >= 150000.00){
                                                finalList.add(finalProp);
                                            }
                                            break;
                                        case "3":
                                               if(finalProp.getPrice() <= 250000.00 && finalProp.getPrice() >= 200000.000){
                                                finalList.add(finalProp);
                                            }
                                            break;
                                        case "4":
                                              if(finalProp.getPrice() <= 300000.00 && finalProp.getPrice() >= 250000.000){
                                                finalList.add(finalProp);
                                            }
                                            break;
                                        case "5":
                                            if(finalProp.getPrice() >= 350000.00){
                                                finalList.add(finalProp);
                                            }
                                            break;
                                    }
                            }else{
                                 finalList.add(finalProp);
                            }
                            
                        }
                        
                    }    
                    address = "/allProperties.jsp";
                }// End else
                        if(searchCriteria.isEmpty()){
                            page = "All Listings";
                        }else{
                            page = "Search Results";
                        }
                        request.setAttribute("page", page);
                        request.setAttribute("cities", allCities);
                        request.setAttribute("styles", allStyles);
                        request.setAttribute("beds", allBeds);
                        request.setAttribute("returnPropList", finalList);
                        request.setAttribute("searchCriteria", searchCriteria);
               
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
