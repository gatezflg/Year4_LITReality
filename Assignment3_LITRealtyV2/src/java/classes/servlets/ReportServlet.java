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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.http.HttpSession;

public class ReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ReportServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get the output stream for writing binary data in the response.
        ServletOutputStream os = response.getOutputStream();
        //set the response content type to PDF
        response.setContentType("application/pdf");
        //create a new document
        Document doc = new Document();

        //create some special styles and font sizes
        Font bfBold18 = new Font(FontFamily.TIMES_ROMAN, 18, Font.BOLD, new BaseColor(0, 0, 0));
        Font bfBold12 = new Font(FontFamily.TIMES_ROMAN, 12, Font.BOLDITALIC, new BaseColor(0, 0, 0));
        Font bf12 = new Font(FontFamily.TIMES_ROMAN, 12);

        try {
            HttpSession sess = request.getSession();
            Agents a = (Agents) sess.getAttribute("agent");
            List<Vendors> vendorList = VendorDB.getAllVendors();
            List<Properties> allPropList = PropertiesDB.getAllProperties();
            List<Properties> agentProperties = new ArrayList<>();
            List<Agents> allAgentsList = AgentsDB.getAllAgents();

            //create an instance of the PdfWriter using the output stream
            PdfWriter.getInstance(doc, os);

            //document header properties
            doc.addAuthor(a.getName());
            doc.addCreationDate();
            doc.addProducer();
            doc.addCreator("LIT Realty");
            doc.addTitle("Property Report");
            doc.setPageSize(PageSize.LETTER);
            doc.open();

            //add a new paragraph
            doc.add(new Paragraph("List of Properties...", bfBold18));
            
            for(Properties p : allPropList){
            
            //create an anchor reference
                Anchor anchor = new Anchor(p.getListingNum().toString().trim(), bfBold12);
                anchor.setReference("#" + p.getId().toString().trim());
                //add the anchor to the document
                doc.add(anchor);
                //add an empty line
                doc.add(Chunk.NEWLINE);
            }
    

            doc.close();

        } catch (DocumentException e) {
            e.printStackTrace();

        }

    }

}
