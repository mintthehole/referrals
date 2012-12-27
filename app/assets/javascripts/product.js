$('#form_dialog').live('click', function(event) {
	event.preventDefault();
  	var parent_product_id1 = $(this).attr('parent_product_id');
	var product_id1 = $(this).attr('product_id');
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
                	 $.post("/customer_lead", { info: info, product_id : product_id1, parent_product_id: parent_product_id1 },
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

$('#rateit5').live('over', function() {
    var old = parseFloat($('#value_rate').val());
    var new_value =  parseFloat($(this).rateit('value'));
    var product_id = $('#value_rate').attr('product_id');
    if (new_value != old)
    {
        $('#value_rate').val(new_value);
        $.post("/rate_product", {product_id: product_id, rating: new_value },
                        function(data){
                        }, "json");        
    }
});

$('#rating').live('submit', function(event) {
    event.preventDefault();
    $.post("/rating_report", $(this).serialize(),
                        function(data){
                            $('#rating_result').html(data);
                        }, "html");
});


$('#call_me').live('submit', function(event) {
    event.preventDefault();
    $.post("/call_me_report", $(this).serialize(),
                        function(data){
                            $('#call_me_result').html(data);
                        }, "html");
});