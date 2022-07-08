let table;
let save_method;
let url;

$(document).ready(function(){
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
});

function reload_table(){
    table.ajax.reload(null, false);
}


function ajaxStatus(id){
    confirmDialog("Apakah Status Ini Akan Diubah?", (e) => {
        if (e) {
            $.ajax({
                url: urlStatus + id,
                type: "GET",
                dataType: "JSON",
                success: function(data){
                    if(data.status){
                        success('Status Berhasil Diubah...');
                        reload_table();
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    error(errorThrown);
                }
            })
        }
    });
}

function ajaxDelete(id){
    confirmDialog("Apakah Anda Yakin Ingin Menghapus Akun Pelanggan Ini?", (e) => {
        if (e) {
            $.ajax({
                url: urlDelete + id,
                type: "GET",
                dataType: "JSON",
                success: function(data){
                    if(data.status){
                        success('Akun Pelanggan Berhasil Dihapus...');
                        reload_table();
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    error(errorThrown);
                }
            })
        }
    });
}

