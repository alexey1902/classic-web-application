package classic.controller;

import classic.enumeration.ExplanatoryMessages;
import classic.enumeration.UserRole;
import classic.model.User;
import classic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class RegistrationController {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public RegistrationController(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/sign-up")
    public String signUp(@ModelAttribute("user") User user) {
        return "registration";
    }

    @PostMapping("/sign-up")
    public String createUser(@ModelAttribute("user") @Valid User user, BindingResult bindingResult, String confirm, Model model) {
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        if (userRepository.findUserByUsername(user.getUsername()).isPresent()) {
            model.addAttribute("error", ExplanatoryMessages.USERNAME_IS_REGISTERED.toString());
            return "registration";
        }

        if (userRepository.findUserByEmail(user.getEmail()).isPresent()) {
            model.addAttribute("error", ExplanatoryMessages.MAIL_IS_REGISTERED.toString());
            return "registration";
        }

        if (!user.getPassword().equals(confirm)) {
            model.addAttribute("error", ExplanatoryMessages.INVALID_CONFIRM_PASSWORD.toString());
            return "registration";
        }

        user.setRole(UserRole.USER);
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        return "redirect:/sign-in";
    }
}
