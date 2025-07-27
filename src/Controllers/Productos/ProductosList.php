<?php

namespace Controllers\Productos;

use Controllers\PublicController;
use Dao\Productos\Productos as DaoProductos;
use Utilities\Context;
use Utilities\Paging;
use Views\Renderer;

class ProductosList extends PublicController
{
    private $partialName = "";
    private $status = "";
    private $pageNumber = 1;
    private $itemsPerPage = 10;
    private $productos = [];
    private $total = 0;
    private $pages = 0;
    private $viewData = [];

    public function run(): void
    {
        $this->getParamsFromContext();
        $this->getParams();

        $result = DaoProductos::getProductos(
            $this->partialName,
            $this->status,
            $this->pageNumber - 1,
            $this->itemsPerPage
        );

        $this->productos = $result["productos"];
        $this->total = $result["total"];
        $this->pages = max(1, ceil($this->total / $this->itemsPerPage));

        if ($this->pageNumber > $this->pages) {
            $this->pageNumber = $this->pages;
        }

        $this->setParamsToContext();
        $this->prepareViewData();

        Renderer::render("productos/productos_list", $this->viewData);
    }

    private function getParams(): void
    {
        $this->partialName = $_GET["partialName"] ?? $this->partialName;
        $this->status = $_GET["status"] ?? $this->status;

        if ($this->status === "EMP") {
            $this->status = "";
        }

        $this->pageNumber = intval($_GET["pageNum"] ?? $this->pageNumber);
        $this->itemsPerPage = intval($_GET["itemsPerPage"] ?? $this->itemsPerPage);
    }

    private function getParamsFromContext(): void
    {
        $this->partialName = Context::getContextByKey("productos_partialName");
        $this->status = Context::getContextByKey("productos_status");
        $this->pageNumber = intval(Context::getContextByKey("productos_page"));
        $this->itemsPerPage = intval(Context::getContextByKey("productos_itemsPerPage"));
    }

    private function setParamsToContext(): void
    {
        Context::setContext("productos_partialName", $this->partialName, true);
        Context::setContext("productos_status", $this->status, true);
        Context::setContext("productos_page", $this->pageNumber, true);
        Context::setContext("productos_itemsPerPage", $this->itemsPerPage, true);
    }

    private function prepareViewData(): void
    {
        $this->viewData["partialName"] = $this->partialName;
        $this->viewData["status"] = $this->status;
        $this->viewData["pageNum"] = $this->pageNumber;
        $this->viewData["itemsPerPage"] = $this->itemsPerPage;
        $this->viewData["productos"] = $this->productos;

        $statusKey = "status_" . ($this->status === "" ? "EMP" : $this->status);
        $this->viewData[$statusKey] = "selected";

        $this->viewData["pagination"] = Paging::getPagination(
            $this->total,
            $this->itemsPerPage,
            $this->pageNumber,
            "index.php?page=Productos_ProductosList",
            "Productos_ProductosList"
        );
    }
}
