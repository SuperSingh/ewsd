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
			},/*
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
	$('#form_user_changepassword').validate({
		rules: {
			currpass: {
				required: true
			},
			newpassword: {
				required: true
			},
			newpassconf: {
				required: true,
				equalTo: "input[name='newpassword']"
			}
		}
	});
});