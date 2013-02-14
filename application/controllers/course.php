<?php
/**
* Docstring for course.php
*/
class Course extends CI_Controller
{
	public function id($courseid)
	{
		# $this->load->model('model_course');
		$data['pagetitle'] = strtoupper($courseid);
		$data['pagecontent'] = 'course_id';
		$this->load->view('layout/master', $data);
	}
}

?>