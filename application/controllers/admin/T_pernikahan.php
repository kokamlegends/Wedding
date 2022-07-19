<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class T_pernikahan extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('T_pernikahan_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data = array('title' => 't_pernikahan');
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 't_pernikahan/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 't_pernikahan/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 't_pernikahan/index.html';
            $config['first_url'] = base_url() . 't_pernikahan/index.html';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->T_pernikahan_model->total_rows($q);
        $t_pernikahan = $this->T_pernikahan_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            't_pernikahan_data' => $t_pernikahan,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','admin/t_pernikahan/t_pernikahan_list', $data);
    }

    public function read($id) 
    {
        $row = $this->T_pernikahan_model->get_by_id($id);
        if ($row) {
            $data = array(
                'title' => 'Read',
		'id' => $row->id,
		'nama_lengkap_p' => $row->nama_lengkap_p,
		'nama_panggilan_p' => $row->nama_panggilan_p,
		'nama_lengkap_w' => $row->nama_lengkap_w,
		'nama_panggilan_w' => $row->nama_panggilan_w,
		'tanggal_pernikahan' => $row->tanggal_pernikahan,
		'alamat_pernikahan' => $row->alamat_pernikahan,
		'waktu_mulai' => $row->waktu_mulai,
		'waktu_selesai' => $row->waktu_selesai,
		'id_user' => $row->id_user,
		'status' => $row->status,
	    );
            $this->template->load('template','admin/t_pernikahan/t_pernikahan_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_pernikahan'));
        }
    }

    public function create() 
    {
        $data = array(
            'title' => 'Create',
            'button' => 'Create',
            'action' => site_url('admin/t_pernikahan/create_action'),
	    'id' => set_value('id'),
	    'nama_lengkap_p' => set_value('nama_lengkap_p'),
	    'nama_panggilan_p' => set_value('nama_panggilan_p'),
	    'nama_lengkap_w' => set_value('nama_lengkap_w'),
	    'nama_panggilan_w' => set_value('nama_panggilan_w'),
	    'tanggal_pernikahan' => set_value('tanggal_pernikahan'),
	    'alamat_pernikahan' => set_value('alamat_pernikahan'),
	    'waktu_mulai' => set_value('waktu_mulai'),
	    'waktu_selesai' => set_value('waktu_selesai'),
	    'id_user' => set_value('id_user'),
	    'status' => set_value('status'),
	);
        $this->template->load('template','admin/t_pernikahan/t_pernikahan_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'nama_lengkap_p' => $this->input->post('nama_lengkap_p',TRUE),
		'nama_panggilan_p' => $this->input->post('nama_panggilan_p',TRUE),
		'nama_lengkap_w' => $this->input->post('nama_lengkap_w',TRUE),
		'nama_panggilan_w' => $this->input->post('nama_panggilan_w',TRUE),
		'tanggal_pernikahan' => $this->input->post('tanggal_pernikahan',TRUE),
		'alamat_pernikahan' => $this->input->post('alamat_pernikahan',TRUE),
		'waktu_mulai' => $this->input->post('waktu_mulai',TRUE),
		'waktu_selesai' => $this->input->post('waktu_selesai',TRUE),
		'id_user' => $this->input->post('id_user',TRUE),
		'status' => $this->input->post('status',TRUE),
	    );

            $this->T_pernikahan_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/t_pernikahan'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->T_pernikahan_model->get_by_id($id);

        if ($row) {
            $data = array(
                'title' => 'Update',
                'button' => 'Update',
                'action' => site_url('admin/t_pernikahan/update_action'),
		'id' => set_value('id', $row->id),
		'nama_lengkap_p' => set_value('nama_lengkap_p', $row->nama_lengkap_p),
		'nama_panggilan_p' => set_value('nama_panggilan_p', $row->nama_panggilan_p),
		'nama_lengkap_w' => set_value('nama_lengkap_w', $row->nama_lengkap_w),
		'nama_panggilan_w' => set_value('nama_panggilan_w', $row->nama_panggilan_w),
		'tanggal_pernikahan' => set_value('tanggal_pernikahan', $row->tanggal_pernikahan),
		'alamat_pernikahan' => set_value('alamat_pernikahan', $row->alamat_pernikahan),
		'waktu_mulai' => set_value('waktu_mulai', $row->waktu_mulai),
		'waktu_selesai' => set_value('waktu_selesai', $row->waktu_selesai),
		'id_user' => set_value('id_user', $row->id_user),
		'status' => set_value('status', $row->status),
	    );
            $this->template->load('template','admin/t_pernikahan/t_pernikahan_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_pernikahan'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
		'nama_lengkap_p' => $this->input->post('nama_lengkap_p',TRUE),
		'nama_panggilan_p' => $this->input->post('nama_panggilan_p',TRUE),
		'nama_lengkap_w' => $this->input->post('nama_lengkap_w',TRUE),
		'nama_panggilan_w' => $this->input->post('nama_panggilan_w',TRUE),
		'tanggal_pernikahan' => $this->input->post('tanggal_pernikahan',TRUE),
		'alamat_pernikahan' => $this->input->post('alamat_pernikahan',TRUE),
		'waktu_mulai' => $this->input->post('waktu_mulai',TRUE),
		'waktu_selesai' => $this->input->post('waktu_selesai',TRUE),
		'id_user' => $this->input->post('id_user',TRUE),
		'status' => $this->input->post('status',TRUE),
	    );

            $this->T_pernikahan_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('admin/t_pernikahan'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->T_pernikahan_model->get_by_id($id);

        if ($row) {
            $this->T_pernikahan_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/t_pernikahan'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_pernikahan'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('nama_lengkap_p', 'nama lengkap p', 'trim|required');
	$this->form_validation->set_rules('nama_panggilan_p', 'nama panggilan p', 'trim|required');
	$this->form_validation->set_rules('nama_lengkap_w', 'nama lengkap w', 'trim|required');
	$this->form_validation->set_rules('nama_panggilan_w', 'nama panggilan w', 'trim|required');
	$this->form_validation->set_rules('tanggal_pernikahan', 'tanggal pernikahan', 'trim|required');
	$this->form_validation->set_rules('alamat_pernikahan', 'alamat pernikahan', 'trim|required');
	$this->form_validation->set_rules('waktu_mulai', 'waktu mulai', 'trim|required');
	$this->form_validation->set_rules('waktu_selesai', 'waktu selesai', 'trim|required');
	$this->form_validation->set_rules('id_user', 'id user', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file T_pernikahan.php */
/* Location: ./application/controllers/T_pernikahan.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2022-07-09 08:29:43 */
/* http://harviacode.com */