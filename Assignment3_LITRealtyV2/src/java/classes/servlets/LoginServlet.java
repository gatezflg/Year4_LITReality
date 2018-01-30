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
import classes.entities.Styles;
import classes.entities.Vendors;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import sun.management.Agent;

/**
 *
 * @author k00201738
 */
@WebServlet(name = "agentLogin", urlPatterns = {"/agentLogin"})
public class LoginServlet extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {

            HttpSession sess = request.getSession();
            if (sess.getAttribute("agent") != null) {

                address = "/agents/agentProfile.jsp";
                Agents a = (Agents) sess.getAttribute("agent");

                List<Properties> props = PropertiesDB.getAllPropertiesOrdered();

                String aName = a.getName();
                List<Properties> agentProperties = new ArrayList<>();
                SortedSet vendorList = new java.util.TreeSet();

                for (Properties p : props) {

                    if (p.getAgentId().equals(a)) {
                        agentProperties.add(p);
                    }
                    Vendors v = p.getVendorId();
                    String vendor = v.getName();
                    vendorList.add(vendor);
                }

                title = "LIT Reality Staff Dashboard";
                sess.setAttribute("agent", a);
                request.setAttribute("agent", a);
                request.setAttribute("allProps", props);
                request.setAttribute("agentProps", agentProperties);
                request.setAttribute("page", "Welcome " + aName);
                request.setAttribute("title", title);
                request.setAttribute("vendorList", vendorList);

            } else if (sess.getAttribute("agent") == null) {

                UsernamePasswordToken toke = new UsernamePasswordToken(username, password);
                org.apache.shiro.subject.Subject currentUser = SecurityUtils.getSubject();

                currentUser.login(toke);

                if (currentUser.isAuthenticated()) {

                    address = "/agents/agentProfile.jsp";
                    Agents a = AgentsDB.getAgentByUsername(username);
                    List<Properties> props = PropertiesDB.getAllPropertiesOrdered();

                    String aName = a.getName();
                    List<Properties> agentProperties = new ArrayList<Properties>();
                    SortedSet vendorList = new java.util.TreeSet();

                    for (Properties p : props) {

                        if (p.getAgentId().equals(a)) {
                            agentProperties.add(p);
                        }
                        Vendors v = p.getVendorId();
                        String vendor = v.getName();
                        vendorList.add(vendor);
                    }

                    title = "LIT Reality Staff Dashboard";
                    sess.setAttribute("agent", a);
                    request.setAttribute("agent", a);
                    request.setAttribute("allProps", props);
                    request.setAttribute("agentProps", agentProperties);
                    request.setAttribute("page", "Welcome " + aName);
                    request.setAttribute("title", title);
                    request.setAttribute("vendorList", vendorList);

                }
            } else {
                address = "login.jsp";
                request.setAttribute("message", "Username or Password do not match!");
                page = "Login To LITRealty";
                request.setAttribute("page", page);
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
