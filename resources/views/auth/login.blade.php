<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Meta -->
    <meta name="description" content="Premium Quality and Responsive UI for Dashboard.">
    <meta name="author" content="ThemePixels">

    <title>Sing In</title>

    <!-- vendor css -->
    <link
        href="{{ asset('backend/assets') }}/lib/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="{{ asset('backend/assets') }}/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="{{ asset('backend/assets') }}/lib/select2/css/select2.min.css" rel="stylesheet">

    <!-- Bracket CSS -->
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/css/bracket.css">
    <link rel="stylesheet" href="{{ asset('backend/assets') }}/css/custom.css">
    <!--For Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--Styling Social Login -->
    <style>
    .socialLogin{
        margin-top:30px;
    }
    .socialLogin a{
      border-radius: 30px;
      border: 1px solid #ffff;
      padding: 10px;
      width: 0;
      height: 0;
      background-color: #ffff;
    }
    </style>
</head>

<body>

    <div class="d-flex align-items-center justify-content-center bg-br-primary ht-100v">
        <div class="login-wrapper wd-300 wd-xs-350 pd-25 pd-xs-40 rounded bg-black-6">
            <div class="signin-logo tx-center tx-28 tx-bold tx-white"><span class="tx-normal">[</span> bracket <span
                    class="tx-info">plus</span> <span class="tx-normal">]</span></div>
            <div class="tx-white-5 tx-center mg-b-60">Login Your Account!</div>

            <form action="{{ route('login') }}" method="post">
                @csrf
                <div class="form-group">
                    <input name="email" type="email" value="{{ old('email') }}"
                        class="form-control fc-outline-dark @error('email') is-invalid @enderror"
                        placeholder="Enter Your Email">
                    @if ($errors->has('email'))
                    <div class="error">{{ $errors->first('email') }}</div> @endif
                </div><!-- form-group -->
                <div class="form-group">
                    <input name="password" type="password"
                        class="form-control fc-outline-dark @error('password') is-invalid @enderror"
                        placeholder="Enter Your Password">
                    @if ($errors->has('password'))
                    <div class="error">{{ $errors->first('password') }}</div> @endif
                </div><!-- form-group -->
                <a href="{{ route('password.request') }}"
        class="tx-info tx-12 d-block mg-t-10">
    Forgot password?</a>
    <button type="submit" class="btn btn-info btn-block">Sign In</button>
    </form>
    <!-- Social Login -->
    <div class="socialLogin">
        <p>Login with?</p>
        <a href="{{ Route('gotogoogle') }}"><i class="fab fa-google"></i>  Login with Google</a><br>
    </div>
    <div class="socialLogin">
        <a href="{{ Route('gotofacebook') }}"><i class="fab fa-facebook"></i>  Login with Facebook</a><br>
    </div>
    <div class="mg-t-60 tx-center">Not yet a member? <a href="{{ route('register') }}" class="tx-info">Sign
            Up</a></div>
    </div>
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
