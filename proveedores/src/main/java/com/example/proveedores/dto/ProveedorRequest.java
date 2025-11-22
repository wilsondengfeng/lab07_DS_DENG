package com.example.proveedores.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record ProveedorRequest(
        @NotBlank
        @Size(max = 20)
        String ruc,

        @NotBlank
        @Size(max = 140)
        String razonSocial,

        @NotBlank
        @Size(max = 120)
        String contacto,

        @Email
        @NotBlank
        @Size(max = 100)
        String correo,

        @NotBlank
        @Size(max = 30)
        @Pattern(regexp = "^[+0-9\\s-]+$", message = "Solo numeros, espacios y guiones")
        String telefono
) {
}
