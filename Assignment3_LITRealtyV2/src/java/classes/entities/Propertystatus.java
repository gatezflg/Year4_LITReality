/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author gatez1511
 */
@Entity
@Table(name = "propertystatus")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Propertystatus.findAll", query = "SELECT p FROM Propertystatus p")
    , @NamedQuery(name = "Propertystatus.findByStatusId", query = "SELECT p FROM Propertystatus p WHERE p.statusId = :statusId")
    , @NamedQuery(name = "Propertystatus.findByStatus", query = "SELECT p FROM Propertystatus p WHERE p.status = :status")})
public class Propertystatus implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "statusId")
    private Integer statusId;
    @Column(name = "status")
    private String status;
    @OneToMany(mappedBy = "statusId")
    private Collection<Properties> propertiesCollection;

    public Propertystatus() {
    }

    public Propertystatus(Integer statusId) {
        this.statusId = statusId;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @XmlTransient
    public Collection<Properties> getPropertiesCollection() {
        return propertiesCollection;
    }

    public void setPropertiesCollection(Collection<Properties> propertiesCollection) {
        this.propertiesCollection = propertiesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (statusId != null ? statusId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Propertystatus)) {
            return false;
        }
        Propertystatus other = (Propertystatus) object;
        if ((this.statusId == null && other.statusId != null) || (this.statusId != null && !this.statusId.equals(other.statusId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.entities.Propertystatus[ statusId=" + statusId + " ]";
    }
    
}
