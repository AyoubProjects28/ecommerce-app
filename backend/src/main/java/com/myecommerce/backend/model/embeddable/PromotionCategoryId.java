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
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class PromotionCategoryId implements Serializable {

    @Column(name = "category_id")
    private Integer categoryId;

    @Column(name = "promotion_id")
    private Integer promotionId;
}