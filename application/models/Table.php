<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Table extends CI_Model {

	protected $tbl;
	protected $tblColumn = [];
	protected $tblOrder = [];

	public function whereFnc(){
		$this->db->where('is_deleted', 0);
	} 

	private function _que_tbl(){
		$this->db->from($this->tbl);
		$this->whereFnc();
		$i = 0;
		foreach ($this->tblColumn as $item) {
			if (!empty($_POST['search']['value'])) {
				if ($i === 0) {
					$this->db->like($item, strtolower($_POST['search']['value']));
				} else {
					$this->db->or_like($item, strtolower($_POST['search']['value']));
				}

				$this->whereFnc();
			}
			$column[$i] = $item;
			$i++;
		}
		if (isset($_POST['order'])) {
			$this->db->order_by($column[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
		}elseif($this->tblOrder){
			$order = $this->tblOrder;
			$this->db->order_by(key($order), $order[key($order)]);
		}
		$this->db->order_by(key($this->tblOrder), $this->tblOrder[key($this->tblOrder)]);
	}

	public function getOutput($tbl, $tblColumn=array(), $tblOrder=array()){
		$this->tbl = $tbl; 
		$this->tblColumn = $tblColumn; 
		$this->tblOrder = $tblOrder; 
		$this->_que_tbl();
		if (!empty($_POST['length']))
			if ($_POST['length'] < 0) {} else {
					$this->db->limit($_POST['length'], $_POST['start']);
				
			}
		$query = $this->db->get();
		return $query->result();
	}

	public function countAllTbl(){
		$this->db->from($this->tbl);
		return $this->db->count_all_results();
	}

	public function countFilterTbl(){
		$this->_que_tbl();
		$query = $this->db->get();
		return $query->num_rows();
	}


}
