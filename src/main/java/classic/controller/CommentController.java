package classic.controller;

import classic.model.Comment;
import classic.service.Modification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CommentController {

    private final Modification<Comment> modification;

    @Autowired
    public CommentController(Modification<Comment> modification){ this.modification = modification; }

    @GetMapping("/leave-comment/{post_id}")
    public String leaveComment(@PathVariable long post_id, Model model){
        Comment comment = new Comment();
        comment.setRelatedPost(modification.getPostRepository().getById(post_id));
        model.addAttribute("comment",comment);
        model.addAttribute("comments", modification.getObjects(post_id));
        return "post_comments";
    }

    @PostMapping("/leave-comment/{post_id}")
    public String createComment(@PathVariable long post_id, @ModelAttribute("comment") Comment comment){
        comment.setRelatedPost(modification.getPostRepository().getById(post_id));
        modification.create(comment);
        return "redirect:/leave-comment/" + post_id;
    }
}
