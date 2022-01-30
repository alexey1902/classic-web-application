package classic.controller;

import classic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class UserController {

    private final UserRepository userRepository;

    @Autowired
    public UserController(UserRepository userRepository){ this.userRepository = userRepository; }

    @GetMapping("/user/{user_id}")
    public String userAccount(@PathVariable long user_id, Model model) {
        model.addAttribute("user", userRepository.getById(user_id));
        return "user";
    }
}
