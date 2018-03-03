package ua.com.eshop.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Collection;

@Entity
public class Customer implements UserDetails{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    private String password;
    @Override
    public String getPassword() {
        return this.password;
    }

    private String username;
    @Override
    public String getUsername() {
        return this.username;
    }

    private boolean accountNonExpired = true;
    @Override
    public boolean isAccountNonExpired() {
        return this.accountNonExpired;
    }

    private boolean accountNonLocked = true;
    @Override
    public boolean isAccountNonLocked() {
        return this.accountNonLocked;
    }

    private boolean credentialsNonExpired = true;
    @Override
    public boolean isCredentialsNonExpired() {
        return this.credentialsNonExpired;
    }

    private boolean enabled = true;
    @Override
    public boolean isEnabled() {
        return this.enabled;
    }

    public Customer() {
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
