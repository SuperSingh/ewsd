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
}

?>