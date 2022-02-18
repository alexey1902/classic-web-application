package classic.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@EqualsAndHashCode
@Table(name = "like_table")
public class Like {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    private User likeOwner;

    @ManyToOne
    private Post likedPost;

    @PreRemove
    public void removeLikesFromPost() {
        likedPost.getLikes().remove(this);
    }
}

