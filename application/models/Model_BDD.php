<?php

class Model_BDD extends CI_Model
{
    public function __construct()
    {
        // avec ça, ta connexion à la BDD est completement faite
        $this->load->database();
    }

    // modeles
    
    //getteur and setteur 
    public function getTable()
    {
        return $this->table;
    }
        
    public function setTable($table)
    {
        $this->table = $table;
    }
}