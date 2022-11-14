<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Backend\Category;
use App\Models\Backend\SubCategory;
use App\Models\Backend\Product;
use App\Models\Backend\ProductGallery;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Carbon\Carbon;
use File;
use Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $subCategory = SubCategory::all();
        $category = Category::all();
        $products = Product::latest()->paginate(4);
        $serial = $products->currentPage() != 1 ? $products->perPage()*($products->currentPage()-1)+1:1;
        return view('backend.pages.product.index',compact('products','serial','subCategory','category'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::all();
        $subcategories = SubCategory::all();
        return view('backend.pages.product.create',compact('categories','subcategories'));
    } //END METHOD
    
    public function searchcategory(Request $request){
        $cat_id = $request->cat_id;
        $subcategory = SubCategory::where('category_id',$cat_id)->get();
        // return Response::json($subcategory);
        return [
            'subcategorygggg'=> $subcategory
        ];
    } //END METHOD

    public function searchcategoryforedit($id){
        $subcategory = SubCategory::where('category_id',$id)->get();
        // return Response::json($subcategory);
        return [
            'subcategoryggggggd'=> $subcategory
        ];
    } //END METHOD

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_code'=>'required|unique:products',
            'product_name'=>'required',
            'product_price' => 'required',
            'discount_price' => 'required',
            'quantity' => 'required',
            'cat_id'=>'required',
            'subcat_id'=>'required',
            'thumbnails'=>'required|image|mimes:jpg,jpeg,png,giff,gif|max:600',
            'status'=>'required',
            'short_desc'=>'required',
            'long_desc'=>'required',
        ]);
        

        if($request->thumbnails){
            $productImage = $request->File('thumbnails');
            $productName = 'product'.md5(rand(00000,99999).time()).'.'. $productImage->getClientOriginalExtension();
            $productPath = public_path('backend/productImage/'.$productName);
            Image::make($productImage)->save($productPath);
            
            $product = new Product();
            $product->vendor_id = Auth::id();
            $product->product_code =  $request->product_code;
            $product->product_name = $request->product_name;
            $product->product_slug = Str::slug($request->product_name);
            $product->product_price = $request->product_price;
            $product->discount_price = $request->discount_price;
            $product->quantity = $request->quantity;
            $product->cat_id = $request->cat_id;
            $product->subcat_id = $request->subcat_id;
            $product->status = $request->status;
            $product->short_desc = $request->short_desc;
            $product->long_desc = $request->long_desc;
            $product->created_by = Auth::user()->id;
            $product->created_at = Carbon::now();
            $product->thumbnails = $productName;
            $product->save();
        }
        
        if ($request->images) {
            $galleryimages = $request->file('images');
            foreach ($galleryimages as $galleryimage) {
                $customName = rand() . '.' . $galleryimage->getClientOriginalExtension();
                $location = public_path('backend/productImage/product_galleries/') . $customName;
                Image::make($galleryimage)->save($location);

                $gallery = new ProductGallery();
                $gallery->product_code = $request->product_code;
                $gallery->images = $customName;
                $gallery->save();
            }
        }
        return redirect()->route('manage.products')->with('message','SUCCESSFULLY PRODUCT IINSERTED');
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
      $data = array();

       $data['product'] = Product::find($id);

       $data['category'] = Category::all();

       $data['subcategory'] = SubCategory::where('id',$data['product']->subcat_id)->first();
       
       if( $data['product'] != null){
        $data['galleryimages'] = ProductGallery::where('product_code',$data['product']->product_code)->get();
       }else{
         return back();
        }
        return view('backend.pages.product.edit',$data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    //   $request->validate([
    //         'vendor_id'=>'required',
    //         'product_code'=>'required',
    //         'product_name'=>'required|max:30|min:6|regex:/^[a-zA-Z-_]+$/u',
    //         'product_price' => 'required|integer|regex:/^[1-90]+$/u',
    //         'discount_price' => 'required|integer|regex:/^[1-90]+$/u',
    //         'quantity' => 'required|integer|regex:/^[1-90]+$/u|min:1',
    //         'cat_id'=>'required',
    //         'subcat_id'=>'required',
    //         'thumbnails'=>'image|mimes:jpg,jpeg,png,giff,gif|max:600',
    //         'status'=>'required',
    //         'short_desc'=>'required',
    //         'long_desc'=>'required',
    //     ],[
    //         'vendor_id.required'=>'VENDOR NEEDED',
    //         'product_code.required'=>'PRODUCT CODE NEEDED',
    //         'product_name.required'=>'PRODUCT NAME NEEDED',
    //         'product_name.regex'=>'MUST USE a-z,A-Z,-,_ etc',
    //         'product_price.required'=> 'PRODUCT PRICE NEEDED',
    //         'product_price.integer'=> 'MUST BE A NUMBER',
    //         'product_price.regex'=> '0 NOT ACCEPT AtLEAST 1',
    //         'discount_price.required' => 'DISCOUNT PRICE NEEDED',
    //         'discount_price.integer'=> 'MUST BE A NUMBER',
    //         'discount_price.regex'=> '0 NOT ACCEPT AtLEAST 1',
    //         'quantity.required'=> 'QUANTITY NEEDED',
    //         'quantity.integer'=> 'MUST BE A NUMBER',
    //         'quantity.regex'=> '0 NOT ACCEPT ATLEAST 1',
    //         'cat_id.required'=>'CATEGORY NEEDED',
    //         'subcat_id.required'=>'SUB CATEGORY NEEDED',
    //         'thumbnails.image'=>'PRODUCT IMAGE MUST IMAGE',
    //         'status.required'=>'STATUS FIELD REQUIRED',
    //         'short_desc.required'=>'SHORT DESCRIPTION NEEDED',
    //         'long_desc.required'=>'LONG DESCRIPTION NEEDED',
    //     ]);
        $product =Product::findOrFail($id);
        $product->vendor_id = Auth::id();
        $product->product_code = $request->product_code;
        $product->product_name = $request->product_name;
        $product->product_slug = Str::slug($request->product_name);
        $product->product_price = $request->product_price;
        $product->discount_price = $request->discount_price;
        $product->quantity = $request->quantity;
        $product->cat_id = $request->cat_id;
        $product->subcat_id = $request->subcat_id;
        $product->status = $request->status;
        $product->short_desc = $request->short_desc;
        $product->long_desc = $request->long_desc;
        $product->updated_by = Auth::user()->id;
        $product->updated_at = Carbon::now();

        if($request->thumbnails){
            if(File::exists('backend/productImage/'. $product->thumbnails)){
                File::delete('backend/productImage/'. $product->thumbnails);}
            $productImage = $request->File('thumbnails');
            $productName = 'product'.md5(rand(00000,99999).time()).'.'. $productImage->getClientOriginalExtension();
            $productPath = public_path('backend/productImage/'.$productName);
            Image::make($productImage)->save($productPath);
            $product->thumbnails = $productName;
        }
        
        if (!empty($request->images)) {
            $galleryimages = $request->file('images');
            foreach ($galleryimages as $galleryimage) {
                $customName = rand() . '.' . $galleryimage->getClientOriginalExtension();
                $location = public_path('backend/productImage/product_galleries/') . $customName;
                Image::make($galleryimage)->save($location);

                $gallery = new ProductGallery();
                $gallery->product_code = $request->product_code;
                $gallery->images = $customName;
                $gallery->save();
            }
        }
        $product->update();
        return redirect()->route('manage.products')->with('info','SUCCESSFULLY PRODUCT UPDATED');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product =Product::findOrFail($id);
        if(File::exists('backend/productImage/'. $product->thumbnails)){
            File::delete('backend/productImage/'. $product->thumbnails);}
            
        $productGalleries = ProductGallery::where('product_code', $product->product_code)->get();
        foreach ($productGalleries as $productGallery) {
            if (File::exists('backend/productImage/product_galleries/' . $productGallery->images)) {
                File::delete('backend/productImage/product_galleries/' . $productGallery->images);
            }

            $productgalleryData = ProductGallery::find($productGallery->id);
            $productgalleryData->delete();
        }
        
        $product->delete();
        return back()->with('warning','SUCCESSFULLY PRODUCT DELETED'); 
    }
    
    public function singleimagedestroy($id){
        $gallery = ProductGallery::find($id);
        File::delete('backend/productImage/product_galleries/' . $gallery->images);
        $gallery->delete();
        return back()->with('success','Gallery Image Deleted'); 
    }
    
    public function dsinglepimageajax($id){
        $gallery = ProductGallery::find($id);
        File::delete('backend/productImage/product_galleries/' . $gallery->images);
        $gallery->delete();
        return response()->json([
            'warning'=>'success'
        ]);
    }
}
