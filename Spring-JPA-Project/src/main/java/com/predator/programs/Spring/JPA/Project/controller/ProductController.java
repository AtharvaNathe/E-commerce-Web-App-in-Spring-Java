package com.predator.programs.Spring.JPA.Project.controller;

import com.predator.programs.Spring.JPA.Project.model.Product;
import com.predator.programs.Spring.JPA.Project.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    // Display list of products
    @GetMapping
    public String listProducts(Model model,
                               @RequestParam(value = "search", required = false) String search,
                               @RequestParam(value = "minPrice", required = false) Double minPrice,
                               @RequestParam(value = "maxPrice", required = false) Double maxPrice,
                               @RequestParam(value = "brand", required = false) String brand,
                               @RequestParam(value = "lowStock", required = false) boolean lowStock) {
        List<Product> products;
        if (search != null && !search.isEmpty()) {
            products = productService.searchProducts(search);
        } else if (minPrice != null && maxPrice != null) {
            products = productService.filterProductsByPriceRange(minPrice, maxPrice);
        } else if (brand != null && !brand.isEmpty()) {
            products = productService.filterProductsByBrand(brand);
        } else if (lowStock) {
            products = productService.getLowStockProducts(5); // Threshold for low stock
        } else {
            products = productService.getAllProducts();
        }
        model.addAttribute("products", products);
        return "product-list"; // This will resolve to /WEB-INF/jsp/product-list.jsp
    }

    // Show form for adding new product
    @GetMapping("/new")
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "add-product"; // This will resolve to /WEB-INF/jsp/add-product.jsp
    }

    // Save new product
    @PostMapping("/new")
    public String addProduct(@Valid @ModelAttribute("product") Product product,
                             BindingResult result,
                             RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "add-product"; // This will resolve to /WEB-INF/jsp/add-product.jsp
        }
        productService.saveProduct(product);
        redirectAttributes.addFlashAttribute("message", "Product added successfully!");
        return "redirect:/admin/products";
    }

    // Show form for editing product
    @GetMapping("/edit/{id}")
    public String showEditProductForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Optional<Product> product = productService.getProductById(id);
        if (product.isPresent()) {
            model.addAttribute("product", product.get());
            return "edit-product"; // This will resolve to /WEB-INF/jsp/edit-product.jsp
        } else {
            redirectAttributes.addFlashAttribute("error", "Product not found.");
            return "redirect:/admin/products";
        }
    }

    // Update product
    @PostMapping("/edit/{id}")
    public String updateProduct(@PathVariable Long id,
                                @Valid @ModelAttribute("product") Product product,
                                BindingResult result,
                                RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "edit-product"; // This will resolve to /WEB-INF/jsp/edit-product.jsp
        }
        product.setProdid(id); // Ensure the ID is set for update
        productService.saveProduct(product);
        redirectAttributes.addFlashAttribute("message", "Product updated successfully!");
        return "redirect:/admin/products";
    }

    // Delete product
    @PostMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        productService.deleteProduct(id);
        redirectAttributes.addFlashAttribute("message", "Product deleted successfully!");
        return "redirect:/admin/products";
    }
}
