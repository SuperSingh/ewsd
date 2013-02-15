<!DOCTYPE HTML>
<html lang="en-GB">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title><?php echo isset($pagetitle) ? $pagetitle : NULL ?> - Greenwich CMS Intranet</title>
    
    <script type="text/javascript" src="<?php echo base_url() ?>static/js/jquery-1.9.0.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url() ?>static/js/actions.js"></script>
    
    <link rel="stylesheet" href="<?php echo base_url() ?>static/bootstrap/css/bootstrap.min.css"/>
	<!--<link rel="stylesheet" href="http://bootswatch.com/journal/bootstrap.min.css" />-->
	<link rel="stylesheet" href="<?php echo base_url() ?>static/bootstrap/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" href="<?php echo base_url() ?>static/imports.css"/>
    <link rel="stylesheet" href="<?php echo base_url() ?>static/sitestyles.css"/>
    
</head>
<body>
    <div class="container-fluid">
        <div class="row-fluid">
        	<div class="span12">
                <?php $this->load->view('layout/navbar'); ?>
            </div>
        </div>
