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
	
	public function updateUser($user_id, $data) # To be used for admin perposes? Might need to refactor to model_admin.php
	{
		# Construct a packet of key/value pairs that need to be updated
		return $this->db->where('user_id', $user_id)->update('user', $data); # Return's TRUE / FALSE
	}

	public function updatePassword($user_id, $user_pass, $data)
	{
		# Construct a packet of key/value pairs that need to be updated
		$q = $this->db->where('user_id', $user_id)->where('user_pass', $user_pass)->get('user');
		if ($q->num_rows > 0)
		{
			$this->db->where('user_id', $user_id)->update('user', $data);
			return TRUE; # User/Pass matched and data has been modified, return true
		} else {
			return FALSE; # Failed match, user / pass prob doesn't exist
		}
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