<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Services extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'services Wedding';
        $this->load->view('wFront/templates/header', $data);
        $this->load->view('wFront/services');
        $this->load->view('wFront/templates/footer');
    }
}
