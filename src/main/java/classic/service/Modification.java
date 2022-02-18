package classic.service;

import classic.model.User;
import classic.repository.PostRepository;
import classic.repository.UserRepository;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Data @NoArgsConstructor
@Service
public abstract class Modification<T> {

    protected UserRepository userRepository;
    protected PostRepository postRepository;

    @Autowired
    public Modification(UserRepository userRepository, PostRepository postRepository){
        this.userRepository = userRepository;
        this.postRepository = postRepository;
    }

    protected User getCurrentUser(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (User)authentication.getPrincipal();
    }

    public abstract void create(T object);
    public abstract long edit(long id, T object);
    public abstract long delete(long id);
    public abstract T getObject(long id);
    public abstract List<T> getObjects(long id);

}
