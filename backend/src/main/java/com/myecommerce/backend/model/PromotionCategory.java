package com.myecommerce.backend.model;

import com.myecommerce.backend.model.embeddable.PromotionCategoryId;
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
@Table(name = "promotion_category")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PromotionCategory {

    @EmbeddedId
    private PromotionCategoryId id;

    @ManyToOne
    @MapsId("categoryId") // Link the productCategory field with the categoryId in PromotionCategoryId
    @JoinColumn(name = "category_id", nullable = false)
    private ProductCategory productCategory;

    @ManyToOne
    @MapsId("promotionId") // Link the promotion field with the promotionId in PromotionCategoryId
    @JoinColumn(name = "promotion_id", nullable = false)
    private Promotion promotion;
}