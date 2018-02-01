package classes.entities;

import classes.entities.Agents;
import classes.entities.Garagetypes;
import classes.entities.Propertystatus;
import classes.entities.Propertytypes;
import classes.entities.Styles;
import classes.entities.Vendors;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-01T15:26:24")
@StaticMetamodel(Properties.class)
public class Properties_ { 

    public static volatile SingularAttribute<Properties, Agents> agentId;
    public static volatile SingularAttribute<Properties, String> city;
    public static volatile SingularAttribute<Properties, String> berRating;
    public static volatile SingularAttribute<Properties, Garagetypes> garageId;
    public static volatile SingularAttribute<Properties, Integer> active;
    public static volatile SingularAttribute<Properties, Vendors> vendorId;
    public static volatile SingularAttribute<Properties, String> description;
    public static volatile SingularAttribute<Properties, String> photo;
    public static volatile SingularAttribute<Properties, Integer> squarefeet;
    public static volatile SingularAttribute<Properties, Float> bathrooms;
    public static volatile SingularAttribute<Properties, Short> garagesize;
    public static volatile SingularAttribute<Properties, Date> dateAdded;
    public static volatile SingularAttribute<Properties, Integer> listingNum;
    public static volatile SingularAttribute<Properties, Integer> bedrooms;
    public static volatile SingularAttribute<Properties, String> lotsize;
    public static volatile SingularAttribute<Properties, Propertystatus> statusId;
    public static volatile SingularAttribute<Properties, String> street;
    public static volatile SingularAttribute<Properties, Double> price;
    public static volatile SingularAttribute<Properties, Styles> styleId;
    public static volatile SingularAttribute<Properties, Propertytypes> typeId;
    public static volatile SingularAttribute<Properties, Integer> id;

}