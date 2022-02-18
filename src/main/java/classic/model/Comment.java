package classic.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@EqualsAndHashCode
@Table(name = "comment")
public class Comment {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "local_date_time", columnDefinition = "DATETIME", nullable = false)
    private LocalDateTime localDate = LocalDateTime.now();

    @ManyToOne
    private Post relatedPost;

    @ManyToOne
    private User commentOwner;

    @PreRemove
    public void removeCommentsFromUser() {
        commentOwner.getComments().remove(this);
    }

}
