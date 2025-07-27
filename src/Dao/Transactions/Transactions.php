<?php
namespace Dao\Transactions;

use Dao\Table;

class Transactions extends Table
{
    public static function addTransaction(
        int $usercod,
        string $orderId,
        string $status,
        float $amount,
        string $currency,
        string $orderJson
    ) {
        $sqlstr = "INSERT INTO transactions (usercod, orderid, transdate, transstatus, amount, currency, orderjson) VALUES (:usercod, :orderid, NOW(), :transstatus, :amount, :currency, :orderjson);";
        return self::executeNonQuery(
            $sqlstr,
            [
                'usercod' => $usercod,
                'orderid' => $orderId,
                'transstatus' => $status,
                'amount' => $amount,
                'currency' => $currency,
                'orderjson' => $orderJson
            ]
        );
    }

    public static function getByUser(int $usercod)
    {
        $sqlstr = "SELECT transactionId, orderid, transdate, transstatus, amount, currency FROM transactions WHERE usercod = :usercod ORDER BY transdate DESC;";
        return self::obtenerRegistros($sqlstr, ['usercod' => $usercod]);
    }
    
       public static function getById(int $transactionId)
    {
        $sqlstr = "SELECT * FROM transactions WHERE transactionId = :transactionId;";
        return self::obtenerUnRegistro($sqlstr, ['transactionId' => $transactionId]);
    }
}
?>