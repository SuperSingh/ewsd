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
		# $this->form_validation->set_rules('username', 'Username', 'required|trim|max_length=32');

		if ($this->form_validation->run())
		{
			# Page submitted
		}

		$this->load->view('layout/master', $data);
	}
}
?>