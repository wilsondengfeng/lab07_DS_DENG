package com.example.proveedores.service;

import com.example.proveedores.domain.Proveedor;
import com.example.proveedores.dto.ProveedorRequest;
import com.example.proveedores.repository.ProveedorRepository;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ProveedorService {

    private final ProveedorRepository repository;

    public ProveedorService(ProveedorRepository repository) {
        this.repository = repository;
    }

    public List<Proveedor> listar() {
        return repository.findAll(Sort.by(Sort.Direction.ASC, "id"));
    }

    public Proveedor obtener(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Proveedor no encontrado"));
    }

    public Proveedor crear(ProveedorRequest request) {
        Proveedor proveedor = new Proveedor();
        copiarDatos(proveedor, request);
        return repository.save(proveedor);
    }

    public Proveedor actualizar(Long id, ProveedorRequest request) {
        Proveedor existente = obtener(id);
        copiarDatos(existente, request);
        return repository.save(existente);
    }

    public void eliminar(Long id) {
        Proveedor existente = obtener(id);
        repository.delete(existente);
    }

    private void copiarDatos(Proveedor destino, ProveedorRequest origen) {
        destino.setRuc(origen.ruc());
        destino.setRazonSocial(origen.razonSocial());
        destino.setContacto(origen.contacto());
        destino.setCorreo(origen.correo());
        destino.setTelefono(origen.telefono());
    }
}
