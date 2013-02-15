<?php
/**
* Docstring for course.php
*/
class Course extends CI_Controller
{
	public function id($course_id)
	{
		$data['pagetitle'] = strtoupper($course_id);
		$data['pagecontent'] = 'course_id';
		
		$this->load->model('model_course');
		
		$data['coursedata'] = $this->model_course->getCourse($course_id);
		
		# TODO: Replace this conditional with a check to see if the user is regestered on the $course_id
		# Could, possibly do it via the model?
		if (TRUE)
		{
			if ($data['coursedata'] != NULL) # Course exists
			{
				# Do Something
			} else {
				$data['errors']['nullCourseId'] = 'The requested course code "' . strtoupper($course_id) . '" does not exist.';
			}
		}
		
		$this->load->view('layout/master', $data);
	}
}

?>