<?= $this->extend('layout/template'); ?>

<?= $this->section('myStyle'); ?>
<!-- DataTables -->
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<?= $this->endSection(); ?>

<?= $this->section('scriptHead'); ?>
<script>
    let urlList = "<?= site_url('pemesanan/ajaxList'); ?>";
    let urlSave = "<?= site_url('pemesanan/ajaxSave'); ?>";
    let urlEdit = "<?= site_url('pemesanan/ajaxEdit/'); ?>";
</script>
<script src="<?= base_url(); ?>/ajax/ajaxPemesanan.js"></script>
<?= $this->endSection(); ?>

<?= $this->section('content'); ?>
<?php if (session()->getFlashdata('pesan')) : ?>
    <script>
        let pesan = "<?= $pesan = session()->getFlashdata('pesan')['isi_pesan'] ?>";
        <?php if (session()->getFlashdata('pesan')['status'] == 1) { ?>
            success(pesan);
        <?php } else if (session()->getFlashdata('pesan')['status'] == 2) { ?>
            warning(pesan);
        <?php } else if (session()->getFlashdata('pesan')['status'] == 3) { ?>
            error(pesan);
        <?php } ?>
    </script>
<?php endif; ?>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1><?= $title; ?></h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= site_url('dashboard'); ?>">Dashboard</a></li>
                    <li class="breadcrumb-item active"><?= $title; ?></li>
                </ol>
            </div>
        </div>
    </div>
</section>

<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <a href="javascript:void(0)" class="btn btn-primary btn-sm" data-toggle="tooltip" title="Refresh Data" onclick="reload_table()"><i class="fas fa-sync-alt"></i></a>
                    </div>
                    <div class="card-body">
                        <table id="mytable" class="table table-bordered table-striped" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="text-align: center; width: 5%;">No</th>
                                    <th style="text-align: center;">Kode Pemesanan</th>
                                    <th style="text-align: center;">Tgl. Pesan</th>
                                    <th style="text-align: center;">Total Bayar</th>
                                    <th style="text-align: center;">Pelanggan</th>
                                    <th style="text-align: center;">Status</th>
                                    <th style="text-align: center;">Aksi</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?= $this->include('form/form_pemesanan'); ?>
<?= $this->endSection(); ?>

<?= $this->section('script'); ?>
<script src="<?= base_url(); ?>/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/jszip/jszip.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/pdfmake/pdfmake.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/pdfmake/vfs_fonts.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="<?= base_url(); ?>/assets/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
<?= $this->endSection(); ?>