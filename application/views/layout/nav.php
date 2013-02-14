<div class="span3">
    <div class="well">
    	<ul class="nav nav-list">
		    <li class="nav-header">Navigation</li>
		    <li>
				<a href="<?php echo base_url(); ?>">Home</a>
			</li>
			<?php
			if ($this->session->userdata('id')) echo '<li><a href="' . base_url() . 'index.php/main/logout' . '">Log Out</a></li>';
			else echo '<li><a href="' . base_url() . 'index.php/main/login' . '">Log In</a></li>';
			?>
			<?php
			if ($this->session->userdata('courses'))
			{
				echo '<li class="nav-header">Courses</li>';
				foreach ($this->session->userdata('courses') as $v)
		        	echo '<li><a href="'. base_url() .'index.php/course/id/'.strtolower($v).'">'.strtoupper($v).'</a></li>';
			}
			?>
		</ul>
    </div>
</div>