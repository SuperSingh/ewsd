<div class="span3">
    <div class="well">
    	<ul class="nav nav-list">
		    <li class="nav-header">Navigation</li>
		    <li>
				<a href="<?php echo base_url(); ?>">Home</a>
			</li>
			<li>
			    <a href="<?php echo base_url() . 'index.php/main/login'; ?>">Log In</a>
			</li>
			<?php
			if (isset ($courses))
			{
				echo '<li class="nav-header">Courses</li>';
				foreach ($courses as $v) {
		        	echo '<li><a href="'. base_url() .'index.php/course/'.strtolower($v).'">'.strtoupper($v).'</a></li>';
		        }
			}
			?>
		</ul>
    </div>
</div>