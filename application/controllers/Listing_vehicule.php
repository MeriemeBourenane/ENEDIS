<?php

class Listing_vehicule extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('Model_BDD', 'Model_user', 'Model_listing_vehicule'));
        $this->load->helper('url_helper');

        // SESSION: ouvertures, fermetures etc
    }

    public function listing_vehicule()
    {

        $champs = array();

        $vehicules = $this->Model_listing_vehicule->select_all_vehicules();
        $types_vehicules = $this->Model_listing_vehicule->select_all_types_vehicules();

        $champs['vehicules'] = $vehicules;
        $champs['types_vehicules'] = $types_vehicules;

        $post = $this->input->post();

        if (isset($post['tri']))
        {
            // $vehicules = en fonction des options de tri
            
        }
        

        // tu load toutes tes view à la fin
        $this->load->view('templates/Header');
        $this->load->view('Listing_vehicule', $champs);
        $this->load->view('templates/Footer');
    }


}