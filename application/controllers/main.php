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
}
?>