package classic.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@EqualsAndHashCode
@Table(name = "post")
public class Post {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "title", nullable = false)
    private String title;

    @ManyToOne
    private User postOwner;

    @Column(name = "description", nullable = false)
    private String description;
/*
    @Column(name = "local_date", nullable = false)
    private LocalDate localDate;

    @OneToMany
    private List<User> likes = new ArrayList<>();

    @OneToMany
    private List<Comment> comments = new ArrayList<>();*/
}
