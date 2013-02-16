<div class="row-fluid">
    <?php $this->load->view('layout/nav') ?>
    <div class="span9 _content">
    	<div class="_errors">
            <?php echo validation_errors();
            if (isset ($errrors))
            {
            	echo '<ul class="_errors">';
            	foreach ($errors as $v) {
            		echo '<li>'.$v.'</li>';
            	}
            	echo '</ul>';
            }
            ?>
        </div>
        <h2>Change your password</h2>
        <?php
        echo form_open('user/changepassword', ['id' => 'form_user_changepassword']);
        echo '<p>Current Password:</p>';
	    echo form_password('currpass');
	    echo '<p>New Password:</p>';
	    echo form_password('newpassword');
	    echo '<p>New Password Conformation:</p>';
	    echo form_password('newpassconf');
	    echo '<p></p>';
	    echo form_submit(['name' => 'submit', 'value' => 'Change Password', 'class' => 'btn btn-large btn-primary']);
        echo form_close();
        if (isset ($success))
        {
            if ($success)
                echo '<span class="label label-success">Your password was changed successfully!</span>';
            else
                echo '<span class="label label-important">Your Username or Password was incorrect, please try again.</span>';
        }
        ?>

    </div>
</div>