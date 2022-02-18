package classic.service;

import classic.model.Post;
import classic.repository.PostRepository;
import classic.repository.UserRepository;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Service
public class PostService extends Modification<Post> {

    @Autowired
    public PostService(UserRepository userRepository, PostRepository postRepository) {
        super(userRepository, postRepository);
    }

    @Override
    public long edit(long post_id, Post post) {
        Post postToUpdate = postRepository.getById(post_id);
        postToUpdate.setTitle(post.getTitle());
        postToUpdate.setDescription(post.getDescription());
        postRepository.save(postToUpdate);
        return postRepository.getById(post_id).getPostOwner().getId();
    }

    @Override
    public long delete(long post_id) {
        long postOwnerId = postRepository.getById(post_id).getPostOwner().getId();
        postRepository.deleteById(post_id);
        return postOwnerId;
    }

    @Override
    public void create(Post post) {
        post.setPostOwner(getCurrentUser());
        postRepository.save(post);
    }

    @Override
    public List<Post> getObjects(long user_id) {
        return postRepository.findAllByPostOwner(userRepository.getById(user_id));
    }

    @Override
    public Post getObject(long post_id) {
        return postRepository.getById(post_id);
    }

}