<!DOCTYPE html>
<html lang="en">

<head>
    @php
        $setting = App\Models\Backend\Setting::first();
    @endphp
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Sing Up</title>

    <!-- vendor css -->
    <link
        href="{{ asset('backend/assets') }}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="{{ asset('backend/assets') }}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="{{ asset('backend/assets') }}/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/css/bracket.css">
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/css/custom.css">
</head>

<body>

    <div class="d-flex align-items-center justify-content-center bg-br-primary ht-100v">

        <div class="login-wrapper wd-300 wd-xs-400 pd-25 pd-xs-40 bg-black-6 rounded shadow-base" style="width:480px;">
            <div class="signin-logo tx-center tx-28 tx-bold tx-white"><span class="tx-normal">[</span> {{ $setting->company_name }}
                     <span class="tx-normal">]</span></div>
            <div class="tx-center mg-b-40">Create Your Account !</div>
            <form action="{{ route('register') }}" method="POST">
                @csrf
                <div class="form-group">
                    <input name="name" type="text" value="{{ old('name') }}"
                        class="form-control @error('name') is-invalid @enderror" placeholder="Enter Your Name">
                    @if ($errors->has('name'))
                    <div class="error">{{ $errors->first('name') }}</div>
                    @endif
                </div><!-- form-group -->
                <div class="form-group">
                    <input name="email" type="email" value="{{ old('email') }}"
                        class="form-control @error('email') is-invalid @enderror" placeholder="Enter Your Email">
                    @if ($errors->has('email'))
                    <div class="error">{{ $errors->first('email') }}</div>
                    @endif
                </div>
                <!-- form-group -->
                {{-- Row --}}
                <div class="row row-xs">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <input name="phone" type="text" value="{{ old('phone') }}"
                                class="form-control @error('phone') is-invalid @enderror"
                                placeholder="Enter Your Phone">
                            @if ($errors->has('phone'))
                            <div class="error">{{ $errors->first('phone') }}</div>
                            @endif
                        </div><!-- form-group -->
                    </div><!-- col-4 -->
                    <div class="col-sm-6 mg-t-20 mg-sm-t-0">
                        <div class="form-group">
                            <input name="nid" type="text" value="{{ old('nid') }}"
                                class="form-control @error('nid') is-invalid @enderror"
                                placeholder="Enter Your National Id">
                            @if ($errors->has('nid'))
                            <div class="error">{{ $errors->first('nid') }}</div>
                            @endif
                        </div><!-- form-group -->
                    </div><!-- col-4 -->
                </div>
                {{-- Row End --}}
                <div class="form-group">
                    <select id="role_id" name="role_id"
                        class="form-control select2 @error('role_id') is-invalid @enderror"
                        data-placeholder="User Type">
                        <option value="">Select User</option>
                        <option value="user">Seller</option>
                        <option value="vendor">Vendor</option>
                    </select>
                    @if ($errors->has('role_id'))
                    <div class="error">{{ $errors->first('role_id') }}</div>
                    @endif
                </div>
                <div class="hidden" id="paymentInfo">
                    {{-- Row --}}
                    <div class="row row-xs">
                        <div class="col-sm-4">
                            <div class="form-group">
                                <input name="bkash" value="{{ old('bkash') }}" type="text" class="form-control"
                                    placeholder="Bkash">
                            </div>
                            <!-- form-group -->
                        </div><!-- col-4 -->
                        <div class="col-sm-4 mg-t-20 mg-sm-t-0">
                            <div class="form-group">
                                <input name="rocket" type="text" value="{{ old('rocket') }}" class="form-control"
                                    placeholder="Rocket">
                            </div>
                            <!-- form-group -->
                        </div><!-- col-4 -->
                        <div class="col-sm-4 mg-t-20 mg-sm-t-0">
                            <div class="form-group">
                                <input name="nagad" type="text" value="{{ old('nagad') }}" class="form-control"
                                    placeholder="Nagad">
                            </div>
                            <!-- form-group -->
                        </div><!-- col-4 -->
                    </div>
                    {{-- Row End --}}
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control @error('password') is-invalid @enderror"
                        placeholder="Enter Your Password">
                    @if ($errors->has('password'))
                    <div class="error">{{ $errors->first('password') }}</div> @endif
                </div><!-- form-group -->
                <div class="form-group">
    <input name="password_confirmation" id="password_confirmation" type="password" class="form-control"
        placeholder="Enter Your Confirm Password">
    </div><!-- form-group -->

    <button type="submit" class="btn btn-info btn-block">Sign Up</button>
    </form>
    </div><!-- login-wrapper -->
    </div><!-- d-flex -->

    <script src="{{ asset('backend/assets') }}/lib/jquery/jquery.min.js"></script>
    <script src="{{ asset('backend/assets') }}/lib/jquery-ui/ui/widgets/datepicker.js"></script>
    <script src="{{ asset('backend/assets') }}/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('backend/assets') }}/lib/select2/js/select2.min.js"></script>
    <script src="{{ asset('backend/assets') }}/js/custom.js"></script>
    <script>
        $(function() {
            'use strict';

            $('.select2').select2({
                minimumResultsForSearch: Infinity
            });
        });
    </script>

    </body>

</html>
