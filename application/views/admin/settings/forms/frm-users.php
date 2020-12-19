<form id="frm-users-settings">
	<div class="row">
		<div class="col-lg-12">
			<div class="form-group">
		    <label for="fullname" class="font-12">FULL NAME</label>
		    <input type="text" class="form-control form-control-sm font-12" id="fullname" name="fullname" value="<?php echo !empty($data) ? $data->fullname : ''; ?>" value="">
		    <div class="fullname err-msg"></div>
		    <label for="username" class="font-12">USERNAME </label>
		    <input type="text" class="form-control form-control-sm font-12" id="username" name="username" value="<?php echo !empty($data) ? $data->username : ''; ?>" value="">
		    <div class="username err-msg"></div>
		    <?php if (!empty($has_update)): ?>
		    	<input type="hidden" class="form-control form-control-sm font-12" id="original_username" name="original_username" value="<?php echo !empty($data) ? $data->username : ''; ?>" value="">
		    <?php else: ?>
		    	<label for="password" class="font-12">PASSWORD</label>
			    <input type="password" class="form-control form-control-sm font-12" id="password" name="password" value="">
			    <div class="password err-msg"></div>
		    <?php endif; ?>
		    <div class="confirm_password err-msg"></div>
				<label for="user_type_id" class="font-12">User Type </label>
				<select name="user_type_id" class="custom-select custom-select-sm mb-2" id="">
					<option value="" selected hidden></option>
					<?php foreach($userTypes as $row): ?>
						<option value="<?php echo $row->id; ?>"><?php echo $row->user_type; ?></option>
					<?php endforeach; ?>
				</select>
				<input type="checkbox" class="" id="is_active" name="is_active" value="1"><span class="font-12" for="is_active"> Is Active</span>
				
		    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
		  </div>
		</div>
		<div class="col-lg-12">
			<input type="hidden" name="has_update" value="<?php echo $has_update ?? ''; ?>">
			<input type="hidden" name="user_role" value="<?php echo $has_update ?? ''; ?>">
			<button type="submit" class="btn btn-sm btn-default float-right font-12"><i class="fas fa-save"></i> Save</button>
		</div>
		
	</div>
</form>