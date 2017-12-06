/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Properties;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class PropertiesDB {
    
    
     public static List<Properties> getAllProperties() {
    
        List<Properties> allPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
       
        try{
        //create tq and use named query from accounts class
        TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAllOrdered", Properties.class);
         allPropertyList = tq.getResultList();
        
        em.close();
       }catch(Exception ex){
           System.out.println(ex.getMessage());
            em.close();
       }
       return allPropertyList;
    }//end getAllAgents

    public static Properties getPropertyByID(int id) {
        
        Properties a = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        int cont =0;
        try{
            
        a = em.find(Properties.class, id);

        em.close();
        }catch(Exception ex){
         System.out.println(ex.getMessage());
            em.close();
        }
        return a;

    }//end getAccountByID

    public static void deletePropertyByID(int id) {

        //do deletion based on id
    }

    public static void insertProperty(Properties account) {

        //insert account object
    }

}
