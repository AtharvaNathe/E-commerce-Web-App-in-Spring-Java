    package com.predator.programs.Spring.JPA.Project.model;

    import jakarta.persistence.Column;
    import jakarta.persistence.Entity;
    import jakarta.persistence.GeneratedValue;
    import jakarta.persistence.GenerationType;
    import jakarta.persistence.Id;
    import jakarta.persistence.Lob;
    import jakarta.persistence.Table;
    import jakarta.validation.constraints.Min;
    import jakarta.validation.constraints.NotBlank;
    import jakarta.validation.constraints.NotNull;

    @Entity
    @Table(name = "products")
    public class Product {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long prodid;

        @NotBlank(message = "Model Name is required")
        @Column(name = "model_name", nullable = false)
        private String modelName;

        @NotBlank(message = "Brand is required")
        @Column(name = "brand", nullable = false)
        private String brand;

        @NotNull(message = "Price is required")
        @Min(value = 0, message = "Price must be greater than or equal to 0")
        @Column(name = "price", nullable = false)
        private Double price;

        @NotNull(message = "Stock Quantity is required")
        @Min(value = 0, message = "Stock Quantity must be greater than or equal to 0")
        @Column(name = "stock_quantity", nullable = false)
        private Integer stockQuantity;

        @Lob // For multi-line description
        @Column(name = "features")
        private String features;

        @Column(name = "warranty_period")
        private String warrantyPeriod;

        // Constructors
        public Product() {
        }

        public Product(String modelName, String brand, Double price, Integer stockQuantity, String features, String warrantyPeriod) {
            this.modelName = modelName;
            this.brand = brand;
            this.price = price;
            this.stockQuantity = stockQuantity;
            this.features = features;
            this.warrantyPeriod = warrantyPeriod;
        }

        // Getters and Setters
        public Long getProdid() {
            return prodid;
        }

        public void setProdid(Long prodid) {
            this.prodid = prodid;
        }

        public String getModelName() {
            return modelName;
        }

        public void setModelName(String modelName) {
            this.modelName = modelName;
        }

        public String getBrand() {
            return brand;
        }

        public void setBrand(String brand) {
            this.brand = brand;
        }

        public Double getPrice() {
            return price;
        }

        public void setPrice(Double price) {
            this.price = price;
        }

        public Integer getStockQuantity() {
            return stockQuantity;
        }

        public void setStockQuantity(Integer stockQuantity) {
            this.stockQuantity = stockQuantity;
        }

        public String getFeatures() {
            return features;
        }

        public void setFeatures(String features) {
            this.features = features;
        }

        public String getWarrantyPeriod() {
            return warrantyPeriod;
        }

        public void setWarrantyPeriod(String warrantyPeriod) {
            this.warrantyPeriod = warrantyPeriod;
        }
    }
    