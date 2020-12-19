<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Admin extends MY_Controller {

	function __construct(){
		parent::__construct();
	}

	public function index(){
		$params['heading'] = 'PGI ERP';
		$this->adminContainer('admin/index', $params);
	}
	
	public function usr_login(){
		$this->load->view('admin/login');
	}

	public function proceed_login(){
		$this->form_validation->set_rules('username', 'Username', 'required');
		$this->form_validation->set_rules('password', 'Password', 'required');
		$errors = array();
		if ($this->form_validation->run() == FALSE){
			$errors = $this->form_validation->error_array();
			$errors['msg'] = 'failed';
		} else {
			$username = $this->input->post('username');
			$password = $this->input->post('password');
			$q 				= $this->db->get_where('users', array('username' => $username));
			if (!empty($q->row())) {
				$database_password = $q->row()->password;
				$found = password_verify($password, $database_password) ? 'success' : 'failed';
				// store info in session
				$userdata = array(
					'username' => $username,
					'screen_name' => $q->row()->fullname,
					'user_id' => $q->row()->id,
				);
				$this->session->set_userdata($userdata);
			} else {
				$found = 'failed';
			}
			$errors['msg'] = $found;
			$errors['redirect'] = base_url();
			if ($this->session->userdata('redirects_url')) {
				$errors['redirect'] = $this->session->redirects_url;
			}
		}
		echo json_encode($errors);
	}

	public function destroy_sess(){
		$this->session->sess_destroy();
		redirect(base_url(), 'refresh');
	}
}	