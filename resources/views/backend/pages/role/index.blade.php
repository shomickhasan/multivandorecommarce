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
                <h4>All User
                    <a class="btn btn-info btn-sm" href="" style="float: right;" data-toggle="modal"
                                data-target="#roleAddModal"> <i class="icon ion-plus-round"></i> Add Role</a>
                </h4>
            </div>
            <div class="card-body">
                <div class="table-wrapper">
                    <table id="datatable1" class="table display responsive nowrap">
                        <thead>
                        <tr>
                            <th class="wd-10p">Id</th>
                            <th class="wd-20p">Name</th>
                            <th class="wd-20p">Comments</th>
                            <th class="wd-20p">Manage</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach ($roles as $key => $role)
                            <tr>
                                <td class="wd-10p">{{ $key + 1 }}</td>
                                <td>{{ $role->role_name }}</td>
                                <td>{{ $role->role_comments }}</td>
                                <td class="text-center">
{{--                                    <a class="btn btn-sm btn-success" href=""><i class="icon ion-ios-eye"></i></a>--}}
                                    <a data-toggle="modal"
                                       data-target="#roleEditModal{{ $role->id }}"  class="btn btn-sm btn-info" href=""><i class="icon ion-edit"></i></a>
                                    <a class="btn btn-sm btn-danger" id="delete" href="{{ route('admin.role.destroy',$role->id) }}"><i class="icon ion-ios-trash"></i></a>
                                </td>
                            </tr>
{{--                            Role Edit Modal--}}
                            <div class="modal fade" id="roleEditModal{{ $role->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                    <div class="modal-content bd-0">
                                        <div class="modal-header pd-y-20 pd-x-25">
                                            <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Role Edit</h6>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="{{ route('admin.role.update',$role->id) }}" method="POST">
                                            @method('PUT')
                                            @csrf
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <label class="form-control-label">Role Name: <span class="tx-danger">*</span></label>
                                                            <input class="form-control" type="text" name="role_name" value="{{ $role->role_name }}" placeholder="Enter Role Name">
                                                        </div>
                                                    </div><!-- col-4 -->
                                                    <div class="col-lg-12">
                                                        <div class="form-group">
                                                            <label class="form-control-label">Comments:</label>
                                                            <textarea class="form-control" name="role_comments" placeholder="Role Comments" >{{ $role->role_comments }}</textarea>
                                                        </div>
                                                    </div><!-- col-4 -->
                                                </div><!-- row -->
                                            </div>
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-info">Update</button>
                                                <button type="button"
                                                        class="btn btn-secondary tx-mont tx-medium tx-11 tx-uppercase pd-y-12 pd-x-25 tx-spacing-1"
                                                        data-dismiss="modal">Close</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </tbody>
                    </table>
                </div><!-- table-wrapper -->
            </div>
        </div>
    </div><!-- br-pagebody -->

    <!-- Modal -->
    <div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content bd-0">
                <div class="modal-header pd-y-20 pd-x-25">
                    <h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">Role Add</h6>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('admin.role.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label">Role Name: <span class="tx-danger">*</span></label>
                                    <input class="form-control" type="text" name="role_name" value="{{ old('role_name') }}" placeholder="Enter Role Name">
                                </div>
                            </div><!-- col-4 -->
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label">Comments:</label>
                                    <textarea class="form-control" name="role_comments" placeholder="Role Comments" ></textarea>
                                </div>
                            </div><!-- col-4 -->
                        </div><!-- row -->
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info">Save</button>
                        <button type="button"
                                class="btn btn-secondary tx-mont tx-medium tx-11 tx-uppercase pd-y-12 pd-x-25 tx-spacing-1"
                                data-dismiss="modal">Close</button>
                    </div>
                </form>
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
