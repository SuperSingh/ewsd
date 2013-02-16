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
        <div class="container-fluid">
        	<div class="row-fluid">
                <?php echo form_open('admin/new_user', ['id' => 'form_admin_new_user']); # id = form_login used for the jQuery form validation ?>
        		<div class="span6">
        			<!-- Left hand side content box -->
        			<h2>Add a new user</h2>
                    <?php
                    echo '<p>Username:</p>';
                    echo form_input('username', set_value('username'));
                    echo '<p>Password:</p>';
                    echo form_password('password');
                    echo '<p>Password Conformation:</p>';
                    echo form_password('passconf');
                    echo '<p></p>';
                    echo form_submit(['name' => 'submit', 'value' => 'Register', 'class' => 'btn btn-large btn-primary']);
                    ?>
                </div>
        		<div class="span6">
        			<!-- Right hand side content box -->
                </div>
                <?php echo form_close() ?>
        	</div>
        </div>
    </div>
</div>