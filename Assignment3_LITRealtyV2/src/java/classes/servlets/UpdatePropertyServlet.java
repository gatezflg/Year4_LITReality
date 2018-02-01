/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.servlets;

import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import classes.db.PropertiesDB;
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
public class UpdatePropertyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String uploadPath;
    private List<String> images = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String address, page, title;
        int propertyId = 0;
        Properties property = null;
        int fileNameNum = 0;

        try {
            propertyId = Integer.parseInt(request.getParameter("propId"));
            property = PropertiesDB.getPropertyByID(propertyId);

            HttpSession sess = request.getSession();
            Agents a = (Agents) sess.getAttribute("agent");

            List<Vendors> vendorList = VendorDB.getAllVendors();
            List<Properties> allPropList = PropertiesDB.getAllPropertiesOrdered();
            List<Properties> agentProperties = new ArrayList<>();

            for (Properties p : allPropList) {
                if (p.getAgentId().equals(a)) {
                    agentProperties.add(p);
                }
            }

            String path = "images/properties/large/%s/";
            String filePath = String.format(path, property.getListingNum());
            String realPath = this.getServletContext().getRealPath(filePath);
            File[] files = new File(realPath).listFiles();
            fileNameNum = files.length;

            String dirPath = this.getServletContext().getRealPath("images/properties/large/" + property.getPhoto() + "/");
            uploadPath = dirPath.replace("\\build", "");
            File dir = new File(uploadPath);

            try {

                MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);
                Part part;

                while ((part = parser.readNextPart()) != null) {
                    if (part.isFile()) {
                        FilePart filePart = (FilePart) part;
                        String name = filePart.getFileName();
                        if (name != null) {
                            if (fileNameNum == 0) {
                                long fileSize = filePart.writeTo(new File(uploadPath, String.valueOf(property.getListingNum()) + ".JPG"));
                            } else {
                                long fileSize = filePart.writeTo(new File(uploadPath, String.valueOf(property.getListingNum()) + "-" + String.valueOf(fileNameNum) + ".JPG"));
                            }
                            fileNameNum++;
                        }
                    } else if (part.isParam()) {
                        ParamPart paramPart = (ParamPart) part;
                        String name = paramPart.getName();
                        String value = paramPart.getStringValue();

                        setPropertyDetails(property, name, value);
                    }
                }

                if (images.size() > 0) {
                    for (String name : images) {
                        File file = new File(uploadPath, name);
                        file.delete();
                    }
                }

                PropertiesDB.updateProperty(property);
            } catch (java.io.IOException ioEx) {
                System.out.println(ioEx);

            }

            page = "Success!";
            title = "Property Updated";
            address = "/agents/updateSuccess.jsp";

            request.setAttribute("agent", a);
            request.setAttribute("vendorList", vendorList);
            request.setAttribute("allProps", allPropList);
            request.setAttribute("agentProps", agentProperties);
            request.setAttribute("page", page);
            request.setAttribute("title", title);

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
        dispatcher.include(request, response);
    }

    protected Properties setPropertyDetails(Properties property, String name, String value) {
        switch (name) {
            case "street":
                property.setStreet(value);
                break;
            case "city":
                property.setCity(value);
                break;
            case "price":
                property.setPrice(Double.parseDouble(value));
                break;
            case "description":
                property.setDescription(value);
                break;
            case "style":
                Styles s = new Styles();
                s.setStyleId(Integer.parseInt(value));
                property.setStyleId(s);
                break;
            case "status":
                Propertystatus ps = new Propertystatus();
                ps.setStatusId(Integer.parseInt(value));
                property.setStatusId(ps);
                break;
            case "type":
                Propertytypes pt = new Propertytypes();
                pt.setTypeId(Integer.parseInt(value));
                property.setTypeId(pt);
                break;
            case "bedrooms":
                property.setBedrooms(Integer.parseInt(value));
                break;
            case "bathrooms":
                property.setBathrooms(Float.parseFloat(value));
                break;
            case "garageType":
                Garagetypes gt = new Garagetypes();
                gt.setGarageId(Integer.parseInt(value));
                property.setGarageId(gt);
                break;
            case "garageSize":
                property.setGaragesize(Short.parseShort(value));
                break;
            case "squareFeet":
                property.setSquarefeet(Integer.parseInt(value));
                break;
            case "lotSize":
                property.setLotsize(value);
                break;
            case "vendor":
                Vendors v = new Vendors();
                v.setVendorId(Integer.parseInt(value));
                property.setVendorId(v);
                break;
            case "agent":
                Agents a = new Agents();
                a.setAgentId(Integer.parseInt(value));
                property.setAgentId(a);
                break;
            case "ber":
                property.setBerRating(value);
                break;
            case "images":
                images.add(value);
                break;
            default:
                break;
        }
        return property;

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
