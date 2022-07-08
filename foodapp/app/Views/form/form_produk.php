<?php
$dropdown = getDropdownList('kategori', ['nama_kategori', 'nama_kategori'], 'Kategori Produk');
$js = 'class="form-control""';
if ($dropdown == null) : ?>
    <script>
        $('.mytambah, .myedit').on('click', function() {
            setTimeout(function() {
                $('#modal-form').modal('hide');
                error('Daftar Kategori Kosong/Tidak Aktif');
            }, 500);
        })
    </script>
<?php endif;
?>
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
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label for="harga">Nama Produk</label>
                        <input type="text" class="form-control" id="nama_produk" placeholder="Masukan Nama Produk" name="nama_produk">
                        <span class="help-block text-danger"></span>
                    </div>

                    <div class="form-group">
                        <label for="harga">Harga Produk</label>
                        <input type="text" class="form-control" id="harga" placeholder="Masukan Harga Produk" name="harga">
                        <span class="help-block text-danger"></span>
                    </div>

                    <?php if ($dropdown != null) { ?>
                        <div class="form-group">
                            <label>Select</label>
                            <?php
                            echo form_dropdown('kategori', $dropdown, 'large', $js);
                            ?>
                            <span class="help-block text-danger"></span>
                        </div>
                    <?php } else {
                        $tempKategori = tempKategori('produk', 'kategori');
                    ?>
                        <div class="form-group">
                            <label>Select</label>
                            <select name="kategori" class="form-control">
                                <option value="<?= $tempKategori;  ?>" selected><?= $tempKategori;  ?></option>
                            </select>
                            <span class=" help-block text-danger"></span>
                        </div>
                    <?php } ?>

                    <div class="form-group">
                        <label for="deskripsi">Deskripsi Produk</label>
                        <textarea class="form-control" id="deskripsi" rows="3" name="deskripsi"></textarea>
                        <span class="help-block text-danger"></span>
                    </div>

                    <div class="form-group">
                        <label for="gambar">Unduh Gambar</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="gambar" name="gambar" onchange="imgPreview()">
                            <label class="custom-file-label" for="gambar">Pilih Gambar</label>
                        </div>
                        <span class="help-block text-danger"></span>
                        <img class="img-preview img-fluid mt-3 mb-3" width="100%" height="250px">
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