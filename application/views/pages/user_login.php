<div class="row-fluid">
  	<?php $this->load->view('layout/nav'); ?>
    <div class="span9 _content">
    	<div class="well">
			<h2>Log In</h2>
			<div class="_errors">
				<?php echo validation_errors(); ?>
			</div>
    		<?php
    		echo form_open('user/login', ['id' => 'form_login', 'class' => 'form-inline']); # id = form_login used for the jQuery form validation
			echo '<p></p>';
			echo form_input(['name' => 'username', 'value' => set_value('username'), 'placeholder' => 'Email']);
			echo '<p></p>';
			echo form_password(['name' => 'password', 'placeholder' => 'Password']);
			echo '<p></p>';
			echo form_submit(['name' => 'submit', 'value' => 'Log In', 'class' => 'btn btn-large btn-primary']);
			echo form_close();
    		?>
    	</div>
    </div>
</div>
