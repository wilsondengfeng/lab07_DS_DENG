package com.example.clientes.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record ClienteRequest(
        @NotBlank
        @Size(max = 20)
        String documento,

        @NotBlank
        @Size(max = 120)
        String nombreCompleto,

        @Email
        @NotBlank
        @Size(max = 120)
        String email,

        @NotBlank
        @Size(max = 30)
        @Pattern(regexp = "^[+0-9\\s-]+$", message = "Solo numeros, espacios y guiones")
        String telefono
) {
}
