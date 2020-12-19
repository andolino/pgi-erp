<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class AdminMod extends CI_Model {

	public function __construct(){
		parent::__construct();
		$this->userType = [0 => 'Administrator', 1 => 'Manager', 2 => 'Tech Support', 3 => 'User - Requestor', 4 => 'Guest'];
	}

	public function getUserType($id){
		return $this->userType[$id];
	}
}


