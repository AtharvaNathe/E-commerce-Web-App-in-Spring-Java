    package com.predator.programs.Spring.JPA.Project.service;

    import com.predator.programs.Spring.JPA.Project.model.Product;
    import com.predator.programs.Spring.JPA.Project.repository.ProductRepository;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.List;
    import java.util.Optional;

    @Service
    public class ProductService {

        @Autowired
        private ProductRepository productRepository;

        public List<Product> getAllProducts() {
            return productRepository.findAll();
        }

        public Optional<Product> getProductById(Long id) {
            return productRepository.findById(id);
        }

        public Product saveProduct(Product product) {
            return productRepository.save(product);
        }

        public void deleteProduct(Long id) {
            productRepository.deleteById(id);
        }

        public List<Product> searchProducts(String query) {
            return productRepository.findByBrandContainingIgnoreCaseOrModelNameContainingIgnoreCase(query, query);
        }

        public List<Product> filterProductsByPriceRange(Double minPrice, Double maxPrice) {
            return productRepository.findByPriceBetween(minPrice, maxPrice);
        }

        public List<Product> filterProductsByBrand(String brand) {
            return productRepository.findByBrandContainingIgnoreCase(brand);
        }

        public List<Product> getLowStockProducts(Integer threshold) {
            return productRepository.findLowStockProducts(threshold);
        }
    }
    