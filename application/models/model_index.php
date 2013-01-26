<?php
class Model_index extends CI_Model {

    public function getUsers() {
        return $this->db->get('users');
    }
    
    private function findEmailPrefix($emailPrefix)
    {
        // TODO: Implement this
    }
    
    public function addUser($fname, $oname, $lname, $password)
    {
        // validate parameters before using the model
        // check if oname is nulled
        // generate username based off first letter of fname and lname and then a numerical id
        // generate the email based on user_username + @greenwich.ac.uk
        // insert into DB
        $emailPrefix = strtolower(substr($lname, 0, 1)) + strtolower(substr($fname, 0, 1)); // David Smith would result in sd
        $data = {
            'user_fname' = $user_fname,
            'user_oname' = $user_oname,
            'user_lname' = $user_lname,
            'user_username' = $user_username,
            'user_password' = $user_password,
            'user_email' = $user_email
        }  
        $this->db->insert('users', $data);
    }
}
?>