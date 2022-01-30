package classic.controller;

import classic.model.Post;
import classic.model.User;
import classic.repository.PostRepository;
import classic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PostController {

    private final PostRepository postRepository;
    private final UserRepository userRepository;

    @Autowired
    public PostController(PostRepository postRepository, UserRepository userRepository){
        this.postRepository = postRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/create-post/{user_id}")
    public String newPost(@PathVariable long user_id, @ModelAttribute("post") Post post, Model model){
        model.addAttribute("user", userRepository.getById(user_id));
        return "create_post";
    }

    @PostMapping("/create-post/{user_id}")
    public String createPost(@ModelAttribute("post") Post post, @PathVariable long user_id){
        User owner = userRepository.getById(user_id);
        post.setPostOwner(owner);
        postRepository.save(post);
        return "redirect:/home";
    }
}
