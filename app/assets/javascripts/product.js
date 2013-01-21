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

$('.quantity').live('blur', function(event) {
    var count = parseInt($('#count').val());
    if (count == 0){
        var items = $(this).attr('item_ids');
        var quan = parseFloat($(this).val());
        var amount_id = "amount_" + $(this).attr('item_id');
        var sum = parseFloat($('#total').val());
        var old_value = parseFloat($('#'+amount_id).val());
        var price = parseFloat($(this).attr('price'));
        var new_sum = sum + (quan * price) - old_value
        $('#'+amount_id).val(quan * price);
        if (new_sum != sum){
            $('#total').val(new_sum);
        }
        $('#count').val(1);
    }
    else{
        $('#count').val(0);
    }
});

$('#checkout').live('click', function(event) {
    event.preventDefault();
    var hash = $('#pollo_abc').val();
    var pol = JSON.parse(hash);
    alert(pol);
});

