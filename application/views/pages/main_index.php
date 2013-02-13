<div class="row-fluid">
	<?php $this->load->view('layout/nav') ?>
	<div class="span9 _content">
		<div class="hero-unit">
            <h1><?php echo $fname . ' ' . $lname; ?></h1>
			<p>Computing with Games Development</p>
        </div>
        <?php $this->load->view('layout/kitchensink') ?>
    </div>
</div>