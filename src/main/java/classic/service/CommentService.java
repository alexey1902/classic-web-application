package classic.service;

import classic.model.Comment;
import classic.repository.CommentRepository;
import classic.repository.PostRepository;
import classic.repository.UserRepository;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Service
public class CommentService extends Modification<Comment>{

    private final CommentRepository commentRepository;

    @Autowired
    public CommentService(UserRepository userRepository, PostRepository postRepository, CommentRepository commentRepository) {
        super(userRepository, postRepository);
        this.commentRepository = commentRepository;
    }

    @Override
    public void create(Comment comment) {
        LocalDateTime time = LocalDateTime.now();
        comment.setLocalDate(time);
        comment.setCommentOwner(getCurrentUser());
        commentRepository.save(comment);
    }

    @Override
    public long edit(long comment_id, Comment comment) {
        Comment commentToUpdate = commentRepository.getById(comment_id);
        commentToUpdate.setDescription(comment.getDescription());
        commentToUpdate.setLocalDate(LocalDateTime.now());
        commentRepository.save(commentToUpdate);
        return commentRepository.getById(comment_id).getRelatedPost().getId();
    }

    @Override
    public long delete(long comment_id) {
        long relatedPostId = commentRepository.getById(comment_id).getRelatedPost().getId();
        commentRepository.deleteById(comment_id);
        return relatedPostId;
    }

    @Override
    public Comment getObject(long comment_id) {
        return commentRepository.getById(comment_id);
    }

    @Override
    public List<Comment> getObjects(long post_id) {
       return commentRepository.findAllByRelatedPost(postRepository.getById(post_id));
    }
}
