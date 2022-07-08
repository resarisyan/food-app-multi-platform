<div class="modal fade" id="modal-form" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">
                        &times;
                    </span>
                </button>
            </div>
            <div class="modal-body form">
                <form action="#" id="form" class="form-horizontal">
                    <?= csrf_field(); ?>
                    <input type="hidden" name="kd_pemesanan">
                    <div class="form-group">
                        <label for="nama_kategori">Status Pesanan</label>
                        <?php
                        $dropdown = field_enums('pemesanan', 'status', 'Pilih Status');
                        echo form_dropdown('status', $dropdown, '', 'class="form-control" id="status"');
                        ?>
                        <span class="help-block text-danger"></span>
                    </div>

                    <div class="form-group" id="keterangan">
                        <label for="noteCancel">Textarea</label>
                        <textarea name="noteCancel" class="form-control" id="noteCancel" rows="3" placeholder="Alasan Pesanan Dibatalkan ..."></textarea>
                        <span class="help-block text-danger"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" id="btn-save" onclick="ajaxSave()" class="btn btn-primary">Simpan</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
            </div>
        </div>
    </div>
</div>