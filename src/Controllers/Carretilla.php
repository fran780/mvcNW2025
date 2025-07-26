<?php

namespace Controllers;

class Carretilla extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $carretilla = \Utilities\Security::isLogged()
            ? \Dao\Cart\Cart::getAuthCart(\Utilities\Security::getUserId())
            : \Dao\Cart\Cart::getAnonCart(\Utilities\Cart\CartFns::getAnnonCartCode());

        $total = 0;
        foreach ($carretilla as $index => &$item) {
            $item["row"] = $index + 1;
            $item["subtotal"] = number_format($item["crrctd"] * $item["crrprc"], 2);
            $total += $item["crrctd"] * $item["crrprc"];
        }

        $viewData["carretilla"] = $carretilla;
        $viewData["total"] = number_format($total, 2);

        \Views\Renderer::render("carretilla", $viewData);
    }
}
