<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class T_galeri extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('T_galeri_model');
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data = array('title' => 't_galeri');
        $q = urldecode($this->input->get('q', TRUE));
        $start = intval($this->input->get('start'));
        
        if ($q <> '') {
            $config['base_url'] = base_url() . 't_galeri/index.html?q=' . urlencode($q);
            $config['first_url'] = base_url() . 't_galeri/index.html?q=' . urlencode($q);
        } else {
            $config['base_url'] = base_url() . 't_galeri/index.html';
            $config['first_url'] = base_url() . 't_galeri/index.html';
        }

        $config['per_page'] = 10;
        $config['page_query_string'] = TRUE;
        $config['total_rows'] = $this->T_galeri_model->total_rows($q);
        $t_galeri = $this->T_galeri_model->get_limit_data($config['per_page'], $start, $q);

        $this->load->library('pagination');
        $this->pagination->initialize($config);

        $data = array(
            't_galeri_data' => $t_galeri,
            'q' => $q,
            'pagination' => $this->pagination->create_links(),
            'total_rows' => $config['total_rows'],
            'start' => $start,
        );
        $this->template->load('template','admin/t_galeri/t_galeri_list', $data);
    }

    public function read($id) 
    {
        $row = $this->T_galeri_model->get_by_id($id);
        if ($row) {
            $data = array(
                'title' => 'Read',
		'id' => $row->id,
		'id_pernikahan' => $row->id_pernikahan,
		'nama_foto' => $row->nama_foto,
		'judul' => $row->judul,
	    );
            $this->template->load('template','admin/t_galeri/t_galeri_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_galeri'));
        }
    }

    public function create() 
    {
        $data = array(
            'title' => 'Create',
            'button' => 'Create',
            'action' => site_url('admin/t_galeri/create_action'),
	    'id' => set_value('id'),
	    'id_pernikahan' => set_value('id_pernikahan'),
	    'nama_foto' => set_value('nama_foto'),
	    'judul' => set_value('judul'),
	);
        $this->template->load('template','admin/t_galeri/t_galeri_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'id_pernikahan' => $this->input->post('id_pernikahan',TRUE),
		'nama_foto' => $this->input->post('nama_foto',TRUE),
		'judul' => $this->input->post('judul',TRUE),
	    );

            $this->T_galeri_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/t_galeri'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->T_galeri_model->get_by_id($id);

        if ($row) {
            $data = array(
                'title' => 'Update',
                'button' => 'Update',
                'action' => site_url('admin/t_galeri/update_action'),
		'id' => set_value('id', $row->id),
		'id_pernikahan' => set_value('id_pernikahan', $row->id_pernikahan),
		'nama_foto' => set_value('nama_foto', $row->nama_foto),
		'judul' => set_value('judul', $row->judul),
	    );
            $this->template->load('template','admin/t_galeri/t_galeri_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_galeri'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
		'id_pernikahan' => $this->input->post('id_pernikahan',TRUE),
		'nama_foto' => $this->input->post('nama_foto',TRUE),
		'judul' => $this->input->post('judul',TRUE),
	    );

            $this->T_galeri_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('admin/t_galeri'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->T_galeri_model->get_by_id($id);

        if ($row) {
            $this->T_galeri_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/t_galeri'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/t_galeri'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('id_pernikahan', 'id pernikahan', 'trim|required');
	$this->form_validation->set_rules('nama_foto', 'nama foto', 'trim|required');
	$this->form_validation->set_rules('judul', 'judul', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file T_galeri.php */
/* Location: ./application/controllers/T_galeri.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2022-07-09 10:21:57 */
/* http://harviacode.com */