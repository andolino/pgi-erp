<form id="frm" data-tbl="user_types" data-pk-key="id" data-unique="user_type">
	<div class="row">
		<div class="col-lg-12">
			<div class="form-group">
		    <label for="user_type" class="font-12">USER TYPE</label>
		    <input type="text" class="form-control form-control-sm font-12" id="user_type" name="user_type" value="<?php echo !empty($data) ? $data->user_type : ''; ?>" value="">
		    <div class="user_type err-msg"></div>
		    <label for="remarks" class="font-12">REMARKS </label>
		    <input type="text" class="form-control form-control-sm font-12" id="remarks" name="remarks" value="<?php echo !empty($data) ? $data->remarks : ''; ?>" value="">
		    <div class="remarks err-msg"></div>
        <input type="hidden" class="" name="<?php echo $has_update==''?'created_at':'updated_at'; ?>" value="<?php echo date('Y-m-d H:i:s'); ?>">
		    <input type="hidden" class="" name="original_val" value="<?php echo !empty($data) ? $data->user_type : ''; ?>">
		    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
		  </div>
		</div>
		<div class="col-lg-12">
			<input type="hidden" name="has_update" value="<?php echo $has_update ?? ''; ?>">
      <input type="hidden" name="fr_mod" value="SETTINGS">
      <input type="hidden" name="user_id" value="99999">
			<button type="submit" class="btn btn-sm btn-default float-right font-12"><i class="fas fa-save"></i> Save</button>
		</div>
		
	</div>
</form>