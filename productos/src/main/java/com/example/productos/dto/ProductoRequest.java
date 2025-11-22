package com.example.productos.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;

public record ProductoRequest(
        @NotBlank
        @Size(max = 30)
        String codigo,

        @NotBlank
        @Size(max = 120)
        String nombre,

        @NotBlank
        @Size(max = 80)
        String categoria,

        @DecimalMin(value = "0.01")
        BigDecimal precio
) {
}
