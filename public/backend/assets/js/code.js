$(function(){
    $(document).on('click','#delete',function(e){
        e.preventDefault();
        var link = $(this).attr("href");

                  Swal.fire({
                    title: 'HEY! You Sure Deleted This?',
                    text: "Delete This Product?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                  }).then((result) => {
                    if (result.isConfirmed) {
                      window.location.href = link
                      Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                      )
                    }
                  });    
    });
  });
jQuery(document).ready(function(){
 jQuery(document).on('change','#cat_id',function(){
   var cat_id = jQuery(this).val();
   $.ajax({
      url:'searchcategory',
      dataType:'JSON',
      type:'GET',
      data:{
        'cat_id':cat_id
      },
      success:function(data){
          var html = '<option value="">Select Subcategory </option>';
          $.each(data.subcategorygggg,function(key,subcate){
            html += '<option value="'+subcate.id+'">'+subcate.sub_name+'</option>';
          });
          jQuery('#subcat_id').html(html);
      }
   });
});
});