    package com.predator.programs.Spring.JPA.Project.repository;

    import com.predator.programs.Spring.JPA.Project.model.Product;
    import org.springframework.data.jpa.repository.JpaRepository;
    import org.springframework.data.jpa.repository.Query;
    import org.springframework.data.repository.query.Param;
    import org.springframework.stereotype.Repository;

    import java.util.List;

    @Repository
    public interface ProductRepository extends JpaRepository<Product, Long> {
        List<Product> findByBrandContainingIgnoreCaseOrModelNameContainingIgnoreCase(String brand, String modelName);
        List<Product> findByPriceBetween(Double minPrice, Double maxPrice);
        List<Product> findByBrandContainingIgnoreCase(String brand);

        @Query("SELECT p FROM Product p WHERE p.stockQuantity < :threshold")
        List<Product> findLowStockProducts(@Param("threshold") Integer threshold);
    }
    