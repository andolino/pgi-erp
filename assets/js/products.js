$(document).ready(function () {
  $(document).on('click', '#addProducts', function (e) {
    var title = $(this).attr('data-title');
    $.post("add-products", { 'title': title }, function (res, textStatus, jqXHR) {
      $('#modal-products .modal-content').html(res);
    });
    $('#modal-products').modal('show');
  });
  
  $(document).on('click', '#addCategories', function (e) {
    var title = $(this).attr('data-title');
    $.post("add-categories", { 'title': title }, function (res, textStatus, jqXHR) {
      $('#modal-categories .modal-content').html(res);
    });
    $('#modal-categories').modal('show');
  });
  
  $(document).on('click', '#updateProducts', function (e) {
    var title = $(this).attr('data-title');
    var id = $(this).attr('data-id');
    $.post("add-products", { 'title': title, 'id': id }, function (res, textStatus, jqXHR) {
      $('#modal-products .modal-content').html(res);
    });
    $('#modal-products').modal('show');
  });


  var imagesPreview = function(input, placeToInsertImagePreview) {
    $('.product-img').html('');
    if (input.files) {
      var filesAmount = input.files.length;
      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();
        reader.onload = function(event) {
          $($.parseHTML('<img>')).attr('src', event.target.result).appendTo(placeToInsertImagePreview);
        }
        reader.readAsDataURL(input.files[i]);
      }
    }
  };

  $(document).on('change', '#product-photo-add', function() {
    imagesPreview(this, 'div.product-img');
  });

  $(document).on('submit', '#frm-add-products', function (e) {
    e.preventDefault();
    var frm = new FormData(this);
    // frm.append('update_id', $(this).find('input[type="hidden"]').val());
    $.ajax({
      url:'save-products',
      type:"post",
      data: frm,
      processData:false,
      contentType:false,
      cache:false,
      async:false,
      dataType: 'json',
      success: function(data){
        if (data.msg == 'failed') {
          $('.invalid-feedback').removeClass('invalid-feedback').html('');
          $.each(data, function (i, v) { 
            $('.'+i).addClass('invalid-feedback').html(v).show();
          });
        } else {
          $('.invalid-feedback').removeClass('invalid-feedback');
          Swal.fire(
            data.param1,
            data.param2,
            data.param3
          );
          $('#frm-add-products').trigger('reset');
          $('#modal-products').modal('hide');
        }
      }
    });
  });

});

function initAllProductsDataTables(){
  var myObjKeyLguConst = {};
  $('#tbl-all-products').DataTable().clear().destroy();
  tbl_all_products  = $("#tbl-all-products").DataTable({
    searchHighlight : true,
    lengthMenu      : [[30, 50, -1], [30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3,4,5,6] 
      },
      { 
        className            : 'text-right', 
        targets              : [1,2,3,4,5] 
      },
      { 
        className            : 'text-center', 
        targets              : [6] 
      }
    ],
    "serverSide"               : true,
    // "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-all-products',
        "type"                 : 'POST',
        "data"                 : { 
                                // "status" : $("#tbl-all-products").attr('data-status')
                              }
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-id'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObjKeyLguConst[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObjKeyLguConst);
    }
  });
}

function initAllCategoriesDataTables(){
  var myObjKeyLguConst = {};
  $('#tbl-all-categories').DataTable().clear().destroy();
  tbl_all_categories  = $("#tbl-all-categories").DataTable({
    searchHighlight : true,
    lengthMenu      : [[30, 50, -1], [30, 50, 'All']],
    language: {
        search                 : '_INPUT_',
        searchPlaceholder      : 'Search...',
        lengthMenu             : '_MENU_'       
    },
    columnDefs                 : [
      { 
        orderable            : false, 
        targets              : [0,1,2,3] 
      },
      { 
        className            : 'text-center', 
        targets              : [2] 
      }
    ],
    "serverSide"               : true,
    // "processing"               : true,
    "ajax"                     : {
        "url"                  : 'server-all-categories',
        "type"                 : 'POST',
        "data"                 : { 
                                // "status" : $("#tbl-all-categories").attr('data-status')
                              }
    },
    'createdRow'            : function(row, data, dataIndex) {
      var dataRowAttrIndex = ['data-id'];
      var dataRowAttrValue = [0];
        for (var i = 0; i < dataRowAttrIndex.length; i++) {
          myObjKeyLguConst[dataRowAttrIndex[i]] = data[dataRowAttrValue[i]];
        }
        $(row).attr(myObjKeyLguConst);
    }
  });
}