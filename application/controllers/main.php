<?php
/**
* Docstring for Main.php
*/
class Main extends CI_Controller
{
	public function index()
	{
        $data['pagetitle'] = 'Hello World!';
        $data['pagecontent'] = 'main_index';
		$this->load->view('layout/master', $data);
	}
	
	public function login()
	{
		$data['pagetitle'] = 'Log In';
		$data['pagecontent'] = 'main_login';
		
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
					'prefix' => $r->user_prefix,
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
		redirect('/');
	}
}
?>