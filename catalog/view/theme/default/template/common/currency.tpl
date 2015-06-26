<?php if (count($currencies) > 1) { ?>
<div class="currency ">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
	<div class="dropdown">	
		<?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['code'] == $code) { ?>
			<a class="current-open" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><?php echo $currency['title']; ?></a>
		<?php } } ?>
		<ul class="dropdown-menu" role="menu">
			<?php foreach ($currencies as $currency) { ?>
				<li><a href='#' class="currency-select" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
	<input type="hidden" name="code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>