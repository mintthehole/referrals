$('#form_dialog').live('click', function(event) {
	event.preventDefault();
		// alert('hi');
	      // $(  ).dialog({
	var x;

	var name=prompt("Please enter Mobile Number",'');

	if (name!=null)
	{
	x="Hello " + name + "! How are you today?";
	document.getElementById("demo").innerHTML=x;
	}
	return false;
});