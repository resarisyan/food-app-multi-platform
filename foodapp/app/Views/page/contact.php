<?= $this->extend('layout/template-home'); ?>

<?= $this->section('navbar'); ?>
<?= $this->include('layout/navbar-home'); ?>
<?= $this->endSection(); ?>

<?= $this->section('content'); ?>
<section class="section page-title">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 m-auto">
                <!-- Page Title -->
                <h1>Contact Us</h1>
                <!-- Page Description -->
                <p>Hubungi kami jika kalian memiliki pertanyaan atau masalah terkait restoran kami.</p>
            </div>
        </div>
    </div>
</section>

<!--====  End of Page Title  ====-->


<!--=====================================
=            Address and Map            =
======================================-->
<section class="address">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 align-self-center">
                <div class="block">
                    <div class="address-block text-center mb-5">
                        <div class="icon">
                            <i class="ti-mobile"></i>
                        </div>
                        <div class="details">
                            <h3>(+62) 877 112 2234 (IN)</h3>
                            <h3>(+62) 821 112 2234 (IN)</h3>
                        </div>
                    </div>
                    <div class="address-block text-center">
                        <div class="icon">
                            <i class="ti-map-alt"></i>
                        </div>
                        <div class="details">
                            <h3>Jl. Pasirgede Raya, Bojongherang, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat
                            </h3>
                            <h3>43216, Indonesia</h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 mt-5 mt-lg-0">
                <div class="google-map">
                    <!-- Google Map -->
                    <div id="map_canvas" data-latitude="-6.807512463118627" data-longitude="107.13986625227625"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<br><br>
<?= $this->endSection(); ?>