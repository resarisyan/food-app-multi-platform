<?= $this->extend('layout/template-home'); ?>
<?= $this->section('content'); ?>
<section class="user-login section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="block">
                    <!-- Image -->
                    <div class=" align-self-center"><img class="img-fluid" src="<?= base_url(); ?>/assets/dist/img-home/bg-login.png" alt="desk-image"></div>
                    <!-- Content -->
                    <div class="content">
                        <div class="text-center">
                            <div class="logo">
                                <a href="index.html"><img src="<?= base_url(); ?>/assets/dist/img-home/logo.png" alt=""></a>
                            </div>
                            <div class="title-text">
                                <h3>Login</h3>
                            </div>
                        </div>

                        <?= view('Myth\Auth\Views\_message_block') ?>
                        <form action="<?= route_to('login') ?>" method="post">
                            <?= csrf_field() ?>

                            <?php if ($config->validFields === ['email']) : ?>
                                <div class="form-group">
                                    <label for="login"><?= lang('Auth.email') ?></label>
                                    <input type="email" class="form-control main <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" placeholder="<?= lang('Auth.email') ?>">
                                    <div class="invalid-feedback">
                                        <?= session('errors.login') ?>
                                    </div>
                                </div>
                            <?php else : ?>
                                <div class="form-group">
                                    <label for="login"><?= lang('Auth.emailOrUsername') ?></label>
                                    <input type="text" class="form-control form-control main <?php if (session('errors.login')) : ?>is-invalid<?php endif ?>" name="login" placeholder="<?= lang('Auth.emailOrUsername') ?>">
                                    <div class="invalid-feedback">
                                        <?= session('errors.login') ?>
                                    </div>
                                </div>
                            <?php endif; ?>

                            <div class="form-group">
                                <label for="password"><?= lang('Auth.password') ?></label>
                                <input type="password" name="password" class="form-control form-control main  <?php if (session('errors.password')) : ?>is-invalid<?php endif ?>" placeholder="<?= lang('Auth.password') ?>">
                                <div class="invalid-feedback">
                                    <?= session('errors.password') ?>
                                </div>
                            </div>

                            <?php if ($config->allowRemembering) : ?>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" name="remember" class="form-check-input main" <?php if (old('remember')) : ?> checked <?php endif ?>>
                                        <?= lang('Auth.rememberMe') ?>
                                    </label>
                                </div>
                            <?php endif; ?>
                            <br>
                            <button type="submit" class="btn btn-main-sm"><?= lang('Auth.loginAction') ?></button>
                        </form>
                        <hr>
                        <?php if ($config->allowRegistration) : ?>
                            <p><a href="<?= route_to('register') ?>"><?= lang('Auth.needAnAccount') ?></a></p>
                        <?php endif; ?>
                        <?php if ($config->activeResetter) : ?>
                            <p><a href="<?= route_to('forgot') ?>"><?= lang('Auth.forgotYourPassword') ?></a></p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="scroll-top-to">
    <i class="ti-angle-up"></i>
</div>
<?= $this->endSection(); ?>