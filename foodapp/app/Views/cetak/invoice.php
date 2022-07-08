<?php
foreach ($data_invoice['detail_pesanan']->getResult() as $row) {
    $order_number = $row->kd_pemesanan;
    $alamat_kirim = $row->alamat_kirim;
    $metode_pembayaran = $row->payment;
    $catatan = $row->note;
    $ongkir = $row->ongkir;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Custom Style -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/css/cetak.css">

    <title>Invoice Pemesanan</title>
</head>

<body>
    <div class="my-5 page" size="A4">
        <div class="p-5">
            <section class="top-content bb d-flex justify-content-between">
                <div class="logo">
                    <img src="<?= base_url(); ?>/assets/dist/img/logo-invoice.png" alt="" class="img-fluid">
                </div>
                <div class="top-left">
                    <div class="graphic-path">
                        <p>Invoice</p>
                    </div>
                    <div class="position-relative">
                        <p>Invoice No. <span><?= date("Y") . '-' . $order_number; ?></span></p>
                    </div>
                </div>
            </section>

            <section class="store-user mt-5">
                <div class="col-10">
                    <div class="row bb pb-3">
                        <div class="col-7">
                            <p>Penjual</p>
                            <h2>Z Restaurant</h2>
                            <p class="address"> Jl. Pasirgede Raya, Bojongherang, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat</p>
                            <!-- <div class="txn mt-2">TXN: XXXXXXX</div> -->
                        </div>
                        <div class="col-5">
                            <p>Pelanggan</p>
                            <h2><?= $data_invoice['nama_pelanggan'] ?></h2>
                            <p class="address"><?= $alamat_kirim; ?></p>
                            <!-- <div class="txn mt-2">TXN: XXXXXXX</div> -->
                        </div>
                    </div>
                    <div class="row extra-info pt-3">
                        <div class="col-7">
                            <p>Metode Pembayaran: <span><?= $metode_pembayaran; ?></span></p>
                            <p>Order Number: <span>ZR-<?= $order_number ?></span></p>
                        </div>
                        <div class="col-5">
                            <p>Pesanan Dikirim Tanggal: <span><?= date("Y-m-d"); ?></span></p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="product-area mt-4">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>No</td>
                            <td>Nama Produk</td>
                            <td>Harga</td>
                            <td>Jumlah</td>
                            <td>Total</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        $subtotal = 0;
                        foreach ($data_invoice['detail_pembayaran']->getResult() as $row) : ?>
                            <?php $subtotal += $row->harga; ?>
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
            </section>

            <section class="balance-info">
                <div class="row">
                    <div class="col-8">
                        <p class="m-0 font-weight-bold">Catatan: </p>
                        <p><?= $catatan; ?></p>
                    </div>
                    <div class="col-4">
                        <table class="table border-0 table-hover">
                            <tr>
                                <td>Sub Total:</td>
                                <td><?= formatRupiah($subtotal, 1); ?></td>
                            </tr>
                            <tr>
                                <td>Ongkir:</td>
                                <td><?= formatRupiah($ongkir, 1); ?></td>
                            </tr>
                            <tfoot>
                                <tr>
                                    <td>Total:</td>
                                    <td><?= formatRupiah($subtotal + $ongkir, 1); ?></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </section>

            <footer>
                <hr>
                <p class="m-0 text-center">
                    Terimakasih Telah Memasan Di Z Restaurant</a>
                </p>
                <div class="social pt-3">
                    <span class="pr-2">
                        <i class="fas fa-mobile-alt"></i>
                        <span>+628771122234</span>
                    </span>
                    <span class="pr-2">
                        <i class="fas fa-envelope"></i>
                        <span>zrestaurant@gmail.com</span>
                    </span>
                    <span class="pr-2">
                        <i class="fab fa-facebook-f"></i>
                        <span>facebook.com/zrestaurant</span>
                    </span>
                </div>
            </footer>
        </div>
    </div>
</body>

</html>