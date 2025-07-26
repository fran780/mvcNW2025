<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Cart\Cart;
use Utilities\Security;
use Utilities\Site;

class Checkout extends PublicController
{
    public function run(): void
    {
         Site::addLink("public/css/products.css");
        // ✅ Verificar si el usuario está logueado
        if (!Security::isLogged()) {
            Site::redirectTo("index.php?page=Sec_Login&redirect=Checkout_Checkout");
            return;
        }

        $viewData = [];

        // ✅ Obtener la carretilla actual del usuario logueado
        $carretilla = Cart::getAuthCart(Security::getUserId());

        if ($this->isPostBack()) {
            // ✅ Cancelar compra y vaciar carretilla
            if (isset($_POST["cancelPurchase"])) {
                Cart::clearCart(Security::getUserId());
                \Utilities\Context::setContext("CART_ITEMS", 0);
                Site::redirectTo("index.php?page=Index");
                return;
            }

               // ✅ Procesar pago
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost/negociosweb/mvc/index.php?page=Checkout_Error",
                "http://localhost/negociosweb/mvc/index.php?page=Checkout_Accept"
            );


                if (!is_array($carretilla)) {
                    $carretilla = [];
                }

                $viewData["carretilla"] = $carretilla;

                foreach ($viewData["carretilla"] as $producto) {
                    $PayPalOrder->addItem(
                        $producto["productName"],
                        $producto["productDescription"],
                        $producto["productId"],
                        $producto["crrprc"],
                        0,
                        $producto["crrctd"],
                        "DIGITAL_GOODS"
                    );
                }

                $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                    \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                    \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
                );
                $PayPalRestApi->getAccessToken();
                $response = $PayPalRestApi->createOrder($PayPalOrder);

                $_SESSION["orderid"] = $response->id;

                foreach ($response->links as $link) {
                    if ($link->rel == "approve") {
                        Site::redirectTo($link->href);
                    }
                }
                die();
            }

        // ✅ Preparar datos para la vista
        $finalCarretilla = [];
        $counter = 1;
        $total = 0;

        foreach ($carretilla as $prod) {
            $prod["row"] = $counter;
            $prod["subtotal"] = number_format($prod["crrprc"] * $prod["crrctd"], 2);
            $total += $prod["crrprc"] * $prod["crrctd"];
            $prod["crrprc"] = number_format($prod["crrprc"], 2);
            $finalCarretilla[] = $prod;
            $counter++;
        }

        $viewData["carretilla"] = $finalCarretilla;
        $viewData["total"] = number_format($total, 2);

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
