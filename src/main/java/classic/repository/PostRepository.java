package classic.repository;

import classic.model.Post;
import classic.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {

    List<Post> findAllByPostOwner(User owner);

    void deleteById(long post_id);
}
