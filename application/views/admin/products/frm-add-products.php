<div class="modal-header">
  <h5 class="modal-title" id="modal-products-title"><?php echo $title; ?></h5>
  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="modal-body">
  <form id="frm-add-products" enctype="multipart/form-data">
    <div class="row mb-2">
      <div class="col">
        <label for="title" class="font-12">Title</label>
        <input type="text" class="form-control font-12" id="title" value="<?php echo !empty($data) ? $data->title : ''; ?>" name="title" placeholder="Title">
        <input type="hidden" value="<?php echo !empty($data) ? $data->title : ''; ?>" name="original_title">
        <div class="title "></div>
      </div>
      <div class="col">
        <label for="description" class="font-12">Title</label>
        <input type="text" class="form-control font-12" id="description" value="<?php echo !empty($data) ? $data->description : ''; ?>" name="description" placeholder="Description">
        <div class="description "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="status" class="font-12">Status</label>
        <select class="custom-select custom-select-sm" id="status" name="status">
          <option selected hidden value="">Status</option>
          <option value="0" <?php echo !empty($data) ? ($data->status == 0 ? 'selected' : '') : ''; ?>>Inactive</option>
          <option value="1" <?php echo !empty($data) ? ($data->status == 1 ? 'selected' : '') : ''; ?>>Active</option>
          <option value="2" <?php echo !empty($data) ? ($data->status == 2 ? 'selected' : '') : ''; ?>>Draft</option>
        </select>
        <div class="status "></div>
      </div>
      <div class="col">
        <label for="category_id" class="font-12">Category</label>
        <select class="custom-select custom-select-sm" id="category_id" name="category_id" required>
          <option selected hidden value="">Category</option>
          <?php foreach($categories as $row): ?>
            <option value="<?php echo $row->id; ?>" <?php echo !empty($data) ? ($data->category_id == $row->id ? 'selected' : '') : ''; ?>><?php echo $row->category_title; ?></option>
          <?php endforeach; ?>
        </select>
        <div class="category_id "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="product_type_id" class="font-12">Product Types</label>
        <select class="custom-select custom-select-sm" id="product_type_id" name="product_type_id" required>
          <option selected hidden value="">Product Types</option>
          <?php foreach($productTypes as $row): ?>
            <option value="<?php echo $row->id; ?>" <?php echo !empty($data) ? ($data->product_type_id == $row->id ? 'selected' : '') : ''; ?>><?php echo $row->product_type; ?></option>
          <?php endforeach; ?>
        </select>
        <div class="product_type_id "></div>
      </div>
      <div class="col">
        <label for="supplier_id" class="font-12">Suppliers</label>
        <select class="custom-select custom-select-sm" id="supplier_id" name="supplier_id" required>
          <option selected hidden value="">Suppliers</option>
          <?php foreach($supplierId as $row): ?>
            <option value="<?php echo $row->id; ?>" <?php echo !empty($data) ? ($data->supplier_id == $row->id ? 'selected' : '') : ''; ?>><?php echo $row->supplier_name; ?></option>
          <?php endforeach; ?>
        </select>
        <div class="supplier_id "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="price" class="font-12">Price</label>
        <input type="text" class="form-control font-12 isNum" id="price" name="price" value="<?php echo !empty($data) ? $data->price : ''; ?>" placeholder="Price">
        <div class="price "></div>
      </div>
      <div class="col">
        <label for="member_price" class="font-12">Promo Price</label>
        <input type="text" class="form-control font-12 isNum" id="member_price" name="member_price" value="<?php echo !empty($data) ? $data->member_price : ''; ?>" placeholder="Member Price">
        <div class="member_price "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="promo_price" class="font-12">Promo Price</label>
        <input type="text" class="form-control font-12 isNum" id="promo_price" name="promo_price" value="<?php echo !empty($data) ? $data->promo_price : ''; ?>" placeholder="Promo Price">
        <div class="promo_price "></div>
      </div>
      <div class="col">
        <label for="member_promo_price" class="font-12">Member Promo Price</label>
        <input type="text" class="form-control font-12 isNum" id="member_promo_price" name="member_promo_price" value="<?php echo !empty($data) ? $data->member_promo_price : ''; ?>" placeholder="Member Promo Price">
        <div class="member_promo_price "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="sku" class="font-12">SKU</label>
        <input type="text" class="form-control font-12" id="sku" name="sku" value="<?php echo !empty($data) ? $data->sku : ''; ?>" placeholder="SKU">
        <div class="sku "></div>
      </div>
      <div class="col">
        <label for="barcode" class="font-12">Barcode</label>
        <input type="text" class="form-control font-12" id="barcode" name="barcode" value="<?php echo !empty($data) ? $data->barcode : ''; ?>" placeholder="Barcode">
        <div class="barcode "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="weight" class="font-12">Weight</label>
        <input type="text" class="form-control font-12" id="weight" name="weight" value="<?php echo !empty($data) ? $data->weight : ''; ?>" placeholder="Weight">
        <div class="weight "></div>
      </div>
      <div class="col">
        <label for="weight_unit" class="font-12">Weight Unit</label>
        <input type="text" class="form-control font-12" id="weight_unit" name="weight_unit" value="<?php echo !empty($data) ? $data->weight_unit : ''; ?>" placeholder="Weight Unit">
        <div class="weight_unit "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="slug" class="font-12">Slug</label>
        <input type="text" class="form-control font-12" id="slug" name="slug" value="<?php echo !empty($data) ? $data->slug : ''; ?>" placeholder="Slug">
        <div class="slug "></div>
      </div>
      <div class="col">
        <label for="seo_meta_description" class="font-12">Seo Meta Description</label>
        <input type="text" class="form-control font-12" id="seo_meta_description" value="<?php echo !empty($data) ? $data->seo_meta_description : ''; ?>" name="seo_meta_description" placeholder="SEO Meta Description">
        <div class="seo_meta_description "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="product- class="font-12"photo-add" class="font-12">Image</label>
        <input type="file" class="font-12" name="image_upload[]" multiple id="product-photo-add">
      </div>
      <div class="col">
        <label for="seo_title" class="font-12">SEO Title</label>
        <input type="text" class="form-control font-12" name="seo_title" id="seo_title" value="<?php echo !empty($data) ? $data->seo_title : ''; ?>" placeholder="SEO Title">
        <div class="seo_title "></div>
        <input type="hidden" name="user_id" value="<?php echo $this->session->user_id; ?>">
        <input type="hidden" name="has_update" value="<?php echo !empty($data) ? $data->id : ''; ?>">
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <div class="product-img">
          <?php foreach($images as $row): ?>
          <img src="<?php echo base_url() . 'assets/image/uploads/' . $row->source; ?>" alt="">
          <?php endforeach; ?>
        </div>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <button type="button" onclick="$('#frm-add-products').trigger('submit');" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Save</button>
</div>