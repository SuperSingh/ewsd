<div class="row-fluid">
    <?php $this->load->view('layout/nav') ?>
    <div class="span9 _content">
		<?php
		if (count ($errors) > 0)
		{
			echo '<ul class="unstyled _errors">';
			foreach ($errors as $v) {
				echo '<li>'.$v.'</li>';
			}
			echo '</ul>';
		} else {
			echo '<h1>'.$pagetitle.'</h1>';
			$this->load->view('layout/kitchensink');
		}
		?>
    </div>
</div>