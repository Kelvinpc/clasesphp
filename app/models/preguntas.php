<?php

require_once "../config/Database.php";

class preguntas{

  private $conexion;

  public function __construct() {
    $this->conexion = Database::getConexion();
  }
  
  /**
   * Devuelve un conjunto de productos contenidos en un arreglo
   * @return array
   */
  public function getAll(): array{
    $sql = "SELECT * FROM preguntas";

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


    $sql = "INSERT INTO preguntas(pregunta, puntaje, idevaluacion, fechacreacion, fechamodificacion)VALUES(?,?,?,?,?)"; //? = comodín (índice-ubicación)
    
    $stmt = $this->conexion->prepare($sql);
    $stmt->execute(
      array(

        $params['pregunta'],
        $params['puntaje'],
        $params['idevaluacion'],
        $params['fechacreacion'],
        $params['fechamodificacion']

      )
    );

    return $stmt->rowCount();
  }




}