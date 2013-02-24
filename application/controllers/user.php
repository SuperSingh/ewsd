<?php
/**
* Docstring for user.php
*/
class User extends CI_Controller
{
	public function index()
	{
		redirect(base_url());
	}

	public function changepassword()
	{
		$data['pagetitle'] = 'Change your password';
		$data['pagecontent'] = 'user_changepassword';

		$this->form_validation->set_rules('currpass', 'Current Password', 'required');
		$this->form_validation->set_rules('newpassword', 'New Password', 'required|matches[newpassconf]');
		$this->form_validation->set_rules('newpassconf', 'New Password Conformation', 'required');

		if ($this->form_validation->run())
		{
			$this->load->model('model_user');
			$package = array(
				'user_pass' => hash('sha256', $this->input->post('newpassword'))
			);
			$data['success'] = $this->model_user->updatePassword($this->session->userdata('id'), hash('sha256', $this->input->post('currpass')), $package);
		}

		$this->load->view('layout/master', $data);
	}

	public function login()
	{
		$data['pagetitle'] = 'Log In';
		$data['pagecontent'] = 'user_login';
		
		$this->form_validation->set_rules('username', 'Username', 'required|trim');
		$this->form_validation->set_rules('password', 'Password', 'required|trim');
		
		if ($this->form_validation->run())
		{
			# Validation should only run if all fields match, hence attempt a user login
			$data['debug']['username'] = $this->input->post('username');
			$data['debug']['password'] = hash('sha256', $this->input->post('password'));
			
			$this->load->model('model_user');
			$r = $this->model_user->login($this->input->post('username'), hash('sha256', $this->input->post('password')));
			
			if ($r != NULL)
			{
				$userdata = array(
					'id' => $r->user_id,
					'uname' => $r->user_name,
					'fname' => $r->user_fname,
					'oname' => $r->user_oname,
					'lname' => $r->user_lname,
					'level' => $r->user_permission,
					'courses' => ['COMP1288', 'COMP1640', 'COMP1687', 'COMP1682'],
					'program' => 'Computing with Games Development'
				);
				# Fire up a session
				$this->session->set_userdata($userdata);
				
				# Redirect the user to the home page
				redirect('/');
			} else {
				$data['errors']['nouser'] = 'Your username or password was incorrect, please try again.';
			}
		}
		
		$this->load->view('layout/master', $data);
	}
	
	public function logout()
	{
		// Drop session
		$this->session->sess_destroy();
		redirect(base_url());
	}
}
?>
