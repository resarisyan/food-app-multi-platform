<nav class="navbar main-nav navbar-expand-lg px-2 px-sm-0 py-2 py-lg-0">
    <div class="container">
        <a class="navbar-brand" href="<?= base_url(); ?>/index.php"><img src="<?= base_url(); ?>/assets/dist/img-home/logo.png" alt="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="ti-menu"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item <?= ($halaman == 'home') ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= base_url(); ?>/home">Home</a>
                </li>
                <li class="nav-item <?= ($halaman == 'team') ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= base_url(); ?>/team">Team</a>
                </li>
                <li class="nav-item <?= ($halaman == 'about') ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= base_url(); ?>/about">About</a>
                </li>
                <li class="nav-item <?= ($halaman == 'contact') ? 'active' : '' ?>">
                    <a class="nav-link" href="<?= base_url(); ?>/contact">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>