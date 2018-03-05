package ua.com.eshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.com.eshop.entity.Customer;
import ua.com.eshop.service.CustomerService;

@Controller
public class StartController {
    @Autowired
    private CustomerService customerService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String index(){
        return "index";
    }

    @PostMapping("/signup")
    public String saveUser(
            @RequestParam String emailUp,
            @RequestParam String passwordUp
    ) {
        Customer customer = new Customer();
        customer.setUsername(emailUp);
        customer.setPassword(passwordEncoder.encode(passwordUp));

        customerService.save(customer);
        return "redirect:/login";
    }
}