<?php

namespace Controllers\Academic;

use Controllers\PublicController;
use Dao\Carros\Carros;
use Views\Renderer;
use Dao\Producto\Productos as ProductoDAO;
use Dao\Carros\Carros as CarrosDAO;  

class About extends PublicController
{
    private string $HolaMessage;
    public function run(): void
    {
        $productos = ProductoDAO::obtenerProductos();
        $this->HolaMessage = "Hola esto es un nuevo controlador";
        $carros = CarrosDAO::obtenerCarros();
        Renderer::render("academic/about", [
            "mensaje" => $this->HolaMessage,
            "productos" => $productos,
            "carros" => $carros,
        ]);
    }
}