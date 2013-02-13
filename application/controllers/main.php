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
		$data['fname'] = 'Greg';
		$data['lname'] = 'Dowse';
		$data['courses'] = ['COMP1288', 'COMP1640', 'COMP1687', 'COMP1682'];
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
			
			$data['debug']['username'] = $this->input->post('username');
			$data['debug']['password'] = hash('sha256', $this->input->post('password'));
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