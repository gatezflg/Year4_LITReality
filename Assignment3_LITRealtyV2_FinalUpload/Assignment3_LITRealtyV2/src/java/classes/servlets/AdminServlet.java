/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import classes.db.AgentsDB;
import classes.db.PropertiesDB;
import classes.db.VendorDB;
import classes.entities.Agents;
import classes.entities.Properties;
import classes.entities.Vendors;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
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
public class AdminServlet extends HttpServlet {

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

        String address = "/agents/agentErrors.jsp";
        String page, title;

        try {

            HttpSession sess = request.getSession();
            Agents a = (Agents) sess.getAttribute("agent");

            List<Vendors> vendorList = VendorDB.getAllVendors();
            List<Properties> props = PropertiesDB.getAllProperties();
            List<Agents> allAgentsList = AgentsDB.getAllAgents();

            List<Properties> agentProperties = new ArrayList<>();

            for (Properties p : props) {

                if (p.getAgentId().equals(a)) {
                    agentProperties.add(p);
                }
            }
            if (request.getParameter("Report") != null) {

                address = "/agents/adminReports.jsp";
                title = "LIT Reality Reports";
                sess.setAttribute("agent", a);
                request.setAttribute("agent", a);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("title", title);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allAgentsList", allAgentsList);

            } else if (request.getParameter("add") != null) {

                String addingAgent = request.getParameter("add");
                page = "Agents";
                title = "LITRealty Agents";
                address = "/agents/agentsPage.jsp";
                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("addingAgent", addingAgent);
                request.setAttribute("allAgentsList", allAgentsList);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("allAgents", allAgentsList);

            } else if (request.getParameter("edit") != null) {

                String editingAgent = request.getParameter("edit");
                Agents editA = AgentsDB.getAgentByID(Integer.parseInt(editingAgent));
                page = "Agents";
                title = "LITRealty Agents";
                address = "/agents/agentsPage.jsp";
                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("editA", editA);
                request.setAttribute("allAgentsList", allAgentsList);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("allAgents", allAgentsList);

            } else if (request.getParameter("DoEdit") != null) {

                String editingAgent = request.getParameter("DoEdit");
                Agents editA = AgentsDB.getAgentByID(Integer.parseInt(editingAgent));
               
                String aNumber = request.getParameter("contactNumber");
                String aFax = request.getParameter("fax");
                String aEmail = request.getParameter("email");
                String aUsername = request.getParameter("username");
                
                editA.setPhone(aNumber);
                editA.setEmail(aEmail);
                editA.setFax(aFax);
                AgentsDB.updateAgent(editA);

                page = "Success!";
                title = "Agent details updated";
                address = "/agents/updateSuccess.jsp";

                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("editA", editA);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("allAgents", allAgentsList);

            } else if (request.getParameter("contactNumber") != null) {

                Agents aNew = new Agents();
                String aName = request.getParameter("name");
                String aNumber = request.getParameter("contactNumber");
                String aFax = request.getParameter("fax");
                String aEmail = request.getParameter("email");
                String aUsername = request.getParameter("username");
                String aPassword = request.getParameter("password");
                aNew.setName(aName);
                aNew.setPhone(aNumber);
                aNew.setEmail(aEmail);
                aNew.setFax(aFax);
                aNew.setUsername(aUsername);
                aNew.setPassword(aPassword);
                AgentsDB.insertAgent(aNew);

                page = "Success!";
                title = "Agent inserted";
                address = "/agents/updateSuccess.jsp";

                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("newAgent", aNew);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("allAgents", allAgentsList);

            } else if (request.getParameter("agentId") != null) {

                String aID = request.getParameter("agentId");
                Agents selectedAgent = AgentsDB.getAgentByID(Integer.parseInt(aID));

                List<Properties> propsThisAgent = new ArrayList<>();
                for (Properties p : props) {
                    if (p.getAgentId().equals(selectedAgent)) {
                        propsThisAgent.add(p);
                    }
                }

                page = "Agents";
                title = "LITRealty Agents";
                address = "/agents/agentsPage.jsp";
                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("selectedAgent", selectedAgent);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("propsThisAgent", propsThisAgent);
                request.setAttribute("allAgentsList", allAgentsList);
                request.setAttribute("page", page);
                request.setAttribute("title", title);

            } else if (request.getParameter("all") != null) {

                page = "Agents";
                title = "LITRealty Agents";
                address = "/agents/agentsPage.jsp";
                request.setAttribute("agent", a);
                request.setAttribute("vendorList", vendorList);
                request.setAttribute("allAgentsList", allAgentsList);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("page", page);
                request.setAttribute("title", title);
                request.setAttribute("allAgentsList", allAgentsList);
                request.setAttribute("allAgents", allAgentsList);

            }

        } catch (Exception ex) {

            address = "/agents/agentErrors.jsp";
            page = "Error!!";
            title = "An error has occured!";
            request.setAttribute("page", page);
            request.setAttribute("title", title);
            String message = MessageFormat.format("Error message: {0} ", ex);
            request.setAttribute("message", message);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);

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
