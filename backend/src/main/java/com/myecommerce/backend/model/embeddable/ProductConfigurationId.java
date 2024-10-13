package com.myecommerce.backend.model.embeddable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Embeddable
@Getter
@NoArgsConstructor // Needed by JPA for creating instances of this class without arguments
@AllArgsConstructor // Convenient constructor for manually creating instances with both IDs
@EqualsAndHashCode
public class ProductConfigurationId implements Serializable {

    @Column(name = "product_item_id")
    private Integer productItemId;

    @Column(name = "variation_option_id")
    private Integer variationOptionId;
}