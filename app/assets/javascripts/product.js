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


$('#email_me').live('click', function(event) {
    event.preventDefault();
    var jsonObj = [];
    var hash = $('#pollo_abc').val();
    var pol = JSON.parse(hash);
    var i =0;
    var product_id = $(this).attr('product_id');
    for (i= 0;i<pol.length;i++)
    {
        jsonObj.push({item_id: pol[i], quantity: $("#quantity_"+pol[i]).val() });
    }
    $('#dialog_form').dialog({
            // autoOpen: false,
            // height: screen.height *30 /100,
            title: "Enter Your Email Address",
            // width: screen.width *30 /100,
            modal: true,
            resizable: false,
            position: ["center", "center"],
            buttons: {
                Submit: function() {
                     
                     var info = $('#info').val();
                      if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(info))  
                      {  
                        $('.loading').show();
                         $.ajax({
                            url: '/email_me?product_id='+product_id+'&email='+info,
                            type: 'POST',
                            dataType: 'html',
                            data:JSON.stringify(jsonObj),
                            contentType: 'application/json; charset=utf-8',
                            success: function (data) {
                                $('.loading').hide();
                                $('#info').val('');
                                $('#dialog_form').dialog( "close" );
                            }
                        });
                    }
                    else{
                        $('#info').val(info+' - Email id is not valid ');
                    }

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

$('#email_me').live('submit', function(event) {
    event.preventDefault();
    $.post("/call_me_report", $(this).serialize(),
                        function(data){
                            $('#call_me_result').html(data);
                        }, "html");
});


$('.quantity').live('keyup', function(event) {
        var items = $(this).attr('item_ids');
        var quan = parseFloat($(this).val());
        if (isNaN(quan)){

        }
        else{
            var amount_id = "amount_" + $(this).attr('item_id');
            var tax = parseFloat($(this).attr('tax'));
            var sum = parseFloat($('#sum').val());
            var old_value = parseFloat($('#'+amount_id).val());
            var price = parseFloat($(this).attr('price'));
            var amt = quan * price
            var new_sum = sum + amt - old_value
            var tax_amt = new_sum * tax/100;
            $('#tax').val(tax_amt);
            $('#sum').val(new_sum);
            $('#'+amount_id).val(quan * price);
            $('#total').val(new_sum+tax_amt);
        }

});

$('.quantity').live('blur', function(event) {
        var items = $(this).attr('item_ids');
        var quan = parseFloat($(this).val());
        if (isNaN(quan)){
            $(this).val(0);
            quan = 0;
            var amount_id = "amount_" + $(this).attr('item_id');
            var tax = parseFloat($(this).attr('tax'));
            var sum = parseFloat($('#sum').val());
            var old_value = parseFloat($('#'+amount_id).val());
            var price = parseFloat($(this).attr('price'));
            var amt = quan * price
            var new_sum = sum + amt - old_value
            var tax_amt = new_sum * tax/100;
            $('#tax').val(tax_amt);
            $('#sum').val(new_sum);
            $('#'+amount_id).val(quan * price);
            $('#total').val(new_sum+tax_amt);  
        }
            
    });    

$('.quantity').live('focus', function(event) {
    // alert('hi');
    $(this).val('');
});

$('#checkout').live('click', function(event) {
    event.preventDefault();
    $(this).attr("disabled","disabled");
    var jsonObj = [];
    var hash = $('#pollo_abc').val();
    var pol = JSON.parse(hash);
    var i =0;
    var product_id = $(this).attr('product_id');
    for (i= 0;i<pol.length;i++)
    {
        jsonObj.push({item_id: pol[i], quantity: $("#quantity_"+pol[i]).val() });
    }
    $.ajax({
        url: '/item_checkout?product_id='+product_id,
        type: 'POST',
        dataType: 'html',
        data:JSON.stringify(jsonObj),
        contentType: 'application/json; charset=utf-8',
        success: function (data) {
             $('.menu_area').html(data);
        }
    });
    
});

