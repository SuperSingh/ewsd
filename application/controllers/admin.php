<?php
/**
* Docstring for Admin.php
*/
class Admin extends CI_Controller
{
	public function index()
	{
		$data['pagetitle'] = 'Admin';
		$data['pagecontent'] = 'admin_index';
		$this->load->view('layout/master', $data);
	}

	public function new_user()
	{
		$data['pagetitle'] = 'Admin - Create a new user';
		$data['pagecontent'] = 'admin_new_user';

		# Set validation rules here e.g.:
		# TODO: Check this is correct (DB ERRORS?)
		$this->form_validation->set_rules('username', 'Username', 'required|trim|max_length=32|is_unique[user.user_name]');
		$this->form_validation->set_rules('password', 'Password', 'required');
		$this->form_validation->set_rules('passconf', 'Password Conformation', 'required');

		if ($this->form_validation->run()) # Validation complete, the form was alright!
		{
			# Page submitted, do something
			$data['debug']['username'] = $this->input->post('username');
			$data['debug']['password'] = $this->input->post('password');
			$data['debug']['passconf'] = $this->input->post('passconf');
		}

		$this->load->view('layout/master', $data);
	}
}
?>
