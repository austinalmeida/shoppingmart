<?php if (count($cities) > 1) { ?>
<div class="pull-left">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="city">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($cities as $city) { ?>
    <?php if ($city['code'] == $code) { ?>
	<strong><?php echo $city['code']; ?></strong>
    <?php } elseif ($city['code'] == $code) { ?>
	<strong><?php echo $city['code']; ?></strong>
    <?php } ?>
    <?php } ?>
    <i class="fa fa-caret-down"></i></button>
    <ul class="dropdown-menu">
      <?php foreach ($cities as $city) { ?>
      <?php if ($city['code']) { ?>
      <li><button class="city-select btn btn-link btn-block" type="button" name="<?php echo $city['code']; ?>"><?php echo $city['city_name']; ?></button></li>
      <?php } else { ?>
      <li><button class="city-select btn btn-link btn-block" type="button" name="<?php echo $city['code']; ?>"><?php echo $city['city_name']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
