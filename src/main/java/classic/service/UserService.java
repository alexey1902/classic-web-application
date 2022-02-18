package classic.service;

import classic.enumeration.ExplanatoryMessages;
import classic.model.User;
import classic.repository.PostRepository;
import classic.repository.UserRepository;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@Service
public class UserService extends Modification<User> implements UserDetailsService {

    @Autowired
    public UserService(UserRepository userRepository, PostRepository postRepository) {
        super(userRepository, postRepository);
    }

    @Override
    public void create(User object) {

    }

    @Override
    public long edit(long id, User object) {
        return 0;
    }

    @Override
    public long delete(long user_id) {
        userRepository.deleteById(user_id);
        return 0;
    }

    @Override
    public List<User> getObjects(long user_id) {
        return userRepository.findAll();
    }

    @Override
    public User getObject(long user_id) {
        return userRepository.getById(user_id);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findUserByEmail(email).orElseThrow(() ->
                new UsernameNotFoundException(
                        String.format(ExplanatoryMessages.USER_NOT_FOUND_BY_EMAIL.toString(), email)
                ));
    }
}
