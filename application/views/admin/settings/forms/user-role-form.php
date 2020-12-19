<div class="row p-3">
  <div class="col-lg-12">
    <h4>User Access Level</h4>
    <table id="user-role-tbl" class="table font-12">
      <tr>
        <td colspan="5"><strong>User Access</strong></td>
      </tr>
      <tr>
        <td></td>
        <td><strong>Module Group</strong></td>
        <td><strong>Module</strong></td>
        <td><strong>Read Access</strong></td>
        <td><strong>Write Access</strong></td>
        <td><strong>No Access</strong></td>
      </tr>
      <?php $group = []; ?>
      <?php foreach($modules as $row): ?>
        <?php if(!in_array($row->module_group, $group)): ?>
          <tr>
            <td></td>
            <td><?php echo ucfirst($row->module_group); ?></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td><?php echo ucfirst($row->module); ?></td>
            <td><input type="checkbox" class="chk-user-role" name="access_read" value="<?php echo $row->id; ?>" onclick="uncheckNoAccess(this)" /></td>
            <td><input type="checkbox" class="chk-user-role" name="access_write" value="<?php echo $row->id; ?>" onclick="uncheckNoAccess(this)" /></td>
            <td><input type="checkbox" class="chk-user-role" name="no_access" value="<?php echo $row->id; ?>" onclick="removeChildChecked(this)" /></td>
          </tr>
        <?php else: ?>
          <tr>
            <td></td>
            <td></td>
            <td><?php echo ucfirst($row->module); ?></td>
            <td><input type="checkbox" class="chk-user-role" name="access_read" value="<?php echo $row->id; ?>" onclick="uncheckNoAccess(this)" /></td>
            <td><input type="checkbox" class="chk-user-role" name="access_write" value="<?php echo $row->id; ?>" onclick="uncheckNoAccess(this)" /></td>
            <td><input type="checkbox" class="chk-user-role" name="no_access" value="<?php echo $row->id; ?>" onclick="removeChildChecked(this)" /></td>
          </tr>
        <?php endif; ?>
        <?php $group[] = $row->module_group; ?>
      <?php endforeach; ?>
    </table>
    <div class="row">
      <div class="col-lg-12">
        <button type="button" data-dismiss="modal" class="btn btn-sm btn-danger float-right font-12" aria-label="Close"><i class="fas fa-times"></i> Closed</button>
        <button type="button" id="submitUserRole" class="btn btn-sm btn-default float-right font-12"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>