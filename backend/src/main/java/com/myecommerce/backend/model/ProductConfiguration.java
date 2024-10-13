package com.myecommerce.backend.model;

import com.myecommerce.backend.model.embeddable.ProductConfigurationId;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "product_configuration")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductConfiguration {

    @EmbeddedId
    private ProductConfigurationId id;

    @ManyToOne
    @MapsId("productItemId") // This tells Hibernate that productItemId in the EmbeddedId is linked to this ManyToOne relation
    @JoinColumn(name = "product_item_id", nullable = false)
    private ProductItem productItem;

    @ManyToOne
    @MapsId("variationOptionId") // This tells Hibernate that variationOptionId in the EmbeddedId is linked to this ManyToOne relation
    @JoinColumn(name = "variation_option_id", nullable = false)
    private VariationOption variationOption;
}