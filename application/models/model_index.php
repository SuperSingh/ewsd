<?php
class Model_index extends CI_Model {

    public function getUsers() {
        return $this->db->get('users');
    }
    
    public function addUser($fname, $oname, $lname, $password)
    {
        // validate parameters before using the model
        // check if oname is nulled
        // generate username based off first letter of fname and lname and then a numerical id
        // generate the email based on user_username + @greenwich.ac.uk
        // insert into DB
        $data = {
            'user_fname' = $user_fname,
            'user_oname' = $user_oname,
            'user_lname' = $user_lname,
            'user_username' = $user_username,
            'user_password' = $user_password,
            'user_email' = $user_email
        }  
        $this->db->insert($data);
    }
    
}
?>