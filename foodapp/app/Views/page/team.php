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
                <h1>Our Team</h1>
                <!-- Page Description -->
                <p>Tim Z Restaurant terdiri dari beberapa anggota, setiap anggota memiliki peranan dan turut andil dalam membangun Z Restaurant menjadi lebih baik.</p>
            </div>
        </div>
    </div>
</section>

<!--====  End of Page Title  ====-->


<!--==================================
=            Feature Team            =
===================================-->
<section class="founders section pt-0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <!-- Featured Member -->
                <div class="founder text-center">
                    <!-- Member Image -->
                    <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/person-1.jpg" alt="featured-member">
                    <!-- Name -->
                    <h2>Resa Auliana Risyan</h2>
                    <!-- position -->
                    <cite>Founder & CEO</cite>
                    <!-- Description -->
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Saepe sit in optio animi commodi natus fugiat laborum nobis eveniet debitis, nam sunt ducimus at eius! Distinctio accusantium eum impedit unde!</p>
                    <!-- Social Sites -->
                    <ul class="list-inline social-links">
                        <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                        <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                        <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                        <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Feature Team  ====-->

<section class="design-team section pt-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/person-2.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Ferry Aditya Herman</h3>
                    <!-- Position -->
                    <cite>Designer</cite>
                    <!-- Description -->
                    <p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/person-3.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Dita Aulya Yulanda</h3>
                    <!-- Position -->
                    <cite>Tester</cite>
                    <!-- Description -->
                    <p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/person-4.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Renaldy Baleano Yorzain</h3>
                    <!-- Position -->
                    <cite>Marketing</cite>
                    <!-- Description -->
                    <p>Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vivamus suscipit tortor eget felis porttitor volutpat.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Design Team  ====-->

<!--=================================
=            Marketing Team         =
==================================-->
<section class="design-team section pt-0">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/chef-1.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Juna Rorimpandey</h3>
                    <!-- Position -->
                    <cite>Chef</cite>
                    <!-- Description -->
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Suscipit eaque natus distinctio ratione debitis doloribus earum, magnam, animi ipsa sapiente illo at, veniam magni perspiciatis! Exercitationem rerum suscipit veritatis? Quos?</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/chef-3.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Renatta Moeloek</h3>
                    <!-- Position -->
                    <cite>Chef</cite>
                    <!-- Description -->
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Suscipit eaque natus distinctio ratione debitis doloribus earum, magnam, animi ipsa sapiente illo at, veniam magni perspiciatis! Exercitationem rerum suscipit veritatis? Quos?</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <!-- Team -->
                <div class="team-sm">
                    <!-- Team Member Image -->
                    <div class="image">
                        <img class="w-100" src="<?= base_url(); ?>/assets/dist/img-home/chef-2.jpg" alt="member-image">
                        <!-- Social Contacts -->
                        <div class="social-links">
                            <ul class="list-inline">
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-facebook"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void(0)"><i class="ti-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Name -->
                    <h3>Arnold Poernomo</h3>
                    <!-- Position -->
                    <cite>Chef</cite>
                    <!-- Description -->
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Suscipit eaque natus distinctio ratione debitis doloribus earum, magnam, animi ipsa sapiente illo at, veniam magni perspiciatis! Exercitationem rerum suscipit veritatis? Quos?</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--====  End of Marketing Team  ====-->


<!--=====================================
=            Section comment            =
======================================-->
<section class="section cta-hire bg-gary">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <!-- Hire Title -->
                <h2>Kami Sedang Membutuhkan Ahli Promosi!</h2>
                <!-- Job Description -->
                <p>Jangan ragu untuk bergabung dengan kami, kirimkan portfolio anda kepada kami dan pastikan anda memenuhi persyaratannya.</p>
                <!-- Action Button -->
                <a href="javascript:void(0)" class="mt-3 btn btn-main-md">Gabung Bersama Z Resturant Sekarang</a>
            </div>
        </div>
    </div>
</section>
<?= $this->endSection(); ?>