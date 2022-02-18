package classic.repository;

import classic.model.Comment;
import classic.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByRelatedPost(Post relatedPost);

    void deleteById(long comment_id);
}
