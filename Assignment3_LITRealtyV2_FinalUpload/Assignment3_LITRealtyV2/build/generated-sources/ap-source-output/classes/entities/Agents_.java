package classes.entities;

import classes.entities.Properties;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-01T15:26:24")
@StaticMetamodel(Agents.class)
public class Agents_ { 

    public static volatile SingularAttribute<Agents, String> image;
    public static volatile SingularAttribute<Agents, Integer> agentId;
    public static volatile SingularAttribute<Agents, String> password;
    public static volatile SingularAttribute<Agents, String> role;
    public static volatile SingularAttribute<Agents, String> phone;
    public static volatile SingularAttribute<Agents, String> name;
    public static volatile CollectionAttribute<Agents, Properties> propertiesCollection;
    public static volatile SingularAttribute<Agents, String> fax;
    public static volatile SingularAttribute<Agents, String> email;
    public static volatile SingularAttribute<Agents, String> username;

}