/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.db;

import classes.entities.Agents;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

/**
 *
 * @author gatez1511
 */
public class AgentsDB {

    public static List<Agents> getAllAgents() {

        List<Agents> allAgentsList = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();

        try {
            //create tq and use named query from accounts class
            TypedQuery<Agents> tq = em.createNamedQuery("Agents.findAll", Agents.class);
            allAgentsList = tq.getResultList();

            em.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return allAgentsList;
    }//end getAllAgents

    public static Agents getAgentByUsername(String user) {
        //findByName
        Agents a = null;
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        try {
            a = em.createNamedQuery("Agents.findByUsername", Agents.class).setParameter("username", user).getSingleResult();
            em.close();
            
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            em.close();
        }
        return a;

    }//end getAgentByUsername

    public static void deleteAccountByID(int id) {

        //do deletion based on id
    }

    public static void insertAccount(Agents account) {

        //insert account object
    }
}
