<div class="row-fluid">
  	<?php $this->load->view('layout/nav'); ?>
    <div class="span9 _content">
    	<div class="well">
			<h2>Log In</h2>
			<div class="_errors">
				<?php echo validation_errors(); ?>
			</div>
    		<?php
    		echo form_open('user/login', ['id' => 'form_login']); # id = form_login used for the jQuery form validation
			echo '<p>Username:</p>';
			echo form_input('username', set_value('username'));
			echo '<p>Password:</p>';
			echo form_password('password');
			echo '<p></p>';
			echo form_submit(['name' => 'submit', 'value' => 'Log In', 'class' => 'btn btn-large btn-primary']);
			echo form_close();
    		?>
    	</div>
    </div>
</div>