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
                	 $( this ).dialog( "close" );
                },
                Cancel: function() {
                	 $( this ).dialog( "close" );
                }                
            }
        });

	// var name=prompt("Please enter Mobile Number",'');
	return false;
});