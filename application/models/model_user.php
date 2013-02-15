<?php
/**
* Docstring for model_user.php
*/
class Model_user extends CI_Model
{
	public function newUser()
	{
		# code...
	}
	
	public function getUser($user_id)
	{
		$q = $this->db->limit(1)->where('user_id', $user_id)->get('user');
		
		if ($q->num_rows > 0) return $q->row();
		else return NULL;
	}
	
	public function getAllUserData($user_id)
	{
		/*
		This version of getUser should perform joins to request attached 
		courses as well as additional properties related to the requested
		user.
		*/
		# code...
	}
	
	public function updateUser($user_id, $data)
	{
		# Construct a packet of key/value pairs that need to be updated
		$this->db->where('user_id', $user_id)->update('user', $data);
		# code...
	}
	
	public function deleteUser($user_id)
	{
		# code...
	}
	
	public function login($username, $password)
	{
		$this->db->limit(1);
		$this->db->where('user_name', $username)->where('user_pass', $password);
		$q = $this->db->get('user');
		
		if ($q->num_rows() > 0) return $q->row();
		else return NULL;
	}
}

?>