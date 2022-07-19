<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Gallery extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Index Wedding';
        $this->load->view('wFront/templates/header', $data);
        $this->load->view('wFront/gallery');
        $this->load->view('wFront/templates/footer');
    }
}
