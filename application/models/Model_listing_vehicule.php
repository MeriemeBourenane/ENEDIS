<?php

class Model_listing_vehicule extends CI_Model
{
    public function __construct()
    {
        // avec ça, ta connexion à la BDD est completement faite
        $this->load->database();
    }
    
    public function select_one_vehicule($id_vehicule = false)
    {
        $where = array('v.id_vehicule = ' => $id_vehicule);
        $one_vehicule = $this->select_all_vehicules($where);

        return current($one_vehicule);
    }

    public function select_all_vehicules($where = false)
    {
        $this->db->select('
                    v.id_vehicule,
                    v.plaque_immatriculation,
                    v.modele,
                    v.marque,
                    v.statut,
                    v.id_type
        ');
        $this->db->select('tv.libelle');
        $this->db->from('vehicule v');
        $this->db->join('type_vehicule tv', 'tv.id_type = v.id_type');

        // exemple: $where = array('v.id_type = ' => 1)
        if ($where)
        {
            foreach ($where as $champ => $valeur)
            {
                if (!is_array($valeur))
                {
                    $this->db->where($champ, $valeur);
                }
                else
                {
                    $this->db->where_in($champ, $valeur);
                }
            }
        }

        return $this->db->get()->result_array();
    }

    public function select_one_type_vehicule($id_type = false)
    {
        $where = array('tv.id_type = ' => $id_type);
        $one_type_vehicule = $this->select_all_types_vehicules($where);

        return current($one_type_vehicule);
    }

    public function select_all_types_vehicules($where = false)
    {
        $this->db->select('
                    tv.id_type,
                    tv.libelle
        ');

        $this->db->from('type_vehicule tv');

        // exemple: $where = array('tv.id_type = ' => 1)
        if ($where)
        {
            foreach ($where as $champ => $valeur)
            {
                if (!is_array($valeur))
                {
                    $this->db->where($champ, $valeur);
                }
                else
                {
                    $this->db->where_in($champ, $valeur);
                }
            }
        }
        
        return $this->db->get()->result_array();
    }
}
