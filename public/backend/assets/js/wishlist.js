$(document).ready(function () {
    // START FOR SHOW
        forshowwishlistproduct();
      function forshowwishlistproduct(){
          $.ajax({
              url:'forshowwishlist',
              dataType:'JSON',
              type:'GET',
              success:function(response){
                  jQuery('.wishlist_counter').html('');
                  var totalqty = 0;
                      $.each(response.allitems,function(key,item){
                          totalqty++; 
                      });
                      jQuery('.wishlist_counter').text(totalqty);
                  }
              });
          }
    // FORSHOW END
        $('.addtowishlist').click(function (e) { 
          e.preventDefault();
          $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
          var pro_iddfd = jQuery(this).closest('.pro_iddhore').find('.pro_id').val();
          // alert(pro_iddfd);
            $.ajax({
              url:'addtowishlist',
              type:'POST',
              dataType:'JSON',
              data:{
                pro_iddfd:pro_iddfd,
              },
              success:function(response){
                if(response.status == 'logged'){
                  forshowwishlistproduct();
                  toastr.warning(response.data);
                }
                else{
                  forshowwishlistproduct();
                  toastr.info(response.data);
                }  
              }
              });
        });
});