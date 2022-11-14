@extends('backend.masterTemplate.masterBackend')
@section('maincontent')
 <div class="br-pagetitle">
 <i class="menu-item-icon icon ion-ios-color-filter-outline tx-24"></i>
        <div class="ml-5">
            <h4>MANAGE PRODUCT</h4>
            <p class="mg-b-0">Hey! There Is PRODUCT Page! Add This Product !</p>
            </div>
            <div class="ml-auto">
                <button class="btn btn-sm btn-primary btn-block mg-b-10"><a href="{{route('admin.dashboard')}}" class="text-white">Dashboad</a></button>
                <button class="btn btn-sm btn-primary active btn-block mg-b-10"><a href="{{route('add.products')}}" class="text-white">Add Product</a></button>
            </div>
      </div>

<div class="br-pagebody">
        <div class="row row-sm mg-t-20">
          <div class="col-lg-12">
          <table class="table table-bordered table-colored table-teal">
            <thead>
              <tr>
                <th class="wd-3p">#sl</th>
                <th class="wd-15p">Name</th>
                <th class="wd-15p">Vendor</th>
                <th class="wd-5p">Price</th>
                <th class="wd-15p">Discount Price</th>
                <th class="wd-5p">Quantity</th>
                <th class="wd-5p">Category</th>
                <th class="wd-15p">Sub Category</th>
                <th class="wd-15p">Picture</th>
                <th class="wd-6p">Status</th>
                <th class="wd-15p">Action</th>
              </tr>
            </thead>
            <tbody>
                @foreach($products as $product)
              <tr>
                <th scope="row">{{$serial++}}</th>
                <td>{{$product->product_name}}</td>
                <td>{{$product->username->name}}</td>
                <td>{{$product->product_price}}</td>
                <td>{{$product->discount_price}}</td>
                <td>{{$product->quantity}}</td>
                <td>
                  @foreach($category as $cat)
                    @if($product->cat_id == $cat->id)
                        {{$product->category->category_name}}
                    @endif
                  @endforeach
                </td>
                 <td>
                  @foreach($subCategory as $subcate)
                      @if($product->subcat_id == $subcate->id)
                        {{$product->subcategory->sub_name}}
                      @endif
                  @endforeach
                </td>
                <td><img height="60" width="80" id="showImage" src="{{asset('backend/productImage/'.$product->thumbnails)}}" class="img-fluid" alt="PRODUCT IMAGE"></td>
                <td>
                    @if($product->status == 1)
                     <span class="badge badge-info">Active</span>
                     @else
                     <span class="badge badge-info">Inactive</span>
                     @endif
                   </td>
                <td>
                  <a href="{{route('product.edit',$product->id)}}" class="btn btn-sm btn-warning"><i class="fa fa-edit"></i></a>
                  <a href="{{route('product.delete',$product->id)}}" id="delete" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
          </div><!-- col-8 -->
        </div><!-- row -->
        <div class="ht-80 bd d-flex align-items-center justify-content-end">
          <!-- PAGINATE -->
           {{$products->links('vendor.pagination.productPagination')}}
        </div>
      </div><!-- br-pagebody -->
@endsection