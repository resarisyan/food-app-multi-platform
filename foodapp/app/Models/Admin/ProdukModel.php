<?php

namespace App\Models\Admin;

use CodeIgniter\Model;

class ProdukModel extends Model
{
    protected $table = 'produk';
    protected $useTimestamps = true;
    protected $allowedFields = ['nama_produk', 'harga', 'deskripsi', 'kategori', 'gambar', 'status'];

    public function getRulesValidation($method)
    {
        if ($method == 'update') {
            $imgRules = 'max_size[gambar,1024]|is_image[gambar]|ext_in[gambar,png,jpg,jpeg]';
        } else {
            $imgRules = 'uploaded[gambar]|max_size[gambar,1024]|is_image[gambar]|ext_in[gambar,png,jpg,jpeg]';
        }
        $rulesValidation = [
            'nama_produk' => [
                'label' => 'Nama Produk',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Harus Diisi.'
                ]
            ],
            'harga' => [
                'label' => 'Harga',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Harus Diisi.'
                ]
            ],
            'deskripsi' => [
                'label' => 'Deskripsi',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Harus Diisi.'
                ]
            ],
            'kategori' => [
                'label' => 'Kategori',
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Harus Diisi.'
                ]
            ],
            'gambar' => [
                'label' => 'Gambar',
                'rules' => $imgRules,
                'errors' => [
                    'uploaded' => '{field} Harus Dipilih.',
                    'max_size' => '{field} Melebihi Ukuran Yang Ditentukan (Max 1MB).',
                    'is_image' => 'Format {field} Tidak Sesuai.',
                    'ext_in' => 'Format {field} Tidak Sesuai.'
                ]
            ],
        ];

        return $rulesValidation;
    }

    public function ajaxGetData($length, $start)
    {
        $result = $this->orderBy('id', 'desc')
            ->findAll($length, $start);
        return $result;
    }

    public function ajaxGetDataSearch($search, $length, $start)
    {
        $result = $this->like('nama_produk', $search)
            ->orLike('harga', $search)
            ->orLike('deskripsi', $search)
            ->orLike('kategori', $search)
            ->orderBy('id', 'desc')
            ->findAll($length, $start);
        return $result;
    }

    public function ajaxGetTotal()
    {
        $result = $this->countAll();

        if (isset($result)) {
            return $result;
        }

        return 0;
    }

    public function ajaxGetTotalSearch($search)
    {
        $result = $this->like('nama_produk', $search)
            ->orLike('harga', $search)
            ->orLike('deskripsi', $search)
            ->orLike('kategori', $search)
            ->countAllResults();

        return $result;
    }
}
