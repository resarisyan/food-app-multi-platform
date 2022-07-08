<?php

namespace App\Controllers;

class Contact extends BaseController
{
    protected $halaman, $title, $kategori;

    public function __construct()
    {
        $this->title = 'Contact';
        $this->halaman = 'contact';
    }

    public function index()
    {
        $data = [
            'halaman' => $this->title,
            'title' => $this->halaman,
            'main' => 'page/contact'
        ];

        return view('page/contact', $data);
    }
}
