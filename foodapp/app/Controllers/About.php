<?php

namespace App\Controllers;

class About extends BaseController
{
    protected $halaman, $title, $kategori;

    public function __construct()
    {
    }

    public function index()
    {
        $data = [
            'halaman' => 'About',
            'title' => 'about',
            'main' => 'page/about'
        ];

        return view('page/about', $data);
    }
}
