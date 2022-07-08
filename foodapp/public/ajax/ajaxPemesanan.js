let table;
let save_method;
let url;

$(document).ready(function(){
    $('#keterangan').hide();
    table = $('#mytable').DataTable({
        "pageLength": 10,
        "autoWidth": true,
        "lengthChange": false,
        "ordering": false,
        "processing": true,
        "searching": true,
        "serverSide":true,
        "deferRender":true,
        "ajax": {
            'url': urlList,
            "type": "GET"
        }
    });

    $('#status').on('change', function(){
        const stt = $(this).val();

        if(stt == 0){
            $('#keterangan').show();
        } else{
            $('#keterangan').hide();
        }
    });

});

function reload_table(){
    table.ajax.reload(null, false);
}

function ajaxSave(){
    $('#btn-save').text('Proses...');
    $('#btn-save').text('Disabled...', true);

    $.ajax({
        url: urlSave,
        type: "POST",
        data: new FormData($('#form')[0]),
        contentType: false,
        processData: false,
        dataType: "JSON",
        success: function(data){
            if(data.status){
                $('#modal-form').modal('hide');
                if(url == save_method){
                    success('Data Berhasil Disimpan...');
                } else{
                    success('Data Berhasil Diubah...');
                }
                reload_table();
            }

            $('#btn-save').text('Simpan');
            $('#btn-save').attr('disabled', false);
        },
        error: function(jqXHR, textStatus, errorThrown){
            error(errorThrown);
            $('#btn-save').text('Simpan');
            $('#btn-save').attr('disabled', false);
        }
    })
}

function ajaxEdit(kd_pemesanan){
    $.ajax({
        url: urlEdit + kd_pemesanan,
        type: "GET",
        dataType: "JSON",
        success: function(data){
            $('[name="kd_pemesanan"]').val(data.kd_pemesanan);
            $('[name="status"]').val(data.status);
            
            $('#modal-form').modal('show');
            $('.modal-title').text('Ubah Status Pesanan');
        },
        error: function(jqXHR, textStatus, errorThrown){
            error(errorThrown);
        }
    })
}