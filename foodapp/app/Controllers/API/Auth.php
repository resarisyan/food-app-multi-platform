<?php

namespace App\Controllers\API;

use CodeIgniter\RESTful\ResourceController;
use App\Models\AuthModel;

class Auth extends ResourceController
{
    protected $auth;

    public function __construct()
    {
        $this->auth = new AuthModel();
    }

    public function getValidateEmail()
    {
        $result = $this->auth->getValidateEmail(
            $this->request->getVar('email')
        );

        if ($result) {
            return $this->respond([
                'status' => true,
                'message' => 'Email Terdaftar.',
                'data' => [
                    'id' => $result
                ]
            ], 200);
        } else {
            return $this->respond([
                'status' => false,
                'message' => 'Email Belum Terdaftar!'
            ], 400);
        }
    }

    public function login()
    {
        $data = [
            'email' => $this->request->getVar('email'),
            'password' => $this->request->getVar('password')
        ];

        $result = $this->auth->login($data);
        if ($result) {
            return $this->respond([
                'status' => true,
                'message' => 'Login Berhasil',
                'data' => [
                    'id' => $result
                ]
            ], 200);
        } else if ($result == 0) {
            return $this->respond([
                'status' => false,
                'message' => 'Akun Anda Dinonaktifkan, Silahkan Hubungi Admin!'
            ], 400);
        } else {
            return $this->respond([
                'status' => false,
                'message' => 'Data Tidak Ditemukan!'
            ], 400);
        }
    }

    public function register()
    {
        $data = [
            'nama' => $this->request->getVar('nama'),
            'no_telp' => $this->request->getVar('no_telp'),
            'email' => $this->request->getVar('email'),
            'password' => $this->request->getVar('password'),
            'status_pelanggan' => '1',
        ];

        $result = $this->auth->register($data);

        if ($result) {
            return $this->respond([
                'status' => true,
                'message' => 'Registrasi Berhasil',
                'data' => [
                    'id' => $result
                ]
            ], 200);
        } else {
            return $this->respond([
                'status' => false,
                'message' => 'Data Tidak Ditemukan!'
            ], 400);
        }
    }

    public function simpanPassword()
    {
        $data = [
            'id' => $this->request->getVar('id'),
            'password' => $this->request->getVar('password'),
        ];

        $result = $this->auth->simpanPassword($data);

        if ($result) {
            return $this->respond([
                'status' => true,
                'message' => 'Berhasil Mengubah Password',
            ], 200);
        } else {
            return $this->respond([
                'status' => false,
                'message' => 'Gagal Mengubah Password!'
            ], 400);
        }
    }
}
