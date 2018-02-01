/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;
import classes.entities.Propertytypes;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class PropertyTypesDB {
    
    public static List<Propertytypes> getAllPropertytypes() {

        List<Propertytypes> allPropertytypesList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Propertytypes> tq = em.createNamedQuery("Propertytypes.findAll", Propertytypes.class);
            allPropertytypesList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allPropertytypesList;
    }//end getAllPropertytypes
}
