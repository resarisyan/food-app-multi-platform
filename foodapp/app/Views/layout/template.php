<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZRestaurant | <?= $title; ?></title>
    <link rel="shortcut icon" type="image/x-icon" href="<?= base_url(); ?>/assets/dist/img/favicon.png" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/fontawesome-free/css/all.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/dist/css/adminlte.min.css">
    <link rel="stylesheet" href="<?= base_url(); ?>/assets/plugins/toastr/toastr.min.css">

    <link rel="stylesheet" href="<?= base_url(); ?>/assets/css/style.css">
    <?= $this->renderSection('myStyle'); ?>
    <!-- jQuery -->
    <script src="<?= base_url(); ?>/assets/plugins/jquery/jquery.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/toastr/toastr.min.js"></script>
    <script src="<?= base_url(); ?>/assets/js/alert.js"></script>

    <?= $this->renderSection('scriptHead'); ?>
</head>

<body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed" id="body">
    <div class="preloader flex-column justify-content-center align-items-center" style="background-color: #007bff;">
        <img class="animation__shake" src="<?= base_url(); ?>/assets/dist/img/ZRlogo.png" alt="Logo" height="60" width="60">
    </div>

    <div class="wrapper">
        <?= $this->include('layout/navbar'); ?>
        <?= $this->include('layout/sidebar'); ?>
        <div class="content-wrapper">
            <?= $this->renderSection('content'); ?>
        </div>
    </div>
    <div class="notif"></div>


    <!-- REQUIRED SCRIPTS -->
    <!-- Bootstrap -->
    <script src="<?= base_url(); ?>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="<?= base_url(); ?>/assets/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?= base_url(); ?>/assets/dist/js/adminlte.js"></script>
    <!-- Custom Script -->
    <script src="<?= base_url(); ?>/assets/js/mode.js"></script>


    <!-- PAGE PLUGINS -->
    <!-- jQuery Mapael -->
    <script src="<?= base_url(); ?>/assets/plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/raphael/raphael.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/jquery-mapael/jquery.mapael.min.js"></script>
    <script src="<?= base_url(); ?>/assets/plugins/jquery-mapael/maps/usa_states.min.js"></script>
    <!-- ChartJS -->
    <script src="<?= base_url(); ?>/assets/plugins/chart.js/Chart.min.js"></script>


    <?= $this->renderSection('script'); ?>
</body>

</html>