<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Page extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Page_model');
        $this->load->library('form_validation');        
	$this->load->library('datatables');
    }

    public function index()
    {
        $data = array('title' => 'page');
        $this->template->load('template','admin/page/page_list', $data);
    } 
    
    public function json() {
        header('Content-Type: application/json');
        echo $this->Page_model->json();
    }

    public function read($id) 
    {
        $row = $this->Page_model->get_by_id($id);
        if ($row) {
            $data = array(
                'title' => 'Read',
		'id_page' => $row->id_page,
		'link' => $row->link,
		'judul' => $row->judul,
		'deskripsi' => $row->deskripsi,
		'foto' => $row->foto,
		'enum' => $row->enum,
	    );
            $this->template->load('template','admin/page/page_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/page'));
        }
    }

    public function create() 
    {
        $data = array(
            'title' => 'Create',
            'button' => 'Create',
            'action' => site_url('admin/page/create_action'),
	    'id_page' => set_value('id_page'),
	    'link' => set_value('link'),
	    'judul' => set_value('judul'),
	    'deskripsi' => set_value('deskripsi'),
	    'foto' => set_value('foto'),
	    'enum' => set_value('enum'),
	);
        $this->template->load('template','admin/page/page_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $config = array(
                'upload_path' => 'gambar',
                'allowed_types' => 'gif|jpg|jpeg|png',
                'file_name' => rand(10,1000).'art_'.date('dmYHis'),
                'overwrite' => FALSE,
                'max_size' => 2048,   
                'file_ext_tolower' => TRUE,    
                'max_filename' => 0,
                'remove_spaces' => TRUE             
            );
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            $fot = (!$this->upload->do_upload('foto')) ? 'default.png' : $this->upload->file_name;
            $data = array(
        		'link' => str_replace(" ","-",$this->input->post('judul',TRUE)),
        		'judul' => $this->input->post('judul',TRUE),
        		'deskripsi' => $this->input->post('deskripsi',TRUE),
        		'foto' => $fot,
        		'enum' => "y",
    	    );

            $this->Page_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('admin/page'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Page_model->get_by_id($id);

        if ($row) {
            $data = array(
                'title' => 'Update',
                'button' => 'Update',
                'action' => site_url('admin/page/update_action'),
		'id_page' => set_value('id_page', $row->id_page),
		'link' => set_value('link', $row->link),
		'judul' => set_value('judul', $row->judul),
		'deskripsi' => set_value('deskripsi', $row->deskripsi),
		'foto' => set_value('foto', $row->foto),
		'enum' => set_value('enum', $row->enum),
	    );
            $this->template->load('template','admin/page/page_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/page'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id_page', TRUE));
        } else {
            $config = array(
                'upload_path' => 'gambar',
                'allowed_types' => 'gif|jpg|jpeg|png',
                'file_name' => rand(10,1000).'art_'.date('dmYHis'),
                'overwrite' => FALSE,
                'max_size' => 2048,   
                'file_ext_tolower' => TRUE,    
                'max_filename' => 0,
                'remove_spaces' => TRUE             
            );
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            $data = array(
        		'link' => str_replace(" ","-",$this->input->post('judul',TRUE)),
        		'judul' => $this->input->post('judul',TRUE),
        		'deskripsi' => $this->input->post('deskripsi',TRUE),
        	);
            if ($this->upload->do_upload('foto')) {
                $data['foto'] = $this->upload->file_name;
            }

            $this->Page_model->update($this->input->post('id_page', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('admin/page'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Page_model->get_by_id($id);

        if ($row) {
            $this->Page_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('admin/page'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('admin/page'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('judul', 'judul', 'trim|required');
	$this->form_validation->set_rules('deskripsi', 'deskripsi', 'trim|required');

	$this->form_validation->set_rules('id_page', 'id_page', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file Page.php */
/* Location: ./application/controllers/Page.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2021-06-19 06:28:20 */
/* http://harviacode.com */