package ua.com.eshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.com.eshop.entity.Customer;

public interface CustomerDAO extends JpaRepository<Customer, Integer> {
    Customer findByUsername(String username);
}
