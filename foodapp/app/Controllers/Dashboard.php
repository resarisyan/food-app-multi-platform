<?php

namespace App\Controllers;

use App\Models\Admin\DashboardModel;

class Dashboard extends BaseController
{
    protected $title, $halaman;

    public function __construct()
    {
        $this->title = 'Dashboard';
        $this->halaman = 'dashboard';
        $this->dashboard = new DashboardModel();
    }

    public function index()
    {
        $datacount = $this->dashboard->GetCount();
        $data = [
            'title' => $this->title,
            'halaman' => $this->halaman,
            'main' => 'dashboard/index',
            'data' => $datacount
        ];
        return view('admin/dashboard', $data);
    }
}
