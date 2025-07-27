<?php
namespace Controllers\Checkout;

use Controllers\PrivateController;
use Dao\Transactions\Transactions;
use Utilities\Security;
use Utilities\Site;

class History extends PrivateController
{
    public function run(): void
    {
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