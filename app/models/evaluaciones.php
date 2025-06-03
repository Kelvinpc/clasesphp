<?php

require_once "../config/Database.php";

class evaluaciones{

  private $conexion;

  public function __construct() {
    $this->conexion = Database::getConexion();
  }
  
  /**
   * Devuelve un conjunto de productos contenidos en un arreglo
   * @return array
   */
  public function getAll(): array{
    $sql = "SELECT * FROM evaluaciones";

    
    
    $stmt = $this->conexion->prepare($sql);
    $stmt->execute();

    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  /**
   * Registra un nuevo curso en la BD
   * @param mixed $params
   * @return int
   */
  public function add($params = []): int{



    $sql = "INSERT INTO (titulo, preguntas, intentosDisponible, fechainicio, fechafin, duracion, idcurso, fechacreacion, fechamodificacion)VALUES(?,?,?,?,?,?,?,?,?)"; //? = comodín (índice-ubicación)
    
    $stmt = $this->conexion->prepare($sql);
    $stmt->execute(
      array(
        $params["titulo, preguntas, intentosDisponible, fechainicio, fechafin, duracion, idcurso, fechacreacion, fechamodificacion"]

      )
    );

    return $stmt->rowCount();
  }




}