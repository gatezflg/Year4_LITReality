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
    
    
     public static List<Properties> getAllProperties() 
     {
    
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
    }
     
          public static List<Properties> getTop11Properties() 
     {
    
        List<Properties> topPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
       
        try{
        //create tq and use named query from accounts class
        TypedQuery<Properties> tq = em.createNamedQuery("Properties.index error", Properties.class);
         topPropertyList = tq.getResultList();
        
        em.close();
       }catch(Exception ex){
           System.out.println(ex.getMessage());
            em.close();
       }
       return topPropertyList;
    }
     
    public static List<Properties> getAllResSingle() 
    {
    
        List<Properties> allResSinglePropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
       
        try{
        //create tq and use named query from accounts class
        TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAllResSingle", Properties.class);
         allResSinglePropertyList = tq.getResultList();
        
        em.close();
       }catch(Exception ex){
           System.out.println(ex.getMessage());
            em.close();
       }
       return allResSinglePropertyList;
    }

    public static List<Properties> getAllResMulti() 
    {
    
        List<Properties> allResMultiPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
       
        try{
        //create tq and use named query from accounts class
        TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAllResMulti", Properties.class);
         allResMultiPropertyList = tq.getResultList();
        
        em.close();
       }catch(Exception ex){
           System.out.println(ex.getMessage());
            em.close();
       }
       return allResMultiPropertyList;
    }
    
        public static List<Properties> getAllCommercial() 
    {
    
        List<Properties> allCommercialPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
       
        try{
        //create tq and use named query from accounts class
        TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAllCommercial", Properties.class);
         allCommercialPropertyList = tq.getResultList();
        
        em.close();
       }catch(Exception ex){
           System.out.println(ex.getMessage());
            em.close();
       }
       return allCommercialPropertyList;
    }
         
    public static Properties getPropertyByID(int id) {
        
        Properties a = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        int cont =0;
        try{
            
        a = em.createNamedQuery("Properties.findById", Properties.class).setParameter("id", id).getSingleResult();

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
