<?php
/**
* Docstring for model_user.php
*/
class Model_user extends CI_Model
{
	public function login($username, $password)
	{
		$q = $this->db->limit(1)->where('user_name', $username)->where('user_pass', $password)->get('user');
		if ($q->num_rows() > 0) return $q->row();
		else return NULL;
	}
}

?>