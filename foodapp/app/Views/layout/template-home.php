<!DOCTYPE html>
<html lang="en">
<title>ZRestaurant | <?= $title; ?></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Bootstrap App Landing Template">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<?= base_url(); ?>/assets/dist/img/favicon.png" />

<!-- PLUGINS CSS STYLE -->
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/slick/slick.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/slick/slick-theme.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/fancybox/jquery.fancybox.min.css">
<link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/custom-plugins/aos/aos.css">

<!-- CUSTOM CSS -->
<link href="<?= base_url(); ?>/assets/css/home.css" rel="stylesheet">
</head>

<body class="body-wrapper" data-spy="scroll" data-target=".privacy-nav">
    <?= $this->renderSection('navbar'); ?>
    <?= $this->renderSection('content'); ?>
    <!-- To Top -->
    <div class="scroll-top-to">
        <i class="ti-angle-up"></i>
    </div>

    <!-- JAVASCRIPTS -->
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/jquery/jquery.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/bootstrap/bootstrap.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/slick/slick.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/fancybox/jquery.fancybox.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/syotimer/jquery.syotimer.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/aos/aos.js"></script>
    <!-- google map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD-cKs7_qfTXnjQqV7mJJr-TD996mcUg9A"></script>
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/google-map/gmap.js"></script>
    <!-- Script -->
    <script src="<?= base_url(); ?>/assets/plugins/custom-plugins/js/script.js"></script>
</body>

</html>