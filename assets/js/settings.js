$(document).ready(function() {
  
  //load data-page
  $(document).on('click', '#loadSidePage', function(event) {
    var link  = $(this).attr('data-link');
    var title = $(this).attr('data-title');
    var id    = $(this).attr('data-id');
    var fn    = $(this).attr('data-fn');
    // $(this).tooltip('hide');
    $.post(link, { 'id' : id, 'fn': fn  }, function(data, textStatus, xhr) {
      $('.cont-add-body').html(data);
      $('.title-cont-form').html(title);
      animateSingleIn('.cont-card-add', 'fadeInRight');
    });    
  });


  $(document).on('submit', '#frm-users-settings', function(e) {
    e.preventDefault();
    var frm = $(this).serialize();
    customSwal(
        'btn btn-success', 
        'btn btn-danger mr-2', 
        'Yes', 
        'Wait', 
        ['', 'Are you sure you want to add this user?', 'question'], 
        function(){
          $.ajax({
            url       : 'save-users-data',
            type      : 'POST',
            dataType  : 'JSON',
            data      : frm,
            context   : this,
            success   : function(res){
              // console.log(res);
              if (res.msg == 'fail') {
                $('input').removeClass('is-valid is-invalid');
                $('select').removeClass('is-valid is-invalid');
                $('.err-msg').html('');
                $.each(res, function(index, el) {
                  console.log(index, el);
                  $('input[name="'+index+'"]').addClass('is-invalid');
                  $('select[name="'+index+'"]').addClass('is-invalid');
                  $('.'+index).addClass('invalid-feedback').html(el);
                });
              } else {
                Swal.fire(
                  'Success!',
                  'Saved!',
                  'success'
                );
                animateSingleOut('.cont-card-add', 'fadeOutRight')
                tbl_users.ajax.reload();
              }
            }
          });
        }, function(){
          console.log('Fail');
      });
  });
  
  $(document).on('submit', '#frm', function(e) {
    e.preventDefault();
    var frm = $(this).serialize();
    var frm = new FormData(this);
    frm.append('tbl', $(this).attr('data-tbl'));
    frm.append('pk_key', $(this).attr('data-pk-key'));
    frm.append('unique', $(this).attr('data-unique'));
      customSwal(
        'btn btn-success', 
        'btn btn-danger mr-2', 
        'Yes', 
        'Wait', 
        ['', 'Are you sure you want to save ?', 'question'], 
        function(){
            $.ajax({
              url: 'add-data',
              type: 'POST',
              dataType: 'JSON',
              data: frm,
              processData:false,
              contentType:false,
              cache:false,
              async:false,
              success: function(res){
                if (res.param3 == 'success') {
                  tbl_user_type.ajax.reload();
                  tbl_modules.ajax.reload();
                  tbl_user_access_level.ajax.reload();
                }
                Swal.fire(
                  res.param1,
                  res.param2,
                  res.param3
                );
                animateSingleOut('.cont-card-add', 'fadeOutRight');
              }
            });
        }, function(){
          console.log('Fail');
      });
    // customSwal(
    //   'btn btn-success', 
    //   'btn btn-danger mr-2', 
    //   'Yes', 
    //   'Wait', 
    //   ['', 'Are you sure you want to add this type?', 'question'], 
    //   function(){
    //     $.ajax({
    //       url       : 'save-user-type-data',
    //       type      : 'POST',
    //       dataType  : 'JSON',
    //       data      : frm,
    //       context   : this,
    //       success   : function(res){
    //         console.log(res);
    //       }
    //     });
    //   }, function(){
    //     console.log('Fail');
    // });
  });

  $(document).on('click', '#btnUpdateUserRole', function () {
    $('#custom-modal').modal('show');
    $('#custom-modal .modal-dialog').removeClass('modal-md modal-sm').addClass('modal-lg').modal('show');
    $.ajax({
      type: "POST",
      url: "get-user-role-frm",
      data: {},
      success: function (res) {
        $('#custom-modal .modal-content').html(res);
      }
    });
    
  });
  
  $(document).on('click', '#submitUserRole', function (e) { 
    e.preventDefault();
    var obj = [];
    $('table#user-role-tbl tr').each(function(){
      $(this).find('td:eq(3)').find('input[type="checkbox"]:checked').each(function(i,v){
        obj.push({
          id: $(v).val(),
          name: $(v).attr('name')
        });
      });
      $(this).find('td:eq(4)').find('input[type="checkbox"]:checked').each(function(i,v){
        obj.push({
          id: $(v).val(),
          name: $(v).attr('name')
        });
      });
      $(this).find('td:eq(5)').find('input[type="checkbox"]:checked').each(function(i,v){
        obj.push({
          id: $(v).val(),
          name: $(v).attr('name')
        });
      });
    });
    var d = JSON.stringify(obj);
    $('input[name="user_role"]').val(d);
    $('.lbl-alert').html('<div class="alert alert-success w-50 float-left rounded-0 lbl-success font-12" role="alert">User role is set</div>');
    $('#custom-modal').modal('hide');
    $('.modal-backdrop').remove();
  });

});


function initUsersDataTables(){
  var myObj = {};
  tbl_users  = $("#tbl-user-settings").DataTable({
    searchHighlight : true,
    lengthMenu      : [[5, 10, 20, 30, 50, -1], [5, 10, 20, 30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3,4] 
      },
      { 
        className            : 'text-center', 
        targets              : [4] 
      }
    ],
    "serverSide"               : true,
    "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-users',
        "type"                 : 'POST'
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-loan-settings'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObj[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObj);
    }
  });
}

function initUserTypeDataTables(){
  var myObj = {};
  tbl_user_type  = $("#tbl-user-types-settings").DataTable({
    searchHighlight : true,
    lengthMenu      : [[5, 10, 20, 30, 50, -1], [5, 10, 20, 30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3,4] 
      },
      { 
        className            : 'text-center', 
        targets              : [4] 
      }
    ],
    "serverSide"               : true,
    "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-user-type',
        "type"                 : 'POST'
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-loan-settings'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObj[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObj);
    }
  });
}

function initModulesDataTables(){
  var myObj = {};
  tbl_modules  = $("#tbl-modules-settings").DataTable({
    searchHighlight : true,
    lengthMenu      : [[5, 10, 20, 30, 50, -1], [5, 10, 20, 30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3,4] 
      },
      { 
        className            : 'text-center', 
        targets              : [4] 
      }
    ],
    "serverSide"               : true,
    "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-modules',
        "type"                 : 'POST'
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-loan-settings'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObj[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObj);
    }
  });
}

function initUserAccessLevelDataTables(){
  var myObj = {};
  tbl_user_access_level  = $("#tbl-user-access-level-settings").DataTable({
    searchHighlight : true,
    lengthMenu      : [[5, 10, 20, 30, 50, -1], [5, 10, 20, 30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3,4,5,6,7] 
      },
      { 
        className            : 'text-center', 
        targets              : [4] 
      }
    ],
    "serverSide"               : true,
    "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-user-access-level',
        "type"                 : 'POST'
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-loan-settings'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObj[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObj);
    }
  });
}

function removeChildChecked(e){
  if ($(e).is(':checked')) {
    $(e).parents('tr').find('td:eq(0)').find('input').prop('checked', false);
    $(e).parents('tr').find('td:eq(1)').find('input').prop('checked', false);
  }
}

function uncheckNoAccess(e){
  if ($(e).is(':checked')) {
    $(e).parents('tr').find('td:eq(2)').find('input').prop('checked', false);
  }
}

function removeData(d){
  var id  = d.getAttribute('data-id');
  var tbl = d.getAttribute('data-tbl');
  var fld = d.getAttribute('data-field');
  customSwal(
    'btn btn-success', 
    'btn btn-danger mr-2', 
    'Yes', 
    'Wait',   
    ['', 'Are you sure you want to delete ?', 'question'], 
    function(){
        $.post('delete-data', {'tbl' : tbl, 'w': fld, 'v': id}, function(data, textStatus, xhr) {
          tbl_users.ajax.reload();
          tbl_modules.ajax.reload();
          tbl_user_access_level.ajax.reload();
        });
      }, function(){
        console.log('Fail');
  });
}