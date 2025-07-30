<?php

namespace Utilities;

use Dao\Security\Security as DaoSecurity;

class Security
{
    private function __construct() {}
    private function __clone() {}
    public static function logout()
    {
        unset($_SESSION["login"]);
        // permite que las cookies no molesten al usuario
        \Utilities\Nav::invalidateNavData();
    }
    public static function login($userId, $userName, $userEmail)
    {
        $_SESSION["login"] = array(
            "isLogged" => true,
            "userId" => $userId,
            "userName" => $userName,
            "userEmail" => $userEmail
        );
        //permite que las cookies no molesten al usuario
        \Utilities\Nav::invalidateNavData();
    }
    public static function isLogged(): bool
    {
        return isset($_SESSION["login"]) && $_SESSION["login"]["isLogged"];
    }
    public static function getUser()
    {
        if (isset($_SESSION["login"])) {
            return $_SESSION["login"];
        }
        return false;
    }
    public static function getUserId()
    {
        if (isset($_SESSION["login"])) {
            return $_SESSION["login"]["userId"];
        }
        return 0;
    }
    public static function isAuthorized($userId, $function, $type = 'FNC'): bool
    {
        if (\Utilities\Context::getContextByKey("DEVELOPMENT") == "1") {
            $functionInDb = DaoSecurity::getFeature($function);
            if (!$functionInDb) {
                DaoSecurity::addNewFeature($function, $function, "ACT", $type);
            }
        }
        return DaoSecurity::getFeatureByUsuario($userId, $function);
    }
    public static function isInRol($userId, $rol): bool
    {
        if (\Utilities\Context::getContextByKey("DEVELOPMENT") == "1") {
            $rolInDb = DaoSecurity::getRol($rol);
            if (!$rolInDb) {
                DaoSecurity::addNewRol($rol, $rol, "ACT");
            }
        }
        return DaoSecurity::isUsuarioInRol($userId, $rol);
    }

    // sirve para ocultar carrito y precios a admin y eci
    public static function isAdminOrEci($userId = null): bool
    {
        if ($userId === null) {
            $userId = self::getUserId();
        }
        if (!$userId) {
            return false;
        }
        return self::isInRol($userId, 'ADMIN') || self::isInRol($userId, 'ECI');
    }
}
