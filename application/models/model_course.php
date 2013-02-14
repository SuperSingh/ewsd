<?php
/**
* Docstring for model_course.php
*/
class Model_course extends CI_Model
{
	public function getCourseData($courseid)
	{
		$q = $this->db->limit(1)->where('course_id', $courseid)->get('course');
		if ($q->num_rows() > 0) ? return $q->row() : NULL;
	}
}

?>