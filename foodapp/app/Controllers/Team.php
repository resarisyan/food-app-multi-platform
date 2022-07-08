<?php

namespace App\Controllers;

class Team extends BaseController
{
    protected $halaman, $title, $kategori;

    public function __construct()
    {
        $this->title = 'Team';
        $this->halaman = 'team';
    }

    public function index()
    {
        $data = [
            'halaman' => $this->title,
            'title' => $this->halaman,
            'main' => 'page/team'
        ];

        return view('page/team', $data);
    }
}
