package classes.entities;

import classes.entities.Properties;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-01T15:26:24")
@StaticMetamodel(Garagetypes.class)
public class Garagetypes_ { 

    public static volatile SingularAttribute<Garagetypes, String> gType;
    public static volatile SingularAttribute<Garagetypes, Integer> garageId;
    public static volatile CollectionAttribute<Garagetypes, Properties> propertiesCollection;

}