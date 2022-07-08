<?= $this->extend('layout/template'); ?>

<?= $this->section('myStyle'); ?>
<!-- DataTables -->
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
<?= $this->endSection(); ?>

<?= $this->section('scriptHead'); ?>

<script src="<?= base_url(); ?>/ajax/ajaxDetailPemesanan.js"></script>
<?= $this->endSection(); ?>

<?= $this->section('content'); ?>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1><?= $title; ?></h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?= site_url('dashboard'); ?>">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="<?= site_url('pemesanan'); ?>">Pemesanan</a></li>
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
                        <a href="<?= site_url('pemesanan'); ?>" class="btn btn-primary btn-sm"><i class="fas fa-chevron-left"></i> &nbsp; Kembali</a>
                        <?php $id = $pesanan->getResult();
                        if ($id) :
                            $id = $id[0]->kd_pemesanan;
                        ?>
                            <a href="<?= base_url('pemesanan/cetak/' . $id); ?>" class="btn btn-primary btn-sm"><i class="fas fa-print"></i> &nbsp; Cetak</a>
                        <?php endif; ?>
                    </div>
                    <div class="card-body">
                        <table id="mytable" class="table table-bordered table-striped" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="text-align: center; width: 5%;">No</th>
                                    <th style="text-align: center;">Nama Produk</th>
                                    <th style="text-align: center;">Harga</th>
                                    <th style="text-align: center; width: 5%;">Qty</th>
                                    <th style="text-align: center;">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1;
                                foreach ($pesanan->getResult() as $row) : ?>
                                    <tr>
                                        <td><?= $i++; ?></td>
                                        <td><?= $row->nama_produk; ?></td>
                                        <td><?= formatRupiah($row->harga, 1); ?></td>
                                        <td><?= $row->qty; ?></td>
                                        <td><?= formatRupiah($row->total, 1); ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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