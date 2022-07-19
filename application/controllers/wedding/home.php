<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('T_pernikahan_model');
    }

    public function index($id)
    {
        // $id = 1;
        $row = $this->T_pernikahan_model->get_by_id($id);
        $row2 = $this->T_pernikahan_model->get_all_gallery($id);
        if ($row) {
            $date1 = date_create($row->waktu_mulai);
            $waktu_mulai = date_format($date1, "H:i");
            $date2 = date_create($row->waktu_selesai);
            $waktu_selesai = date_format($date2, "H:i");
            $date3 = date_create($row->tanggal_pernikahan);
            $tanggal_pernikahan = date_format($date3, "l, d  F Y");
            $datas = array(
                'title' => 'Read',
                'id' => $row->id,
                'nama_lengkap_p' => $row->nama_lengkap_p,
                'nama_panggilan_p' => $row->nama_panggilan_p,
                'nama_lengkap_w' => $row->nama_lengkap_w,
                'nama_panggilan_w' => $row->nama_panggilan_w,
                'tanggal_pernikahan' => $tanggal_pernikahan,
                'alamat_pernikahan' => $row->alamat_pernikahan,
                'waktu_mulai' => $waktu_mulai,
                'waktu_selesai' => $waktu_selesai,
                'id_user' => $row->id_user,
                'status' => $row->status,
                'gallery' => $row2
            );
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('wedding/home'));
        }

        $data['title'] = 'Index Wedding';
        $this->load->view('wFront/templates/header', $data);
        $this->load->view('wFront/home', $datas);
        $this->load->view('wFront/templates/footer');
    }
}
