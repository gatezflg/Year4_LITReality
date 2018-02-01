/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Styles;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class StylesDB {
    
            public static List<Styles> getAllStyles() {

        List<Styles> allStylesList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Styles> tq = em.createNamedQuery("Styles.findAll", Styles.class);
            allStylesList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allStylesList;
    }//end getAllStyles
}
