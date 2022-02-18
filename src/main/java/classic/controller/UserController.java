package classic.controller;

import classic.model.User;
import classic.service.Modification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class UserController {

    private final Modification<User> modification;

    @Autowired
    public UserController(Modification<User> modification){
        this.modification = modification;
    }

    @GetMapping("/user/{user_id}")
    public String userAccount(@PathVariable long user_id, Model model) {
        model.addAttribute("user", modification.getObject(user_id));
        return "user";
    }
}
