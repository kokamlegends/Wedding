<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class T_pernikahan_model extends CI_Model
{

    public $table = 't_pernikahan';
    public $id = 'id';
    public $order = 'DESC';
    public $table2 = 't_galeri';

    function __construct()
    {
        parent::__construct();
    }

    // get all
    function get_all()
    {
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table)->result();
    }

    // get all tabel gallery
    function get_all_gallery($id)
    {
        $this->db->where('id_pernikahan', $id);
        $this->db->order_by($this->id, $this->order);
        return $this->db->get($this->table2)->result();
    }

    // get data by id
    function get_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table)->row();
    }

    // get data gallery by id
    function get_gallery_by_id($id)
    {
        $this->db->where($this->id, $id);
        return $this->db->get($this->table2)->row();
    }

    // get total rows
    function total_rows($q = NULL)
    {
        $this->db->like('id', $q);
        $this->db->or_like('nama_lengkap_p', $q);
        $this->db->or_like('nama_panggilan_p', $q);
        $this->db->or_like('nama_lengkap_w', $q);
        $this->db->or_like('nama_panggilan_w', $q);
        $this->db->or_like('tanggal_pernikahan', $q);
        $this->db->or_like('alamat_pernikahan', $q);
        $this->db->or_like('waktu_mulai', $q);
        $this->db->or_like('waktu_selesai', $q);
        $this->db->or_like('id_user', $q);
        $this->db->or_like('status', $q);
        $this->db->from($this->table);
        return $this->db->count_all_results();
    }

    // get data with limit and search
    function get_limit_data($limit, $start = 0, $q = NULL)
    {
        $this->db->order_by($this->id, $this->order);
        $this->db->like('id', $q);
        $this->db->or_like('nama_lengkap_p', $q);
        $this->db->or_like('nama_panggilan_p', $q);
        $this->db->or_like('nama_lengkap_w', $q);
        $this->db->or_like('nama_panggilan_w', $q);
        $this->db->or_like('tanggal_pernikahan', $q);
        $this->db->or_like('alamat_pernikahan', $q);
        $this->db->or_like('waktu_mulai', $q);
        $this->db->or_like('waktu_selesai', $q);
        $this->db->or_like('id_user', $q);
        $this->db->or_like('status', $q);
        $this->db->limit($limit, $start);
        return $this->db->get($this->table)->result();
    }

    // insert data
    function insert($data)
    {
        $this->db->insert($this->table, $data);
    }

    // insert data gallery
    function insert_gallery($data)
    {
        $this->db->insert($this->table2, $data);
    }

    // update data
    function update($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table, $data);
    }

    // update data gallery
    function update_gallery($id, $data)
    {
        $this->db->where($this->id, $id);
        $this->db->update($this->table2, $data);
    }

    // delete data
    function delete($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table);
    }

    // delete data gallery
    function delete_gallery($id)
    {
        $this->db->where($this->id, $id);
        $this->db->delete($this->table2);
    }
}

/* End of file T_pernikahan_model.php */
/* Location: ./application/models/T_pernikahan_model.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2022-07-09 08:29:43 */
/* http://harviacode.com */