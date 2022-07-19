<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Contact extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Index Wedding';
        $this->load->view('wFront/templates/header', $data);
        $this->load->view('wFront/contact');
        $this->load->view('wFront/templates/footer');
    }
}
