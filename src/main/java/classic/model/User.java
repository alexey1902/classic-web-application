package classic.model;

import classic.enumeration.UserRole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
@EqualsAndHashCode
@Entity
@Table(name = "user")
public class User implements UserDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty(message = "Username mustn't be empty.")
    @NotNull(message = "Username mustn't be empty.")
    @Size(min = 2, max = 20, message = "First name size should be between 3 and 20.")
    @Column(name = "username", nullable = false)
    private String username;

    @Email(message = "Email mustn't be empty.")
    @NotNull(message = "Email mustn't be empty.")
    @NotEmpty(message = "Email mustn't be empty.")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @NotEmpty(message = "Password mustn't be empty.")
    @NotNull(message = "Password mustn't be empty.")
    @Column(name = "password", nullable = false)
    @Size(min = 3, message = "Password size must be more than 3")
    private String password;

    @NotEmpty(message = "Last name must be not empty.")
    @NotNull(message = "Last name should not be empty.")
    @Size(min = 2, max = 20, message = "Last name size should be between 2 and 30.")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotEmpty(message = "Last name must be not empty.")
    @NotNull(message = "Last name should not be empty.")
    @Size(min = 2, max = 20, message = "Last name size should be between 2 and 30.")
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Enumerated(EnumType.STRING)
    private UserRole role;

    @Column(name = "active", nullable = false)
    private boolean active;

    @OneToMany(mappedBy = "postOwner", cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval = true)
    private List<Post> posts = new ArrayList<>();

    @OneToMany(mappedBy = "commentOwner", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @Fetch(FetchMode.SUBSELECT)
    private List<Comment> comments = new ArrayList<>();

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.name());
        return Collections.singleton(authority);
    }

    @Override
    public String getPassword() { return password; }

    @Override
    public String getUsername() { return username; }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return active;
    }
}
