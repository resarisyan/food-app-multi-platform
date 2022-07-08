<?= $this->extend('layout/template-home'); ?>

<?= $this->section('navbar'); ?>
<?= $this->include('layout/navbar-home'); ?>
<?= $this->endSection(); ?>

<?= $this->section('content'); ?>
<section class="section gradient-banner">
    <div class="shapes-container">
        <div class="shape" data-aos="fade-down-left" data-aos-duration="1500" data-aos-delay="100"></div>
        <div class="shape" data-aos="fade-down" data-aos-duration="1000" data-aos-delay="100"></div>
        <div class="shape" data-aos="fade-up-right" data-aos-duration="1000" data-aos-delay="200"></div>
        <div class="shape" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="200"></div>
        <div class="shape" data-aos="fade-down-left" data-aos-duration="1000" data-aos-delay="100"></div>
        <div class="shape" data-aos="fade-down-left" data-aos-duration="1000" data-aos-delay="100"></div>
        <div class="shape" data-aos="zoom-in" data-aos-duration="1000" data-aos-delay="300"></div>
        <div class="shape" data-aos="fade-down-right" data-aos-duration="500" data-aos-delay="200"></div>
        <div class="shape" data-aos="fade-down-right" data-aos-duration="500" data-aos-delay="100"></div>
        <div class="shape" data-aos="zoom-out" data-aos-duration="2000" data-aos-delay="500"></div>
        <div class="shape" data-aos="fade-up-right" data-aos-duration="500" data-aos-delay="200"></div>
        <div class="shape" data-aos="fade-down-left" data-aos-duration="500" data-aos-delay="100"></div>
        <div class="shape" data-aos="fade-up" data-aos-duration="500" data-aos-delay="0"></div>
        <div class="shape" data-aos="fade-down" data-aos-duration="500" data-aos-delay="0"></div>
        <div class="shape" data-aos="fade-up-right" data-aos-duration="500" data-aos-delay="100"></div>
        <div class="shape" data-aos="fade-down-left" data-aos-duration="500" data-aos-delay="0"></div>
    </div>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 order-2 order-md-1 text-center text-md-left">
                <h1 class="text-white font-weight-bold mb-4">Z Restaurant App</h1>
                <p class="text-white mb-5">Memesan makanan/minuman di restoran kami, semudah membalikan telapak tangan!</p>
                <a href="#" class="btn btn-main-md">Download Now</a>
            </div>
            <div class="col-md-6 text-center order-1 order-md-2">
                <img class="img-fluid" src="<?= base_url(); ?>/assets/dist/img-home/mobile.png" alt="screenshot">
            </div>
        </div>
    </div>
</section>
<!--====  End of Hero Section  ====-->

<section class="section pt-0 position-relative pull-top">
    <div class="container">
        <div class="rounded shadow p-5 bg-white">
            <div class="row">
                <div class="col-lg-4 col-md-6 mt-5 mt-md-0 text-center">
                    <i class="fas fa-bolt fa-2x" style="color: #007bff;"></i>
                    <h3 class="mt-4 text-capitalize h5 ">Proses Cepat</h3>
                </div>
                <div class="col-lg-4 col-md-6 mt-5 mt-md-0 text-center">
                    <i class="fas fa-clock fa-2x" style="color: #007bff;"></i>
                    <h3 class="mt-4 text-capitalize h5 ">Pelayanan 24 Jam</h3>
                </div>
                <div class="col-lg-4 col-md-12 mt-5 mt-lg-0 text-center">
                    <i class="fas fa-user-alt fa-2x" style="color: #007bff;"></i>
                    <h3 class="mt-4 text-capitalize h5 ">Ramah Pengguna</h3>
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!--==================================
=            Feature Grid            =
===================================-->
<section class="feature section pt-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 ml-auto justify-content-center">
                <!-- Feature Mockup -->
                <div class="image-content" data-aos="fade-right">
                    <img class="img-fluid" src="<?= base_url(); ?>/assets/dist/img-home/mobile-2.png" alt="iphone">
                </div>
            </div>
            <div class="col-lg-6 mr-auto align-self-center">
                <div class="feature-content">
                    <!-- Feature Title -->
                    <h2>Apa Itu Z Restaurant?</h2>
                    <!-- Feature Description -->
                    <p class="desc">Z Restaurant adalah restoran dengan gaya kekinian, restoran ini cocok bagi kaum milenial atau generasi Z. Restoran ini juga menyediakan sebuah aplikasi yang memudahkan pembelinya untuk membeli sesuatu di Z Resturant.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="feature section pt-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 ml-auto align-self-center">
                <div class="feature-content">
                    <!-- Feature Title -->
                    <h2>Apa Manfaat Menggunakan Aplikasi Z Resturant?</h2>
                    <!-- Feature Description -->
                    <p>Dengan menggunakan aplikasi Z Restaurant kalian tidak perlu lagi pergi ke restoran kami jika hendak membeli makan atau minuman. Kalian cukup memesannya menggunakan aplikasi kami dan kami akan mengantar pesanan anda sesuai dengan alamat tujuan.</p>
                </div>
            </div>
            <div class="col-lg-6 mr-auto justify-content-center">
                <!-- Feature mockup -->
                <div class="image-content" data-aos="fade-left">
                    <img class="img-fluid" src="<?= base_url(); ?>/assets/dist/img-home/mobile-3.png">
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Feature Grid  ====-->

<section class="call-to-action-app section bg-blue">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Sekarang Waktunya Membuat Segalanya Praktis</h2>
                <p>Gunakan aplikasi Z Resturant untuk memudahkan kalian memesan makanan/minuman di restoran kami.
                    <br>Jangan ragu download sekarang!
                </p>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="javascript:void(0)" class="btn btn-rounded-icon">
                            <i class="ti-apple"></i>
                            Iphone
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="javascript:void(0)" class="btn btn-rounded-icon">
                            <i class="ti-android"></i>
                            Android
                        </a>
                    </li>
                    <!-- <li class="list-inline-item">
                            <a href="" class="btn btn-rounded-icon">
                                <i class="ti-microsoft-alt"></i>
                                Windows
                            </a>
                        </li> -->
                </ul>
            </div>
        </div>
    </div>
</section>
<?= $this->endSection(); ?>