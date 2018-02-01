/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Garagetypes;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class GarageTypesDB {
    
        public static List<Garagetypes> getAllGaragetypes() {

        List<Garagetypes> allGaragetypesList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Garagetypes> tq = em.createNamedQuery("Garagetypes.findAll", Garagetypes.class);
            allGaragetypesList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allGaragetypesList;
    }//end getAllGaragetypes
}
