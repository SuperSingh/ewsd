<div class="navbar">
    <div class="navbar-inner">
    <a class="brand" href="<?php echo base_url(); ?>">GreCMS</a>
        <ul class="nav">
            <?php
            if (isset ($courses))
			{
				foreach ($courses as $v) {
                	echo '<li><a href="'. base_url() .'index.php/course/'.strtolower($v).'">'.strtoupper($v).'</a></li>';
                }
			}
            ?>
        </ul>
    </div>
</div>