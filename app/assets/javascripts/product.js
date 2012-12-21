$('#form_dialog').live('click', function(event) {
	event.preventDefault();
		// alert('hi');
	      // $(  ).dialog({
	var x;
	$('#dialog_form').dialog({
            // autoOpen: false,
            // height: screen.height *30 /100,
            title: "Enter Your Phone Number",
            // width: screen.width *30 /100,
            modal: true,
            resizable: false,
            position: ["center", "center"],
            buttons: {
                Submit: function() {
                	 $('.loading').show();
                	 var info = $('#info').val();
                	 var parent_product_id1 = $('#parent_product_id').val();
                	 var product_id1 = $('#product_id').val();

                	 $.post("/customer_lead", { info: info,product_id : product_id1, parent_product_id: parent_product_id1 },
					    function(data){
	                	 	$('.loading').hide();
	                	 	$('#info').val('');
                	 		$('#dialog_form').dialog( "close" );
					    }, "json");


                },
                Cancel: function() {
                	$('.loading').hide();
                	$('#info').val('');
                	 $( this ).dialog( "close" );
                }                
            }
        });

	// var name=prompt("Please enter Mobile Number",'');
	return false;
});