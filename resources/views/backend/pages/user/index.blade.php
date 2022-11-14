@extends('backend.masterTemplate.masterBackend')
@section('maincontent')
    <div class="br-pagetitle">
        <i class="icon ion-ios-home-outline"></i>
        <div>
            <h4>Dashboard</h4>
            <p class="mg-b-0">Hey! Hello There Welcome To Our MultiVenDor Ecommerce Dashboard !</p>
        </div>
    </div>

    <div class="br-pagebody">
        <div class="card">
            <div class="card-header">
                <h4>All User <a class="btn btn-info btn-sm" href="" style="float: right;" data-toggle="modal"
                        data-target="#exampleModal"> <i class="icon ion-plus-round"></i> Add User</a></h4>
            </div>
            <div class="card-body">
                <div class="table-wrapper">
                    <table id="datatable1" class="table display responsive nowrap">
                        <thead>
                            <tr>
                                <th class="wd-10p">Image</th>
                                <th class="wd-20p">Name</th>
                                <th class="wd-20p">Email</th>
                                <th class="wd-20p">Phone</th>
                                <th class="wd-10p">Role</th>
                                <th class="wd-20p">Manage</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                                <tr>
                                    <td class="wd-10p">Image</td>
                                    <td>{{ $user->name }}</td>
                                    <td>{{ $user->email }}</td>
                                    <td>{{ $user->phone }}</td>
                                    <td>{{ $user->role_id }}</td>
                                    <td>
                                        <div class="dropdown">
                                            <a href="" class="tx-gray-800 d-inline-block" data-toggle="dropdown">
                                                <div
                                                    class="ht-45 pd-x-20 bd d-flex align-items-center justify-content-center">
                                                    <span class="mg-r-10 tx-13 tx-medium">Manage</span>
                                                    <i class="fa fa-angle-down mg-l-10"></i>
                                                </div>
                                            </a>
                                            <div class="dropdown-menu pd-10 wd-200">
                                                <nav class="nav nav-style-1 flex-column">
                                                    <a href="" class="nav-link"><i class="icon ion-ios-eye"></i>
                                                        Show</a>
                                                    <a href="" class="nav-link"><i class="icon ion-edit"></i>
                                                        Edit</a>
                                                    <a href="" class="nav-link"><i class="icon ion-ios-trash"></i>
                                                        Delete</a>
                                                </nav>
                                            </div><!-- dropdown-menu -->
                                        </div><!-- dropdown -->
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div><!-- table-wrapper -->
            </div>
        </div>
    </div><!-- br-pagebody -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content bd-0">
                <div class="modal-header pd-y-20 pd-x-25">
                    {{-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> --}}
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">User Add</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body pd-25">
                    <div class="form-layout form-layout-1">
                        <div class="row mg-b-25">
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="form-control-label">Firstname: <span class="tx-danger">*</span></label>
                                    <input class="form-control" type="text" name="firstname" value="John Paul"
                                        placeholder="Enter firstname">
                                </div>
                            </div><!-- col-4 -->
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="form-control-label">Lastname: <span class="tx-danger">*</span></label>
                                    <input class="form-control" type="text" name="lastname" value="McDoe"
                                        placeholder="Enter lastname">
                                </div>
                            </div><!-- col-4 -->
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label class="form-control-label">Email address: <span
                                            class="tx-danger">*</span></label>
                                    <input class="form-control" type="text" name="email"
                                        value="johnpaul@yourdomain.com" placeholder="Enter email address">
                                </div>
                            </div><!-- col-4 -->
                            <div class="col-lg-8">
                                <div class="form-group mg-b-10-force">
                                    <label class="form-control-label">Mail Address: <span class="tx-danger">*</span></label>
                                    <input class="form-control" type="text" name="address"
                                        value="Market St. San Francisco" placeholder="Enter address">
                                </div>
                            </div><!-- col-8 -->
                            <div class="col-lg-4">
                                <div class="form-group mg-b-10-force">
                                    <label class="form-control-label">Country: <span class="tx-danger">*</span></label>
                                    <select class="form-control select2" data-placeholder="Choose country">
                                        <option label="Choose country"></option>
                                        <option value="USA">United States of America</option>
                                        <option value="UK">United Kingdom</option>
                                        <option value="China">China</option>
                                        <option value="Japan">Japan</option>
                                    </select>
                                </div>
                            </div><!-- col-4 -->
                        </div><!-- row -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info">Save changes</button>
                    <button type="submit"
                        class="btn btn-secondary tx-mont tx-medium tx-11 tx-uppercase pd-y-12 pd-x-25 tx-spacing-1"
                        data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function() {
            'use strict';

            $('#datatable1').DataTable({
                responsive: true,
                language: {
                    searchPlaceholder: 'Search...',
                    sSearch: '',
                    lengthMenu: '_MENU_ items/page',
                }
            });

            // Select2
            $('.dataTables_length select').select2({
                minimumResultsForSearch: Infinity
            });

        });
    </script>
@endsection
