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
            @RequestParam String passwordUp,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String mobileNumber
    ) {
        Customer customer = new Customer();

        customer.setUsername(emailUp);
        customer.setPassword(passwordEncoder.encode(passwordUp));
//        customer.setEmail(emailUp);
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setMobileNumber(mobileNumber);


        customerService.save(customer);
        return "redirect:/";
    }

//    @GetMapping("/index")
//    public String index(){
//        return "index";
//    }

//    @GetMapping("/xToLoginPage")
//    public String loginPage(){
//        return "loginPage";
//    }
}