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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
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
@Table(name = "agents")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Agents.findAll", query = "SELECT a FROM Agents a")
    , @NamedQuery(name = "Agents.findByAgentId", query = "SELECT a FROM Agents a WHERE a.agentId = :agentId")
    , @NamedQuery(name = "Agents.findByName", query = "SELECT a FROM Agents a WHERE a.name = :name")
    , @NamedQuery(name = "Agents.findByPhone", query = "SELECT a FROM Agents a WHERE a.phone = :phone")
    , @NamedQuery(name = "Agents.findByFax", query = "SELECT a FROM Agents a WHERE a.fax = :fax")
    , @NamedQuery(name = "Agents.findByEmail", query = "SELECT a FROM Agents a WHERE a.email = :email")
    , @NamedQuery(name = "Agents.findByUsername", query = "SELECT a FROM Agents a WHERE a.username = :username")
    , @NamedQuery(name = "Agents.findByImage", query = "SELECT a FROM Agents a WHERE a.image = :image")})
public class Agents implements Serializable {

    @Column(name = "role")
    private String role;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "agentId")
    private Integer agentId;
    @Column(name = "name")
    private String name;
    @Column(name = "phone")
    private String phone;
    @Column(name = "fax")
    private String fax;
    @Column(name = "email")
    private String email;
    @Column(name = "username")
    private String username;
    @Lob
    @Column(name = "password")
    private String password;
    @Column(name = "image")
    private String image;
    @OneToMany(mappedBy = "agentId")
    private Collection<Properties> propertiesCollection;

    public Agents() {
    }

    public Agents(Integer agentId) {
        this.agentId = agentId;
    }

    public Integer getAgentId() {
        return agentId;
    }

    public void setAgentId(Integer agentId) {
        this.agentId = agentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
        hash += (agentId != null ? agentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Agents)) {
            return false;
        }
        Agents other = (Agents) object;
        if ((this.agentId == null && other.agentId != null) || (this.agentId != null && !this.agentId.equals(other.agentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "classes.entities.Agents[ agentId=" + agentId + " ]";
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
