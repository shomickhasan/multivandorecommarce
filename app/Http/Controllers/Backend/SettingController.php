<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Backend\Setting;
use Image;
use File;

class SettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $setting= Setting::first();
        return view('backend.pages.setting.setting', compact('setting'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $setting= Setting::first();
        $setting-> company_name =$request->company_name;
        $setting-> company_phone =$request-> company_phone;
        if($request->pic){
            if(File::exists('backend/logo/'.$setting->pic)){
                File::delete('backend/logo/'.$setting->pic);
                $image=$request->file('pic');
                $imgCustomName=rand().'.'.$image->getClientOriginalExtension();
                $location=public_path('backend/logo/'.$imgCustomName);
                Image::make($image)->save($location);
                $setting->pic=$imgCustomName;
            }
        }
        $setting-> youtube_link=$request->youtube_link;
        $setting-> instagram_link=$request->instagram_link;
        $setting-> twitter_link=$request->twitter_link;
        $setting-> facebook_link=$request->facebook_link;
        $setting-> linkedin_link=$request->linkedin_link;
        $setting->update();
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
