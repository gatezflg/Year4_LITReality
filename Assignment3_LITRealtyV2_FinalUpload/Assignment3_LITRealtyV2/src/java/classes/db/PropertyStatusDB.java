/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Propertystatus;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class PropertyStatusDB {

    public static List<Propertystatus> getAllPropertystatus() {

        List<Propertystatus> allPropertystatusList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Propertystatus> tq = em.createNamedQuery("Propertystatus.findAll", Propertystatus.class);
            allPropertystatusList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allPropertystatusList;
    }//end getAllPropertystatus

}
