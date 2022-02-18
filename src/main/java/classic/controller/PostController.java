package classic.controller;

import classic.model.Post;
import classic.service.Modification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PostController {

    private final Modification<Post> modification;

    @Autowired
    public PostController(Modification<Post> modification){
        this.modification = modification;
    }

    @GetMapping("/show-posts/{user_id}")
    public String newPost(@PathVariable long user_id, Model model){
        model.addAttribute("posts", modification.getObjects(user_id));
        return "show_posts";
    }

    @GetMapping("/delete/{post_id}")
    public String deletePost(@PathVariable long post_id){
        return "redirect:/show-posts/" + modification.delete(post_id);
    }

    @GetMapping("/create-post")
    public String newPost(@ModelAttribute("post") Post post){
        return "create_post";
    }

    @GetMapping("/edit/{post_id}")
    public String editPost(@PathVariable long post_id, Model model){
        model.addAttribute("post", modification.getObject(post_id));
        return "edit_post";
    }

    @PostMapping("/create-post")
    public String createPost(@ModelAttribute("post") Post post){
        modification.create(post);
        return "redirect:/home";
    }

    @PostMapping("/edit/{post_id}")
    public String editPost(@ModelAttribute("post") Post post, @PathVariable long post_id){
        return "redirect:/show-posts/" + modification.edit(post_id, post);
    }

}
