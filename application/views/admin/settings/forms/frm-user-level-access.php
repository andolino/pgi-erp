<form id="frm" data-tbl="user_access_level" data-pk-key="id" data-unique="<?php echo $has_update==''?'created_at':'updated_at'; ?>">
	<div class="row">
		<div class="col-lg-12">
			<div class="form-group">
		    <label for="user_type_id" class="font-12">USER TYPE</label>
				
				<select class="custom-select custom-select-sm" name="user_type_id" id="user_type_id">
					<option value="" selected></option>
					<?php foreach($userTypes as $row): ?>
						<option value="<?php echo $row->id; ?>" <?php echo !empty($data) ? ($data->user_type_id == $row->id ? 'selected' : '') : ''; ?>><?php echo $row->user_type; ?></option>
					<?php endforeach; ?>
				</select>
		    <!-- <input type="text" class="form-control form-control-sm font-12" id="user_type_id" name="user_type_id" value="" value=""> -->
		    <div class="user_type_id err-msg"></div>
		    <label for="module_id" class="font-12">MODULE </label>
		    <select class="custom-select custom-select-sm" name="module_id" id="module_id">
					<option value="" selected></option>
					<?php foreach($modules as $row): ?>
						<option value="<?php echo $row->id; ?>" <?php echo !empty($data) ? ($data->module_id == $row->id ? 'selected' : '') : ''; ?>><?php echo $row->module_group . ' - ' . $row->module; ?></option>
					<?php endforeach; ?>
				</select>
				<input type="hidden" name="access_read" value="0">
				<input type="hidden" name="access_write" value="0">
				<input type="hidden" name="no_access" value="0">
		    <div class="module_id err-msg mb-2"></div>
				<table class="table">
					<tr>
						<td><input type="checkbox" class="chk-user-role" name="access_read" <?php echo !empty($data) ? ($data->access_read == '1' ? 'checked' : '') : ''; ?> value="1" onclick="uncheckNoAccess(this)" /> <span class="font-12" for="access_read">ACCESS READ</span></td>
						<td><input type="checkbox" class="chk-user-role" name="access_write" <?php echo !empty($data) ? ($data->access_write == '1' ? 'checked' : '') : ''; ?> value="1" onclick="uncheckNoAccess(this)" /> <span class="font-12" for="access_write">ACCESS WRITE</span></td>
						<td><input type="checkbox" class="chk-user-role" name="no_access" <?php echo !empty($data) ? ($data->no_access == '1' ? 'checked' : '') : ''; ?> value="1" onclick="removeChildChecked(this)" /> <span class="font-12" for="no_access">NO ACCESS</span></td>
					</tr>
				</table>
        <!-- <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="access_read" name="access_read" value="1">
          <label class="form-check-label font-12" for="access_read">ACCESS READ</label>
        </div>
        <div class="access_read err-msg"></div>

        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="access_write" name="access_write" value="1">
          <label class="form-check-label font-12" for="access_write">ACCESS WRITE</label>
        </div>
				<div class="access_write err-msg"></div>

        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="no_access" name="no_access" value="1">
          <label class="form-check-label font-12" for="no_access">NO ACCESS</label>
        </div>
        <div class="no_access err-msg"></div> -->

        <input type="hidden" class="" name="<?php echo $has_update==''?'created_at':'updated_at'; ?>" value="<?php echo date('Y-m-d H:i:s'); ?>">
		    <input type="hidden" class="" name="original_val" value="<?php echo !empty($data) ? $data->created_at : ''; ?>">
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