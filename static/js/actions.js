// actions.js
$(function() {
    // Run form validation first
	$('#form_login').validate({
		rules: {
			username: {
				required: true
			},
			password: {
				required: true
			}/*,
			passconf: {
				required: true,
				equalTo: "input[name='password']"
			},
			email: {
				required: true,
				email: true
			}*/
		}
	});
});