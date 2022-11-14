<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return view('backend.pages.user.index', compact('users'));
    }

    public function create()
    {
        return view('backend.pages.user.create');
    }
}
