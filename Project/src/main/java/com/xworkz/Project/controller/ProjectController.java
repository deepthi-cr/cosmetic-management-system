package com.xworkz.Project.controller;

import com.xworkz.Project.entity.AdminEntity;
import com.xworkz.Project.entity.ProductEntity;
import com.xworkz.Project.entity.RegisterEntity;
import com.xworkz.Project.repo.ProjectRepo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequestMapping("/")
@AllArgsConstructor
public class ProjectController {

    ProjectRepo repo;

    @GetMapping("home")
    public String homePage() {
        System.out.println("SOP: ProjectController.homePage() - Loading home page");
        return "index";
    }

    @GetMapping("redirectToRegister")
    public String redirectToRegister() {
        System.out.println("SOP: ProjectController.redirectToRegister() - Redirecting to register page");
        return "register";
    }

    @GetMapping("redirectToAdminLogin")
    public String redirectToAdminLogin() {
        System.out.println("SOP: ProjectController.redirectToAdminLogin() - Redirecting to admin login");
        return "adminLogin";
    }

    @GetMapping("redirectToUserLogin")
    public String redirectToUserLogin() {
        System.out.println("SOP: ProjectController.redirectToUserLogin() - Redirecting to user login");
        return "userLogin";
    }

    @PostMapping("register")
    public String saveUser(RegisterEntity entity) {
        System.out.println("SOP: ProjectController.saveUser() - Started with entity: " + entity);
        try {
            repo.saveUser(entity);
            System.out.println("SOP: ProjectController.saveUser() - User registration successful");
            return "index";
        } catch (Exception e) {
            System.out.println("SOP: ProjectController.saveUser() - Error during registration: " + e.getMessage());
            return "register";
        }
    }

    @PostMapping("adminLogin")
    public String adminLogin(@RequestParam("email") String email, @RequestParam("psw") String psw, Model model) {
        System.out.println("SOP: ProjectController.adminLogin() - Started with email: " + email);
        try {
            boolean isCheck = repo.checkEmail(email, psw);
            if (isCheck) {
                AdminEntity entity = repo.getByEmail(email);
                model.addAttribute("email", entity.getEmail());
                model.addAttribute("adminName", entity.getName());
                System.out.println("SOP: ProjectController.adminLogin() - Admin login successful");
                return "adminDashBord";
            }
            System.out.println("SOP: ProjectController.adminLogin() - Admin login failed");
            return "adminLogin";
        } catch (Exception e) {
            System.out.println("SOP: ProjectController.adminLogin() - Error during admin login: " + e.getMessage());
            return "adminLogin";
        }
    }

    @PostMapping("userLogin")
    public String userLogin(@RequestParam("email") String email, @RequestParam("psw") String psw, Model model) {
        System.out.println("SOP: ProjectController.userLogin() - Started with email: " + email);
        try {
            boolean isCheck = repo.checkUserEmail(email, psw);
            if (isCheck) {
                RegisterEntity entity = repo.getByUser(email);
                model.addAttribute("email", entity.getEmail());
                String name = entity.getFirstName() + " " + entity.getSecondName();
                model.addAttribute("userName", name);
                System.out.println("SOP: ProjectController.userLogin() - User login successful");
                return "userDashBord";
            }
            System.out.println("SOP: ProjectController.userLogin() - User login failed");
            return "userLogin";
        } catch (Exception e) {
            System.out.println("SOP: ProjectController.userLogin() - Error during user login: " + e.getMessage());
            return "userLogin";
        }
    }

    @GetMapping("logout")
    public String logOut() {
        System.out.println("SOP: ProjectController.logOut() - User logged out");
        return "index";
    }

    @GetMapping("redirectToUser")
    public String redirectToUser(Model model) {
        System.out.println("SOP: ProjectController.redirectToUser() - Loading user details");
        try {
            List<RegisterEntity> entityList = repo.getAll();
            model.addAttribute("entityList", entityList);
            System.out.println("SOP: ProjectController.redirectToUser() - Loaded " + entityList.size() + " users");
            return "userDetails";
        } catch (Exception e) {
            System.out.println("SOP: ProjectController.redirectToUser() - Error loading user details: " + e.getMessage());
            return "adminDashBord";
        }
    }

    @GetMapping("redirectToProducts")
    public String redirectToProducts(Model model) {
        System.out.println("SOP: ProjectController.redirectToProducts() - Loading products page");
        try {
            // Add empty product object for form binding
            model.addAttribute("product", new ProductEntity());
            return "addProduct";
        } catch (Exception e) {
            System.out.println("SOP: ProjectController.redirectToProducts() - Error: " + e.getMessage());
            return "adminDashBord";
        }
    }

    @PostMapping("addProduct")
    public RedirectView addProduct(@ModelAttribute ProductEntity product, Model model) {
        System.out.println("SOP: ProjectController.addProduct() - Adding new product");
        repo.save(product);
        System.out.println("SOP: ProjectController.addProduct() - Product saved with ID: ");
        model.addAttribute("successMessage", "Product added successfully!");
        return new RedirectView("redirectToProducts",true);
    }


    @GetMapping("redirectToUserProducts")
    public String redirectToUserProducts(Model model) {
        System.out.println("SOP: ProjectController.redirectToUserProducts() - Loading products for user");
        List<ProductEntity> productList = repo.getAllProduct();
        model.addAttribute("products", productList);
        System.out.println("SOP: ProjectController.redirectToUserProducts() - Loaded " + productList.size() + " products");
        return "products";

    }

    @GetMapping("redirectToViewProducts")
    public String redirectToViewProducts(Model model) {
        System.out.println("SOP: ProjectController.redirectToViewProducts() - Loading products for admin view");
        List<ProductEntity> productList = repo.getAllProduct();
        model.addAttribute("products", productList);
        System.out.println("SOP: ProjectController.redirectToViewProducts() - Loaded " + productList.size() + " products");
        return "adminProducts";
    }
}