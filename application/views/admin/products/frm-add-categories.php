<div class="modal-header">
  <h5 class="modal-title" id="modal-products-title"><?php echo $title; ?></h5>
  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<div class="modal-body">
  <form id="frm-add-categories" enctype="multipart/form-data">
    <div class="row mb-2">
      <div class="col">
        <label for="category_title" class="font-12">Category Title</label>
        <input type="text" class="form-control font-12" id="category_title" name="category_title" value="<?php echo !empty($data) ? $data->category_title : ''; ?>" placeholder="Category Title">
        <div class="category_title "></div>
      </div>
      <div class="col">
        <label for="category_description" class="font-12">Category Description</label>
        <input type="text" class="form-control font-12" id="category_description" value="<?php echo !empty($data) ? $data->category_description : ''; ?>" name="category_description" placeholder="Category Description">
        <div class="category_description "></div>
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <label for="product-photo-add" class="font-12" class="font-12">Image</label>
        <input type="file" class="font-12" name="image_upload[]" multiple id="product-photo-add">
        <input type="hidden" name="user_id" value="<?php echo $this->session->user_id; ?>">
        <input type="hidden" name="has_update" value="<?php echo !empty($data) ? $data->id : ''; ?>">
      </div>
    </div>
    <div class="row mb-2">
      <div class="col">
        <div class="product-img"></div>
      </div>
    </div>
  </form>
</div>
<div class="modal-footer">
  <button type="button" onclick="$('#frm-add-categories').trigger('submit');" class="btn btn-primary btn-sm"><i class="fas fa-save"></i> Save</button>
</div>