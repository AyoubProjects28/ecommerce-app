package com.myecommerce.backend.model;

import com.myecommerce.backend.model.embeddable.UserAddressId;
import jakarta.persistence.Column;
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
@Table(name = "user_address")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserAddress {

    @EmbeddedId
    private UserAddressId id;

    @ManyToOne
    @MapsId("userId") // Link the user field with the userId in UserAddressId
    @JoinColumn(name = "user_id", nullable = false)
    private SiteUser user;

    @ManyToOne
    @MapsId("addressId") // Link the address field with the addressId in UserAddressId
    @JoinColumn(name = "address_id", nullable = false)
    private Address address;

    @Column(name = "is_default", nullable = false)
    private boolean isDefault;
}