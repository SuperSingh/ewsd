<div class="row-fluid">
  	<?php $this->load->view('layout/nav'); ?>
    <div class="span9 _content">
    	<div class="well">
			<h2>Log In</h2>
    		<?php
    		echo form_open();
			echo '<p>Username:</p>';
			echo form_input('username', set_value('username'));
			echo '<p>Password:</p>';
			echo form_password('password');
			echo '<p></p>';
			echo form_submit(['name' => 'submit', 'value' => 'Log In', 'class' => 'btn btn-large btn-primary']);
			echo form_close();
			
			if (isset ($debug))
			{
				foreach ($debug as $k => $v) {
					echo '<p>'.$k.': '.$v.'</p>';
				}
			}
    		?>
    	</div>
    </div>
</div>