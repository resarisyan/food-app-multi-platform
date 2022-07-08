<aside class="main-sidebar elevation-4 sidebar-dark-primary" id="sidebar">
    <!-- Brand Logo -->
    <div class="brand-link">
        <img src="<?= base_url(); ?>/assets/dist/img/ZRlogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">ZRestaurant</span>
    </div>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?= base_url(); ?>/assets/dist/img/avatar6.png" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">Admin</a>
            </div>
        </div>

        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="<?= site_url('dashboard'); ?>" class="nav-link <?= ($halaman == 'dashboard') ? 'active' : '' ?>">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= site_url('kategori'); ?>" class="nav-link <?= ($halaman == 'kategori') ? 'active' : '' ?> ">
                        <i class="nav-icon fas fa-cubes"></i>
                        <p>Kategori</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= site_url('produk'); ?>" class="nav-link <?= ($halaman == 'produk') ? 'active' : '' ?> ">
                        <i class="nav-icon fas fa-cube"></i>
                        <p>Produk</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= site_url('pelanggan'); ?>" class="nav-link <?= ($halaman == 'pelanggan') ? 'active' : '' ?> ">
                        <i class="nav-icon fas fa-user"></i>
                        <p>Pelanggan</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?= site_url('pemesanan'); ?>" class="nav-link <?= ($halaman == 'pemesanan') ? 'active' : '' ?> ">
                        <i class="nav-icon fas fa-exchange-alt"></i>
                        <p>Pemesanan</p>
                    </a>
                </li>
                <li class="nav-item">
                    <!-- <a href="<?= site_url('laporan'); ?>" class="nav-link <?= ($halaman == 'laporan') ? 'active' : '' ?> ">
                        <i class="nav-icon fas fa-file"></i>
                        <p>Laporan</p>
                    </a> -->
                </li>
            </ul>
        </nav>
    </div>
</aside>