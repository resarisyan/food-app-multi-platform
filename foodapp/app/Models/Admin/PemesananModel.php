<?php

namespace App\Models\Admin;

use CodeIgniter\Model;

class PemesananModel extends Model
{
    protected $table = 'pemesanan';
    protected $primaryKey = 'kd_pemesanan';
    protected $allowedFields = ['status', 'noteCancel'];

    public function ajaxGetData($length, $start)
    {
        $result = $this->join('pelanggan', 'pelanggan.id = pemesanan.id_pelanggan')
            ->orderBy('kd_pemesanan', 'desc')
            ->findAll($length, $start);
        return $result;
    }

    public function ajaxGetDataSearch($search, $length, $start)
    {

        $result = $this->like('kd_pemesanan', $search)
            ->orLike('nama', $search)
            ->join('pelanggan', 'pelanggan.id = pemesanan.id_pelanggan')
            ->orderBy('kd_pemesanan', 'desc')
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

        $result = $this->like('kd_pemesanan', $search)
            ->orLike('nama', $search)
            ->join('pelanggan', 'pelanggan.id = pemesanan.id_pelanggan')
            ->countAllResults();

        return $result;
    }

    public function getDetailInvoice($kd_pemesanan)
    {
        $detail_pesanan = $this->where('kd_pemesanan', $kd_pemesanan)
            ->get();
        $detail_pembayaran = $this->db->table('log_pemesanan')
            ->where('kd_pemesanan', $kd_pemesanan)
            ->get();
        if ($detail_pesanan->getResult() != null) {
            $nama_pelanggan = $this->db->table('pelanggan')
                ->where('id', $detail_pesanan->getRow()->id_pelanggan)
                ->get()->getRow()->nama;
        } else {
            $nama_pelanggan = null;
        }
        return ['detail_pesanan' => $detail_pesanan, 'detail_pembayaran' => $detail_pembayaran, 'nama_pelanggan' => $nama_pelanggan];
    }

    public function getDetailPesanan($kd_pemesanan)
    {
        $result = $this->db->table('log_pemesanan')
            ->where('kd_pemesanan', $kd_pemesanan)
            ->get();

        return $result;
    }

    public function getDataPesanan($kd_pemesanan)
    {
        $result = $this->where('kd_pemesanan', $kd_pemesanan)
            ->limit(1)
            ->first();

        return $result;
    }
}
