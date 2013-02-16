<div class="row-fluid">
    <?php $this->load->view('layout/nav') ?>
    <div class="span9 _content">
		<?php
		if (isset ($errors))
		{
			echo '<ul class="unstyled _errors">';
			foreach ($errors as $v) {
				echo '<li>'.$v.'</li>';
			}
			echo '</ul>';
		} else {
			echo '<h1>'.$pagetitle.'</h1>';
			echo '<ul>';
			foreach ($coursedata as $k => $v) {
				echo '<li>'.$k.': '.$v.'</li>';
			}
			echo '</ul>';
		}
		?>
    </div>
</div>