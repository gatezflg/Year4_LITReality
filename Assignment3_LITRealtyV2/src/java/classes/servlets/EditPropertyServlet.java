/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import classes.db.AgentsDB;
import classes.db.GarageTypesDB;
import classes.db.PropertiesDB;
import classes.db.PropertyStatusDB;
import classes.db.PropertyTypesDB;
import classes.db.StylesDB;
import classes.db.VendorDB;
import classes.entities.Agents;
import classes.entities.Garagetypes;
import classes.entities.Properties;
import classes.entities.Propertystatus;
import classes.entities.Propertytypes;
import classes.entities.Styles;
import classes.entities.Vendors;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gatez1511
 */
public class EditPropertyServlet extends HttpServlet {

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

        String address, page, title;
        List<String> berRatingsList = Arrays.asList("A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3", "D1", "D2", "E1", "E2", "F", "G", "Exempt");

        try {
            HttpSession sess = request.getSession();
            Agents a = (Agents) sess.getAttribute("agent");

            List<Vendors> vendorList = VendorDB.getAllVendors();
            List<Properties> allPropList = PropertiesDB.getAllPropertiesOrdered();
            List<Properties> agentProperties = new ArrayList<>();
            List<Agents> allAgents = AgentsDB.getAllAgents();

            for (Properties p : allPropList) {
                if (p.getAgentId().equals(a)) {
                    agentProperties.add(p);
                }
            }

            if (request.getParameter("edit") != null) {

                Properties editProp = PropertiesDB.getPropertyByID(Integer.parseInt(request.getParameter("edit")));

                if (editProp == null) {
                    address = "/agents/agentErrors.jsp";
                    page = "Error!!";
                } else {

                    List<Styles> styles = new ArrayList<>();
                    List<Propertytypes> propertyType = new ArrayList<>();
                    List<Garagetypes> garageType = new ArrayList<>();
                    List<Propertystatus> propertyStatus = new ArrayList<>();

                    styles = StylesDB.getAllStyles();
                    garageType = GarageTypesDB.getAllGaragetypes();
                    propertyType = PropertyTypesDB.getAllPropertytypes();
                    propertyStatus = PropertyStatusDB.getAllPropertystatus();

                    String abso = getServletContext().getRealPath("/images/properties/large/" + editProp.getPhoto() + "/");
                    File b = new File(abso);
                    String[] imageList = b.list();

                    page = "Update Property";
                    title = "Updating: " + editProp.getStreet();
                    address = "/agents/editPropertyPage.jsp";
                    request.setAttribute("agent", a);
                    request.setAttribute("vendorList", vendorList);
                    request.setAttribute("allProps", allPropList);
                    request.setAttribute("agentProps", agentProperties);
                    request.setAttribute("page", page);
                    request.setAttribute("title", title);
                    request.setAttribute("editProp", editProp);
                    request.setAttribute("styles", styles);
                    request.setAttribute("propertyType", propertyType);
                    request.setAttribute("garageType", garageType);
                    request.setAttribute("propertyStatus", propertyStatus);
                    request.setAttribute("berRatingsList", berRatingsList);
                    request.setAttribute("allAgents", allAgents);
                    request.setAttribute("imageList", imageList);

                }
            } else {

                List<Styles> styles = new ArrayList<>();
                List<Propertytypes> propertyType = new ArrayList<>();
                List<Garagetypes> garageType = new ArrayList<>();
                List<Propertystatus> propertyStatus = new ArrayList<>();

                styles = StylesDB.getAllStyles();
                garageType = GarageTypesDB.getAllGaragetypes();
                propertyType = PropertyTypesDB.getAllPropertytypes();
                propertyStatus = PropertyStatusDB.getAllPropertystatus();

                page = "Insert Property";
                title = "Adding New Property";
                address = "/agents/addNewProperty.jsp";
                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allProps", allPropList);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("styles", styles);
                request.setAttribute("propertyType", propertyType);
                request.setAttribute("garageType", garageType);
                request.setAttribute("propertyStatus", propertyStatus);
                request.setAttribute("berRatingsList", berRatingsList);
                request.setAttribute("allAgents", allAgents);
            }

        } catch (Exception ex) {

            address = "/agents/agentErrors.jsp";
            page = "Error!!";
            title = "An error has occured!";
            request.setAttribute("page", page);
            request.setAttribute("title", title);
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
