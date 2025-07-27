<?php

namespace Controllers\Usuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Usuarios\Usuarios as UsuariosDao;
use Utilities\Site;
use Utilities\Validators;

class Usuario extends PrivateController
{
    private $viewData = [];
    private $mode = "DSP";
    private $modeDescriptions = [
        "DSP" => "Detalle de %s %s",
        "INS" => "Nuevo Usuario",
        "UPD" => "Editar %s %s",
        "DEL" => "Eliminar %s %s"
    ];
    private $readonly = "";
    private $showCommitBtn = true;
    private $usuario = [
        "usercod" => 0,
        "username" => "",
        "useremail" => "",
        "userest" => "ACT"
    ];
    private $usuario_xss_token = "";

    public function run(): void
    {
        try {
            $this->getData();
            if ($this->isPostBack()) {
                if ($this->validateData()) {
                    $this->handlePostAction();
                }
            }
            $this->setViewData();
            Renderer::render("usuarios/usuario", $this->viewData);
        } catch (\Exception $ex) {
            Site::redirectToWithMsg(
                "index.php?page=Usuarios_Usuarios",
                $ex->getMessage()
            );
        }
    }

    private function getData()
    {
        $this->mode = $_GET["mode"] ?? "NOF";
        if (isset($this->modeDescriptions[$this->mode])) {
            $this->readonly = $this->mode === "DEL" ? "readonly" : "";
            $this->showCommitBtn = $this->mode !== "DSP";
            if ($this->mode !== "INS") {
                $this->usuario = UsuariosDao::getUsuarioById(intval($_GET["usercod"]));
                if (!$this->usuario) {
                    throw new \Exception("No se encontró el Usuario", 1);
                }
            }
        } else {
            throw new \Exception("Formulario cargado en modalidad invalida", 1);
        }
    }

    private function validateData()
    {
        if ($this->mode === "DEL") {
            $this->usuario["usercod"] = intval($_POST["usercod"] ?? "");
            return true;
        }

        $errors = [];
        $this->usuario_xss_token = $_POST["usuario_xss_token"] ?? "";
        $this->usuario["usercod"] = intval($_POST["usercod"] ?? "");
        $this->usuario["username"] = strval($_POST["username"] ?? "");
        $this->usuario["useremail"] = strval($_POST["useremail"] ?? "");
        $this->usuario["userest"] = strval($_POST["userest"] ?? "");

        if (Validators::IsEmpty($this->usuario["username"])) {
            $errors["username_error"] = "El nombre de usuario es requerido";
        }

        if (Validators::IsEmpty($this->usuario["useremail"])) {
            $errors["useremail_error"] = "El correo del usuario es requerido";
        }

        if (!in_array($this->usuario["userest"], ["ACT", "INA"])) {
            $errors["userest_error"] = "El estado del usuario es inválido";
        }

        if (count($errors) > 0) {
            foreach ($errors as $key => $value) {
                $this->usuario[$key] = $value;
            }
            return false;
        }
        return true;
    }

    private function handlePostAction()
    {
        switch ($this->mode) {
            case "INS":
                $this->handleInsert();
                break;
            case "UPD":
                $this->handleUpdate();
                break;
            case "DEL":
                $this->handleDelete();
                break;
            default:
                throw new \Exception("Modo invalido", 1);
        }
    }

    private function handleInsert()
    {
        $result = UsuariosDao::insertUsuario(
            $this->usuario["username"],
            $this->usuario["useremail"],
            $this->usuario["userest"]
        );
        if ($result > 0) {
            Site::redirectToWithMsg(
                "index.php?page=Usuarios_Usuarios",
                "Usuario creado exitosamente"
            );
        }
    }

    private function handleUpdate()
    {
        $result = UsuariosDao::updateUsuario(
            $this->usuario["usercod"],
            $this->usuario["username"],
            $this->usuario["useremail"],
            $this->usuario["userest"]
        );
        if ($result > 0) {
            Site::redirectToWithMsg(
                "index.php?page=Usuarios_Usuarios",
                "Usuario actualizado exitosamente"
            );
        }
    }

    private function handleDelete()
    {
        $result = UsuariosDao::deleteUsuario($this->usuario["usercod"]);
        if ($result > 0) {
            Site::redirectToWithMsg(
                "index.php?page=Usuarios_Usuarios",
                "Usuario Eliminado exitosamente"
            );
        }
    }

    private function setViewData(): void
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["usuario_xss_token"] = $this->usuario_xss_token;
        $this->viewData["FormTitle"] = sprintf(
            $this->modeDescriptions[$this->mode],
            $this->usuario["usercod"],
            $this->usuario["username"]
        );
        $this->viewData["showCommitBtn"] = $this->showCommitBtn;
        $this->viewData["readonly"] = $this->readonly;

        $userestKey = "userest_" . strtolower($this->usuario["userest"]);
        $this->usuario[$userestKey] = "selected";

        $this->viewData["usuario"] = $this->usuario;
    }
}
