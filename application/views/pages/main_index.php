﻿<div class="row-fluid">
	<?php $this->load->view('layout/nav') ?>
	<div class="span9 _content">
			<?php
			if ($this->session->userdata('id'))
			{
				echo '<div class="hero-unit">';
					# Display user's name
					if ($this->session->userdata('oname'))
						echo '<h1>' . ucwords($this->session->userdata('fname') . ' ' . $this->session->userdata('oname') . ' ' . $this->session->userdata('lname')) . '</h1>';
					else
						echo '<h1>' . ucwords($this->session->userdata('fname') . ' ' . $this->session->userdata('lname')) . '</h1>';

					# Display user's program
					if ($this->session->userdata('level') > 9000) # What does the scouter say!?
						echo '<p>System Administrator</p>';
					else
						echo '<p>' . $this->session->userdata('program') . '</p>';
				echo '</div>';
			}
			?>
        <?php $this->load->view('layout/kitchensink') ?>
    </div>
</div>