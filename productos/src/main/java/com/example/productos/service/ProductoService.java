package com.example.productos.service;

import com.example.productos.domain.Producto;
import com.example.productos.dto.ProductoRequest;
import com.example.productos.repository.ProductoRepository;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ProductoService {

    private final ProductoRepository repository;

    public ProductoService(ProductoRepository repository) {
        this.repository = repository;
    }

    public List<Producto> listar() {
        return repository.findAll(Sort.by(Sort.Direction.ASC, "id"));
    }

    public Producto obtener(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Producto no encontrado"));
    }

    public Producto crear(ProductoRequest request) {
        Producto producto = new Producto();
        copiarDatos(producto, request);
        return repository.save(producto);
    }

    public Producto actualizar(Long id, ProductoRequest request) {
        Producto existente = obtener(id);
        copiarDatos(existente, request);
        return repository.save(existente);
    }

    public void eliminar(Long id) {
        Producto existente = obtener(id);
        repository.delete(existente);
    }

    private void copiarDatos(Producto destino, ProductoRequest origen) {
        destino.setCodigo(origen.codigo());
        destino.setNombre(origen.nombre());
        destino.setCategoria(origen.categoria());
        destino.setPrecio(origen.precio());
    }
}
