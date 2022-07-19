<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Story extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Story Wedding';
        $this->load->view('wFront/templates/header', $data);
        $this->load->view('wFront/story');
        $this->load->view('wFront/templates/footer');
    }
}
