<?php

class Main extends CI_Controller
{    
	function index()
	{
        $this->load->model('model_index');
        $this->model_index->getUsers();
        $data['pagetitle'] = 'Hello World!'; // The data array is initialised and a 'pagetitle' key-value pair is inserted
		$this->load->view('view_index_index', $data);
	}
}

?>