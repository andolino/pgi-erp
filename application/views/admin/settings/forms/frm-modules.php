<form id="frm" data-tbl="modules" data-pk-key="id" data-unique="module">
	<div class="row">
		<div class="col-lg-12">
			<div class="form-group">
		    <label for="module_group" class="font-12">MODULE GROUP</label>
		    <input type="text" class="form-control form-control-sm font-12" id="module_group" name="module_group" value="<?php echo !empty($data) ? $data->module_group : ''; ?>" value="">
		    <div class="module_group err-msg"></div>
		    <label for="module" class="font-12">MODULE </label>
		    <input type="text" class="form-control form-control-sm font-12" id="module" name="module" value="<?php echo !empty($data) ? $data->module : ''; ?>" value="">
		    <div class="module err-msg"></div>
        <input type="hidden" class="" name="<?php echo $has_update==''?'created_at':'updated_at'; ?>" value="<?php echo date('Y-m-d H:i:s'); ?>">
		    <input type="hidden" class="" name="original_val" value="<?php echo !empty($data) ? $data->module : ''; ?>">
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