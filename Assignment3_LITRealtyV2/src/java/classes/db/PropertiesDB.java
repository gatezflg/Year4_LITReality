/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Properties;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class PropertiesDB {

    public static List<Properties> getAllProperties() {

        List<Properties> allPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAll", Properties.class);
            allPropertyList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allPropertyList;
    }// END getAllProperties

    public static List<Properties> getRecommendedProperties() {

        List<Properties> recommendedList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Properties> tq = em.createNamedQuery("Properties.findRecommended", Properties.class);
            recommendedList = tq.setMaxResults(4).getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return recommendedList;
    }// END getRecommendedProperties

    public static List<Properties> getAllPropertiesOrdered() {

        List<Properties> allPropertyList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Properties> tq = em.createNamedQuery("Properties.findAllOrdered", Properties.class);
            allPropertyList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allPropertyList;
    } // END getAllPropertiesOrdered

    public static List<Properties> getLatestProperties() {

        List<Properties> latestPropertiesList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        Date today = new Date(System.currentTimeMillis());

        try {
            //create tq and use named query from accounts class
            TypedQuery<Properties> tq = em.createNamedQuery("Properties.findLatestProperties", Properties.class);
            tq.setParameter("oneWeekAgo", removeTime(today));
            latestPropertiesList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return latestPropertiesList;
    }//END getLatestProperties

    public static Properties getPropertyByID(int id) {

        Properties a = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        try {

            a = em.createNamedQuery("Properties.findById", Properties.class).setParameter("id", id).getSingleResult();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return a;

    }//end getPropertyByID

    public static void updateProperty(Properties prop) {

        EntityManager em = null;
        EntityTransaction trans = null;
        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.merge(prop);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            trans.rollback();
            em.close();
        } finally {
            em.close();
        }
    } //END updateProperty

    public static void deletePropertyByID(int id) {

        //do deletion based on id
    }

    public static int getNewListingNum() {
        EntityManager em = null;
        TypedQuery query = null;
        Properties property = null;
        int newListing = 0;

        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findLastListingNum", Properties.class);
            property = (Properties) query.setMaxResults(1).getSingleResult();
            newListing = property.getListingNum() + 1;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }

        return newListing;
    } //END getNewListingNum

    public static int getNewPropId() {
        EntityManager em = null;
        TypedQuery query = null;
        Properties property = null;
        int newPropId = 0;

        try {
            em = DBUtil.getEmf().createEntityManager();
            query = em.createNamedQuery("Properties.findLastListingNum", Properties.class);
            property = (Properties) query.setMaxResults(1).getSingleResult();
            newPropId = property.getId() + 1;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
        return newPropId;
    } // END getNewPropId

    public static void addProperty(Properties prop) {
        EntityManager em = null;
        EntityTransaction trans = null;

        try {
            em = DBUtil.getEmf().createEntityManager();
            trans = em.getTransaction();
            trans.begin();
            em.persist(prop);
            trans.commit();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
    }

    public static Date removeTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.set(Calendar.HOUR, -168);
        return cal.getTime();
    }

}
