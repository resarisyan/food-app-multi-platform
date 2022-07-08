<?php

namespace App\Models;

use CodeIgniter\Model;

class KategoriModel extends Model
{
    protected $table = 'kategori';
    protected $useTimestamps = true;

    public function getKategori()
    {
        // if ($kategori == 'all') {
        //     return $this->where("status = '1'")->findAll();
        // } else {

        // }
        return $this->select('id, nama_kategori')->where("status = '1'")->findAll();
    }
}
