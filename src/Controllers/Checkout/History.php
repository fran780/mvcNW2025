<?php
namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Transactions\Transactions;
use Utilities\Security;
use Utilities\Site;

class History extends PublicController
{
    public function run(): void
    {
        if (!Security::isLogged()) {
            Site::redirectTo("index.php?page=Sec_Login&redirect=Checkout_History");
            return;
        }
        $userId = Security::getUserId();
        $transactions = Transactions::getByUser($userId);
        foreach ($transactions as &$txn) {
            $date = new \DateTime($txn['transdate']);
            $txn['transdate'] = $date->format('Y-m-d');
        }
        \Views\Renderer::render("paypal/history", [
            'transactions' => $transactions
        ]);
    }
}