<!-- fraimwork - jquery include -->
<script src="{{ asset('frontend') }}/js/jquery.min.js"></script>
<script src="{{ asset('frontend') }}/js/popper.min.js"></script>
<script src="{{ asset('frontend') }}/js/bootstrap.min.js"></script>

<!-- carousel - jquery plugins collection -->
<script src="{{ asset('frontend') }}/js/jquery-plugins-collection.js"></script>

<!-- google map  -->
{{-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDk2HrmqE4sWSei0XdKGbOMOHN3Mm2Bf-M&ver=2.1.6"></script>
<script src="{{ asset('frontend') }}/js/gmaps.min.js"></script> --}}

<!-- toster alert-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>


<!-- custom - main-js -->
<script src="{{ asset('frontend') }}/js/main.js"></script>
<!-- WISHLISTS JS-->
<script src="{{ asset('backend/assets/js/wishlist.js')}}"></script>

@stack('website-custom-script')
<!-- custom - newslatter-js -->
<script src="{{ asset('frontend') }}/js/app.newsletter.js"></script>
<script src="{{ asset('frontend') }}/js/custom.js"></script>

<script>
//toster alert script
    @if(Session::has('message'))
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
            toastr.success("{{ session('message') }}");
    @endif

    @if(Session::has('error'))
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
            toastr.error("{{ session('error') }}");
    @endif

    @if(Session::has('info'))
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
            toastr.info("{{ session('info') }}");
    @endif
  
    @if(Session::has('warning'))
    toastr.options =
    {
        "closeButton" : true,
        "progressBar" : true
    }
            toastr.warning("{{ session('warning') }}");
    @endif
  </script>

