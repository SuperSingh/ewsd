<?php
/**
* Docstring for model_course.php
*/
class Model_course extends CI_Model
{
	public function newCourse()
	{
		# code...
	}
	
	public function getCourse($course_id)
	{
		$q = $this->db->limit(1)->where('course_id', $course_id)->get('course');
		if ($q->num_rows() > 0)
		{
			return $q->row();
		} else {
			return NULL;
		}
	}
	
	public function updateCourse()
	{
		# code...
	}
	
	public function deleteCourse($course_id)
	{
		# code...
	}
}

?>