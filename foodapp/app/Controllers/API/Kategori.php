<?php

namespace App\Controllers\API;

use CodeIgniter\RESTful\ResourceController;
use App\Models\KategoriModel;

class Kategori extends ResourceController
{
    protected $kategori;

    public function __construct()
    {
        $this->kategori = new KategoriModel();
    }

    public function index()
    {
        $result = $this->kategori->getKategori();

        if ($result) {
            return $this->respond($result, 200);
        } else {
            return $this->respond([
                'status' => false,
                'message' => 'Data Tidak Ditemukan!'
            ], 400);
        }
    }
}
