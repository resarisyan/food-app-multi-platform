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
                <h1>About Z Restaurant</h1>
                <!-- Page Description -->
                <p>Z Restaurant didirikan pada 5 Mei 2022. Ini merupakan aplikasi yang berguna untuk memudahkan pembeli di restoran kami memesan makan secara online.</p>
            </div>
        </div>
    </div>
</section>

<!--====  End of Page Title  ====-->


<!--===============================
=            Our Story            =
================================-->
<section class="section about p-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 align-self-center">
                <div class="content text-center text-lg-left">
                    <!-- Headline -->
                    <h2>Cerita Tentang Restoran Kami</h2>
                    <!-- Story -->
                    <p>Z Restaurant adalah restoran masa kini yang cocok untuk kaum milenial. Restoran ini menghadirkan suasana dan nuansa baru yang jarang ditemukan pada restoran pada umumnya. Arti Z pada restoran kami melambangkan generasi Z, ini artinya restoran kami cocok bagi para kamu generasi Z atau milenial.</p>
                </div>
            </div>
            <div class="col-lg-6 mt-4 mt-lg-0">
                <!-- Story Image Slider -->
                <div class="about-slider">
                    <!-- Story Image -->
                    <div class="item">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/restaurant-1.jpg" alt="slider-image">
                    </div>
                    <!-- Story Image -->
                    <div class="item">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/restaurant-2.jpg" alt="slider-image">
                    </div>
                    <!-- Story Image -->
                    <div class="item">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/restaurant-3.jpg" alt=" slider-image">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Our Story  ====-->

<section class="section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title mb-0">
                    <h2>Kenapa Kami Membuat Aplikasi Z Restauran?</h2>
                    <p>Ide ini muncul karena banyak pelanggan kami yang tidak memiliki banyak waktu tetapi ingin mencoba makanan di restoran kami. Untuk itu Z Restauran App hadir supaya memudahkan seseorang untuk membeli makanan/minuman di restoran kami tanpa perlu kemanana, karena kami yang akan mengantar makanan/minumannya ke rumah anda.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Behind Story  ====-->

<!--=====================================
=            Quotes Slider              =
======================================-->
<!--
<section class="section quotes pt-0">
    <div class="container">
        <div class="row">
            <div class="col-10 m-auto text-center">
                <div class="quote-slider">
                    <div class="item mb-4">
                        <h2>Behind every great product, there is a great mind.</h2>
                        <cite class="ml-0">-TechCrunch</cite>
                    </div>
                    <div class="item mb-4">
                        <h2>Behind every great product, there is a great mind.</h2>
                        <cite class="ml-0">-TechCrunch</cite>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
-->
<!--====  End of Quotes Slider  ====-->

<section class="section clients bg-gray">
    <div class="container">
        <div class="row">
            <div class="col-10 m-auto text-center">
                <h3>Aplikasi Ini Dibuat Oleh</h3>
                <div class="client-slider">
                    <div class="item mb-4">
                        <img class="m-auto" src="<?= base_url(); ?>/assets/dist/img-home/sandbox-company.png">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Client Slider  ====-->
<?= $this->endSection(); ?>