package classes.entities;

import classes.entities.Properties;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-01T15:26:24")
@StaticMetamodel(Vendors.class)
public class Vendors_ { 

    public static volatile SingularAttribute<Vendors, String> name;
    public static volatile SingularAttribute<Vendors, String> contactNumber;
    public static volatile CollectionAttribute<Vendors, Properties> propertiesCollection;
    public static volatile SingularAttribute<Vendors, Integer> vendorId;
    public static volatile SingularAttribute<Vendors, String> email;

}