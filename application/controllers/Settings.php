<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Settings extends MY_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function show_settings(){
		$params['heading'] 		 = 'SETTINGS';
		$params['settingPage'] = $this->load->view('admin/crud/setting-page', $params, TRUE);
		$this->adminContainer('admin/settings', $params);	
	}
	
	public function user_control(){
		$params['heading'] 		 = 'USERS & ACCESS LEVEL';
		$params['settingPage'] = $this->load->view('admin/settings/user-control', $params, TRUE);
		$this->adminContainer('admin/settings', $params);	
	}

	public function all_products(){
		$params['heading'] 		 = 'SETTINGS';
		$params['settingPage'] = $this->load->view('admin/crud/setting-page', $params, TRUE);
		$this->adminContainer('admin/settings', $params);	
	}

	public function view_users(){
		$params['coaUsers'] = $this->db->get_where('users')->result();
		$this->load->view('admin/settings/view-users', $params);
	}
	
	public function users_types(){
		$params['settingsUserType'] = $this->db->get_where('user_types')->result();
		$this->load->view('admin/settings/view-user-type', $params);
	}
	
	public function view_modules(){
		$params['settingsUserType'] = $this->db->get_where('user_types')->result();
		$this->load->view('admin/settings/view-modules', $params);
	}

	public function view_user_access_level(){
		$params['settingsUserType'] = $this->db->get_where('user_types')->result();
		$params['settingsModules'] = $this->db->get_where('modules')->result();
		$this->load->view('admin/settings/view-user-access-level', $params);
	}

	public function server_users(){
		$result 	= $this->Table->getOutput('users', ['id', 'fullname', 'username', 'created_at', 'updated_at', 'fr_mod'], ['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->fullname;
   		$data[] = $row->username;
   		$data[] = $row->created_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->created_at));
   		$data[] = $row->updated_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->updated_at));
			$data[] = '<a href="javascript:void(0);" 
											id="loadSidePage" 
											data-link="get-users-frm" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->fullname).'">
											<i class="fas fa-edit"></i></a> | 
									<a href="javascript:void(0);" 
											id="loadSidePage" 
											data-link="get-users-frm-fp" 
											data-id="'.$row->id.'" 
											data-title="UPDATE PASSWORD - '.strtoupper($row->fullname).'">
											<i class="fas fa-key"></i></a> | 
									<a href="javascript:void(0);" 
											onclick="removeData(this)" 
											data-tbl="users" 
											data-field="id" 
											data-id="'.$row->id.'"><i class="fas fa-trash"></i></a>';
			$res[] = $data;
		}

		$output = array (
			'draw' 						=> isset($_POST['draw']) ? $_POST['draw'] : null,
			'recordsTotal' 		=> $this->Table->countAllTbl(),
			'recordsFiltered' => $this->Table->countFilterTbl(),
			'data' 						=> $res
		);

		echo json_encode($output);
	}
	
	public function server_user_type(){
		$result 	= $this->Table->getOutput('user_types', 
																						['id', 'user_type', 'remarks', 'user_id', 'created_at', 'updated_at', 'fr_mod', 'is_deleted'], 
																							['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->user_type;
   		$data[] = $row->fr_mod;
   		$data[] = $row->created_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->created_at));
   		$data[] = $row->updated_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->updated_at));
			$data[] = '<a href="javascript:void(0);" 
											id="loadSidePage" 
											data-link="get-user-type-frm" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->user_type).'">
											<i class="fas fa-edit"></i></a> | 
									<a href="javascript:void(0);" 
											onclick="removeData(this)" 
											data-tbl="users" 
											data-field="id" 
											data-id="'.$row->id.'"><i class="fas fa-trash"></i></a>';
			$res[] = $data;
		}

		$output = array (
			'draw' 						=> isset($_POST['draw']) ? $_POST['draw'] : null,
			'recordsTotal' 		=> $this->Table->countAllTbl(),
			'recordsFiltered' => $this->Table->countFilterTbl(),
			'data' 						=> $res
		);

		echo json_encode($output);
	}
	
	public function server_modules(){
		$result 	= $this->Table->getOutput('modules', 
																						['id', 'module_group', 'module', 'user_id', 'created_at', 'updated_at', 'fr_mod', 'is_deleted'], 
																							['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->module_group;
   		$data[] = $row->module;
   		$data[] = $row->fr_mod;
   		$data[] = $row->created_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->created_at));
   		$data[] = $row->updated_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->updated_at));
			$data[] = '<a href="javascript:void(0);" 
											id="loadSidePage" 
											data-link="get-module-frm" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->module).'">
											<i class="fas fa-edit"></i></a> | 
									<a href="javascript:void(0);" 
											onclick="removeData(this)" 
											data-tbl="users" 
											data-field="id" 
											data-id="'.$row->id.'"><i class="fas fa-trash"></i></a>';
			$res[] = $data;
		}

		$output = array (
			'draw' 						=> isset($_POST['draw']) ? $_POST['draw'] : null,
			'recordsTotal' 		=> $this->Table->countAllTbl(),
			'recordsFiltered' => $this->Table->countFilterTbl(),
			'data' 						=> $res
		);

		echo json_encode($output);
	}
	
	public function server_user_access_level(){
		$result 	= $this->Table->getOutput('v_users_access_level', 
																						['id', 'module_group', 'module', 'user_type', 'user_id', 'created_at', 'updated_at', 'fr_mod', 'is_deleted'], 
																							['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->module_group;
   		$data[] = $row->module;
   		$data[] = $row->user_type;
   		$data[] = $row->access_read;
   		$data[] = $row->access_write;
   		$data[] = $row->no_access;
   		$data[] = $row->fr_mod;
   		$data[] = $row->created_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->created_at));
   		$data[] = $row->updated_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->updated_at));
			$data[] = '<a href="javascript:void(0);" 
											id="loadSidePage" 
											data-link="get-user-access-level-frm" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->module).'">
											<i class="fas fa-edit"></i></a> | 
									<a href="javascript:void(0);" 
											onclick="removeData(this)" 
											data-tbl="users" 
											data-field="id" 
											data-id="'.$row->id.'"><i class="fas fa-trash"></i></a>';
			$res[] = $data;
		}

		$output = array (
			'draw' 						=> isset($_POST['draw']) ? $_POST['draw'] : null,
			'recordsTotal' 		=> $this->Table->countAllTbl(),
			'recordsFiltered' => $this->Table->countFilterTbl(),
			'data' 						=> $res
		);

		echo json_encode($output);
	}

	public function getUsersFrm(){
		$params['has_update'] = $this->input->post('id');
		$params['data'] = $this->db->get_where('users', array('id' => $this->input->post('id')))->row();
		$params['userTypes'] = $this->db->get('user_types')->result();
		$this->load->view('admin/settings/forms/frm-users', $params);
	}
	
	public function getUserTypeFrm(){
		$params['has_update'] = $this->input->post('id');
		$params['data'] = $this->db->get_where('user_types', array('id' => $this->input->post('id')))->row();
		// $params['userTypes'] = $this->db->get('user_types')->result();
		$this->load->view('admin/settings/forms/frm-user-type', $params);
	}
	
	public function getModuleFrm(){
		$params['has_update'] = $this->input->post('id');
		$params['data'] = $this->db->get_where('modules', array('id' => $this->input->post('id')))->row();
		// $params['userTypes'] = $this->db->get('user_types')->result();
		$this->load->view('admin/settings/forms/frm-modules', $params);
	}
	
	public function getUserAccessLevelFrm(){
		$params['has_update'] = $this->input->post('id');
		$params['data'] = $this->db->get_where('user_access_level', array('id' => $this->input->post('id')))->row();
		$params['userTypes'] = $this->db->get('user_types')->result();
		$params['modules'] = $this->db->get('modules')->result();
		// $params['userTypes'] = $this->db->get('user_types')->result();
		
		$this->load->view('admin/settings/forms/frm-user-level-access', $params);
	}

	public function view_settings_page(){
		$params['heading'] = 'SETTINGS';
		$this->load->view('admin/crud/setting-page', $params);	
	}

	public function saveUsersData(){
		if (count($_POST) == 3) {
			$this->form_validation->set_rules('password','Password','required');
		} elseif(count($_POST) > 3 && $this->input->post('has_update')!='') {
			$this->form_validation->set_rules('fullname','Full Name','trim|required');
			if ($this->input->post('username') != $this->input->post('original_username')) {
				$this->form_validation->set_rules('username','Username','trim|required|is_unique[users.username]');
			}
		} else {
			$this->form_validation->set_rules('fullname','Full Name','trim|required');
			$this->form_validation->set_rules('username','Username','trim|required|is_unique[users.username]');
			$this->form_validation->set_rules('password','Password','required');
		}
		$errors = array();
		if ($this->form_validation->run() == FALSE){
			$errors = $this->form_validation->error_array();
			$errors['msg'] = 'fail';
		} else {
			if ($this->input->post('has_update')!='') {
				$data=array();
				if (count($_POST) == 3) {
					$password = $this->input->post('password');
					$hashed_password = password_hash($password, PASSWORD_BCRYPT);
					$data = [
						'password'		=> $hashed_password,
						'txt_password'=> $password,
					];
				} else {
					$data = [
						'fullname' => $this->input->post('fullname'),
						'username' 		=> $this->input->post('username'),
						'user_type_id' 		=> $this->input->post('user_type_id'),
						'is_active' 		=> $this->input->post('is_active'),
						'updated_at'	=> date('Y-m-d H:i:s')
					];
				}
				$this->db->update('users', $data, array('id' => $this->input->post('has_update')));
				$errors['msg']		 	 = 'success';
			} else {
				$password = $this->input->post('password');
				$hashed_password = password_hash($password, PASSWORD_BCRYPT);
				$data = [
						'fullname' => $this->input->post('fullname'),
						'username' 		=> $this->input->post('username'),
						'user_type_id' 		=> $this->input->post('user_type_id'),
						'is_active' 		=> $this->input->post('is_active'),
						'password'		=> $hashed_password,
						'created_at'	=> date('Y-m-d H:i:s')
				];
				$this->db->insert('users', $data);
				$users_id = $this->db->insert_id();
				$errors['msg']		 	 = 'success';
			}
		}
		// $errors['json'] = json_decode($this->input->post('user_role'));
		
		echo json_encode($errors);
	}

	public function getUsersFrmFp(){
		$params['has_update'] = $this->input->post('id');
		$this->load->view('admin/settings/forms/frm-users-fp', $params);
	}

	public function getUserRoleFrm(){
		$params['modules'] = $this->db->get_where('modules')->result();
 		$this->load->view('admin/settings/forms/user-role-form', $params);
	}

	public function deleteData(){
		$tbl 	= $this->input->post('tbl');
		$fld 	= $this->input->post('w');
		$id 	= $this->input->post('v');
		$this->db->update($tbl, array('is_deleted' => 1), array($fld => $id));
	}

	public function addData(){
		$tbl 	= $this->input->post('tbl');
		$id 	= $this->input->post('has_update');
		$mustUnique 	= $this->input->post('unique');
		$data = array();
		foreach ($this->input->post() as $key => $value) {
			if ($key!='tbl'&&$key!='has_update'&&$key!='pk_key'&&$key!='unique'&&$key!='original_val') {
				$data[$key] = $value;	
			}
		}
		$errors = [];
		$res = array();

		$checkIsDeleted = $this->db->get_where($tbl, array($mustUnique => $_POST[$mustUnique], 'is_deleted' => 0))->row();
		//ignore validate if value is existing for update
		if ($_POST[$mustUnique] != $this->input->post('original_val') && $checkIsDeleted) {
			$this->form_validation->set_rules($mustUnique, 
																				strtoupper(str_replace('_', ' ', $mustUnique)),
																				'trim|required|is_unique['.$tbl.'.'.$mustUnique.']');
		}
		if ($this->form_validation->run() == FALSE){
			$errors = $this->form_validation->error_array();
			if (!empty($errors)) {
				$res['param1'] = 'Opps!';
				$res['param2'] = $errors[$mustUnique] . '! changes not updated';
				$res['param3'] = 'warning';	
			} else {
				if ($this->input->post('has_update')!='') {
					$q = $this->db->update($tbl, $data, array($this->input->post('pk_key') => $this->input->post('has_update')));
				} else {
					$q = $this->db->insert($tbl, $data);
				}
				if ($q) {
					$res['param1'] = 'Success!';
					$res['param2'] = 'Successfully Saved!';
					$res['param3'] = 'success';
				} else {
					$res['param1'] = 'Opps!';
					$res['param2'] = 'Error Encountered Saved';
					$res['param3'] = 'warning';
				}
			}
		} else {
			if ($this->input->post('has_update')!='') {
				$q = $this->db->update($tbl, $data, array($this->input->post('pk_key') => $this->input->post('has_update')));
			} else {
				$q = $this->db->insert($tbl, $data);
			}
			if ($q) {
				$res['param1'] = 'Success!';
				$res['param2'] = 'Successfully Saved!';
				$res['param3'] = 'success';
			} else {
				$res['param1'] = 'Opps!';
				$res['param2'] = 'Error Encountered Saved';
				$res['param3'] = 'warning';
			}
		}

		//upload image
		if ($tbl=='tbl_companies') {
			if ($this->input->post('has_update')) {
				$this->uploadImage($this->input->post('has_update'), 'id', 'tbl_companies');
			} else {
				$this->uploadImage($this->db->insert_id(), 'id', 'tbl_companies');
			}
		}

		echo json_encode($res);
	}

}



