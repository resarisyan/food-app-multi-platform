<?= $this->extend('layout/template-home'); ?>

<?= $this->section('content'); ?>
<section class="error-page">
    <div class="center">
        <div class="block text-center">
            <h1>404</h1>
            <h3>Page Not Found</h3>
            <p>The link you clicked may be broken or the
                <br>page may have been removed.
            </p>
            <a href="<?= base_url(); ?>" class="btn btn-main-md">visit homepage</a>
        </div>
    </div>
</section>
<?= $this->endSection(); ?>