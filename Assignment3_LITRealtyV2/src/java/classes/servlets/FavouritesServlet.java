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
import java.text.MessageFormat;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gatez1511
 */
public class FavouritesServlet extends HttpServlet {

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
         String message, cookieSuccess;
         List<Properties> favList = new LinkedList<>();
            try {
                List<Properties> allPropList = PropertiesDB.getAllPropertiesOrdered();
                
                if(request.getParameter("propID") != null){
                    Properties property = PropertiesDB.getPropertyByID(Integer.parseInt(request.getParameter("propID")));
                    String propId = String.valueOf(property.getId());
                    
                    Cookie[] cookies = request.getCookies();
                    boolean foundCookie = false;
                    
                    for (Cookie cookie1 : cookies) {
                        if (cookie1.getName().equals(propId)) {
                            foundCookie = true;
                            cookieSuccess = "This Property has been added to your favourites";
                            request.setAttribute("cookieSuccess", cookieSuccess);
                        }
                    }
                    if (!foundCookie) {
                        Cookie cookie1 = new Cookie(propId, String.valueOf(property.getListingNum()));
                        cookie1.setMaxAge(31557600);
                        response.addCookie(cookie1); 
                        cookieSuccess = "This Property has been added to your favourites";
                        request.setAttribute("cookieSuccess", cookieSuccess);
                    }

                    String abso = getServletContext().getRealPath("/images/properties/large/" + property.getPhoto()+"/");
                    File b = new File(abso);
                    String[] imageList = b.list();
                    String id = String.valueOf(property.getId());

                    address = "PropertiesServlet?singleView=" + id;
                    
                    page = property.getStreet(); 
                    request.setAttribute("page", page);
                    request.setAttribute("property", property);
                    request.setAttribute("imageList", imageList);
                    
                    
                }else if(request.getParameter("delete") != null){
                    
                    List<Properties> recommenedList = PropertiesDB.getRecommendedProperties();
                    
                    String id = request.getParameter("delete");
                    //Get an array of Cookies associated with this domain
                    Cookie[] cookies = request.getCookies();
                    
                    if (cookies != null){
                        for (Cookie cookie1 : cookies) {
                            if(cookie1.getName().equals(id)){
                                cookie1.setMaxAge(0);
                                response.addCookie(cookie1);
                            } 
                        }
                    }
                      Cookie[] newCookies = request.getCookies();
                      
                      if(newCookies != null){
                          for(Cookie cooki : newCookies){   
                          for(Properties prop : allPropList){
                             if(String.valueOf(prop.getId()).equals(cooki.getName())){
                                 favList.add(prop);
                             } 
                          }
                       }
                      }
                    address = "/favourites.jsp";
                    page = "Lsit of Favourites";
                    request.setAttribute("page", page);
                    request.setAttribute("favs", favList);
                    request.setAttribute("recommened", recommenedList);
            }
                else{
                    
                    List<Properties> recommenedList = PropertiesDB.getRecommendedProperties();
                    
                    Cookie cookie = null;
                    //Get an array of Cookies associated with this domain
                    Cookie[] cookies = request.getCookies();
                    
                    if (cookies != null){
                        for (Cookie cookie1 : cookies) {
                            for(Properties prop : allPropList){
                                if(cookie1.getName().equals(String.valueOf(prop.getId()))){
                                    favList.add(prop);
                                }
                            }
                        }
                  }
                    address = "/favourites.jsp";
                    page = "Lsit of Favourites";
                    request.setAttribute("page", page);
                    request.setAttribute("favs", favList);
                    request.setAttribute("recommened", recommenedList);
                }
            }//end try
            catch (Exception ex) {
                address = "/error.jsp";
                page = "Error!!";
                request.setAttribute("page", page);
                 message = MessageFormat.format("Error message: {0} ", ex);
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
