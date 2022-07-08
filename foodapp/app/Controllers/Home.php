<?php

namespace App\Controllers;

class Home extends BaseController
{
    protected $halaman, $title, $kategori;

    public function __construct()
    {
        $this->title = 'home';
        $this->halaman = 'Home';
    }

    public function index()
    {
        $data = [
            'halaman' => $this->title,
            'title' => $this->halaman,
            'main' => 'page/home'
        ];

        return view('page/home', $data);
    }
}
