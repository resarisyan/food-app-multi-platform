<?php

namespace App\Models\Admin;

use CodeIgniter\Model;

class DashboardModel extends Model
{
    protected $table = 'pemesanan';

    public function GetCount()
    {
        $sql = "tgl_pesan > DATE_SUB(CURDATE(), INTERVAL 1 DAY) AND status = '4'";
        $pesanan = $this->countAllResults();
        $pelanggan = $this->db->table('pelanggan')->countAllResults();
        $produk = $this->db->table('produk')->countAllResults();
        $pesananharian =  $this->where($sql)->countAllResults();
        return ['pesanan' => $pesanan, 'pelanggan' => $pelanggan, 'produk' => $produk, 'pesananharian' => $pesananharian];
    }
}
