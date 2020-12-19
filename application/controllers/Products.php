<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Products extends MY_Controller {

	public function __construct(){
		parent::__construct();
	}

  public function all_products(){
    $params['heading'] 		 = 'ALL PRODUCTS';
		$params['settingPage'] = $this->load->view('admin/products/all-products', $params, TRUE);
		$this->adminContainer('admin/products/container', $params);	
  }
  
  public function view_categories(){
    $params['heading'] 		 = 'ALL CATEGORIES';
		$params['settingPage'] = $this->load->view('admin/products/categories', $params, TRUE);
		$this->adminContainer('admin/products/container', $params);	
  }

  public function addProductsFrm(){
    $params['title']        = $this->input->post('title');
    $id                     = $this->input->post('id');
    $params['categories']   = $this->db->get('categories')->result();
    $params['productTypes'] = $this->db->get('product_types')->result();
    $params['supplierId']   = $this->db->get('suppliers')->result();
    $params['images']       = $this->db->get_where('product_images', array('product_id'=> $id))->result();
    $params['data']         = $this->db->get_where('products', array('id'=> $id))->row();
    $this->load->view('admin/products/frm-add-products', $params);
  }
  
  public function addCategoriesFrm(){
    $params['title']        = $this->input->post('title');
    $id                     = $this->input->post('id');
    $params['data']         = $this->db->get_where('products', array('id'=> $id))->row();
    $this->load->view('admin/products/frm-add-categories', $params);
  }

  public function saveProducts(){
    if ($this->input->post('title') != $this->input->post('original_title')) {
			$this->form_validation->set_rules('title', 'Title', 'trim|required|is_unique[products.title]');
		}
		$this->form_validation->set_rules('description', 'Description', 'required');
		$this->form_validation->set_rules('status', 'Status', 'required');
		$this->form_validation->set_rules('category_id', 'Category', 'required');
		$this->form_validation->set_rules('product_type_id', 'Product Type', 'required');
		$this->form_validation->set_rules('supplier_id', 'Supplier', 'required');
		$this->form_validation->set_rules('price', 'Price', 'required');
		$this->form_validation->set_rules('member_price', 'Member Price', 'required');
		$this->form_validation->set_rules('promo_price', 'Promo Price', 'required');
		$this->form_validation->set_rules('member_promo_price', 'Member Promo Price', 'required');
		$this->form_validation->set_rules('sku', 'SKU', 'required');
		$this->form_validation->set_rules('barcode', 'Barcode', 'required');
		$this->form_validation->set_rules('weight', 'Weight', 'required');
		$this->form_validation->set_rules('weight_unit', 'Weight Unit', 'required');
		$this->form_validation->set_rules('slug', 'Slug', 'required');
		$this->form_validation->set_rules('seo_meta_description', 'SEO Meta Description', 'required');
		$this->form_validation->set_rules('seo_title', 'SEO Title', 'required');
		$errors = array();
		if ($this->form_validation->run() == FALSE){
			$errors = $this->form_validation->error_array();
			$errors['msg'] = 'failed';
		} else {
      $posts=[];
      foreach ($this->input->post() as $key => $value) {
        switch ($key) {
          case 'has_update':
            break;
          case 'original_title':
            break;
          default:
            $posts[$key] = $value;
            break;
        }
      }
      if ($this->input->post('has_update') == '') {
        $this->db->insert('products', $posts);
        $product_id = $this->db->insert_id();
        //init images
        $imgUploadRes = $this->upload_multiple_image('product');
        $img = [];
        foreach ($imgUploadRes['res'] as $key => $val) {
          array_push($img, array(
            'product_id' => $product_id,
            'source'     => $val['file_name'],
            'user_id'    => $this->session->user_id,
            'created_at' => date('Y-m-d H:i:s')  //removed not null in db
          ));
        }
        $q = $this->db->insert_batch('product_images', $img);
      } else {
        //init images
        $imgUploadRes = $this->upload_multiple_image('product');
        //delete current image
        if ($imgUploadRes['bool']==true) {
          $images = $this->db->get_where('product_images', array('product_id'=>$this->input->post('has_update')))->result();
          foreach ($images as $row) {
            unlink("assets/image/uploads/".$row->source);
          }
          $this->db->delete('product_images', array('product_id'=>$this->input->post('has_update')));
          $img = [];
          foreach ($imgUploadRes['res'] as $key => $val) {
            array_push($img, array(
              'product_id' => $this->input->post('has_update'),
              'source'     => $val['file_name'],
              'user_id'    => $this->session->user_id,
              'updated_at' => date('Y-m-d H:i:s')  //removed not null in db
            ));
          }
          $this->db->insert_batch('product_images', $img);
        }

        $q = $this->db->update('products', $posts, array('id'=>$this->input->post('has_update')));
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
      $errors = $res;
    }
    echo json_encode($errors);
  }

  public function server_all_products(){
		$result 	= $this->Table->getOutput('v_all_products', 
                                            ['id', 'title', 'description', 'status', 'category_id', 'product_type_id', 
                                            'product_image_id', 'supplier_id', 'price', 'member_price', 'promo_price', 
                                            'member_promo_price', 'sku', 'barcode', 'weight', 'weight_unit', 'slug', 
                                            'seo_meta_description', 'seo_title', 'user_id', 'created_at', 'updated_at', 
                                            'fr_mod', 'is_deleted', 'category_title', 'product_type', 'source', 'supplier_name'], 
																							['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->title;
   		$data[] = number_format($row->price, 2);
   		$data[] = number_format($row->member_price, 2);
   		$data[] = number_format($row->promo_price, 2);
   		$data[] = $row->created_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->created_at));
   		$data[] = $row->updated_at == '0000-00-00 00:00:00' ? '' : date('Y-m-d', strtotime($row->updated_at));
			$data[] = '<a href="javascript:void(0);" 
											id="updateProducts" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->title).'">
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
  
  public function server_all_categories(){
		$result 	= $this->Table->getOutput('categories', 
                                            ['id', 'category_title', 'category_description', 'image_src', 'image_alt_text', 'image_height', 'image_width', 'is_coming_soon', 'user_id', 'created_at', 'updated_at', 'fr_mod', 'is_deleted'], 
                                              ['id' => 'desc']);
		$res 			= array();
		$no 			= isset($_POST['start']) ? $_POST['start'] : 0;

		foreach ($result as $row) {
			$data = array();
			$no++;
   		$data[] = $row->category_title;
   		$data[] = $row->category_description;
   		$data[] = $row->is_coming_soon == 0 ? 'No' : 'Yes';
			$data[] = '<a href="javascript:void(0);" 
											id="updateProducts" 
											data-id="'.$row->id.'" 
											data-title="EDIT - '.strtoupper($row->category_title).'">
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

}



