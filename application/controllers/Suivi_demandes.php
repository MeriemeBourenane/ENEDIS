<?php

class Suivi_demandes extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('Model_BDD', 'Model_user'));
        $this->load->helper('url_helper');

        // SESSION
    }

    public function suivi_demandes()
    {

        
        $this->load->view('templates/Header');
        $this->load->view('suivi_demandes/Suivi');
        $this->load->view('suivi_demandes/Modal_confirme');
        $this->load->view('suivi_demandes/Modal_supprime');
        $this->load->view('suivi_demandes/Modal_retour');
        $this->load->view('templates/Footer');
    }


}