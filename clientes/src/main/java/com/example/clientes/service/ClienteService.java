package com.example.clientes.service;

import com.example.clientes.domain.Cliente;
import com.example.clientes.dto.ClienteRequest;
import com.example.clientes.repository.ClienteRepository;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class ClienteService {

    private final ClienteRepository repository;

    public ClienteService(ClienteRepository repository) {
        this.repository = repository;
    }

    public List<Cliente> listar() {
        return repository.findAll(Sort.by(Sort.Direction.ASC, "id"));
    }

    public Cliente obtener(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cliente no encontrado"));
    }

    public Cliente crear(ClienteRequest request) {
        Cliente cliente = new Cliente();
        copiarDatos(cliente, request);
        return repository.save(cliente);
    }

    public Cliente actualizar(Long id, ClienteRequest request) {
        Cliente existente = obtener(id);
        copiarDatos(existente, request);
        return repository.save(existente);
    }

    public void eliminar(Long id) {
        Cliente existente = obtener(id);
        repository.delete(existente);
    }

    private void copiarDatos(Cliente destino, ClienteRequest origen) {
        destino.setDocumento(origen.documento());
        destino.setNombreCompleto(origen.nombreCompleto());
        destino.setEmail(origen.email());
        destino.setTelefono(origen.telefono());
    }
}
