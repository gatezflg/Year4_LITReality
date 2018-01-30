/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;


import classes.entities.Vendors;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
/**
 *
 * @author gatez1511
 */
public class VendorDB {
    
    public static List<Vendors> getAllVendors() {

        List<Vendors> allVendorsList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Vendors> tq = em.createNamedQuery("Vendors.findAll", Vendors.class);
            allVendorsList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allVendorsList;
    }//end getAllVendors
    
    public static Vendors getVendorByID(int id) {
        
        Vendors a = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        try{
            
        a = em.createNamedQuery("Vendors.findById", Vendors.class).setParameter("id", id).getSingleResult();

        em.close();
        }catch(Exception ex){
         System.out.println(ex.getMessage());
            em.close();
        }
        return a;

    }//end getVendorByID
}
