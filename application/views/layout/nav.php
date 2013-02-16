<div class="span3">
    <div class="well">
    	<ul class="nav nav-list">
		    <li class="nav-header">Navigation</li>
		    <li>
				<a href="<?php echo base_url(); ?>">Home</a>
			</li>

			<?php
			# Log In/Out
			if ($this->session->userdata('id')) echo '<li><a href="' . base_url() . 'index.php/user/logout' . '">Log Out</a></li>';
			else echo '<li><a href="' . base_url() . 'index.php/user/login' . '">Log In</a></li>';
			?>

			<?php 
			# Change password
			if ($this->session->userdata('id')) echo '<li><a href="' . base_url() . 'index.php/user/changepassword' . '">Change your password</a></li>';
			?>

			<?php
			# Display attached courses
			if ($this->session->userdata('courses'))
			{
				echo '<li class="nav-header">Courses</li>';
				foreach ($this->session->userdata('courses') as $v)
		        	echo '<li><a href="'. base_url() .'index.php/course/id/'.strtolower($v).'">'.strtoupper($v).'</a></li>';
			}
			?>

			<?php 
			
			# Admin panel
			if ($this->session->userdata('level') > 9000)
			{
				echo '<li class="nav-header"><span class="label label-important">Administration</span></li>';
				$this->load->view('layout/admin_nav');
			}
			?>

		</ul>
    </div>
</div>