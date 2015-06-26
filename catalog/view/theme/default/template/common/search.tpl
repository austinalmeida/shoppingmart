<form class="form-inline" id="search">
	  <div class="form-group form-category">
		<select class="select-category">
			<option value="2">All Categories</option>
			<option value="1">Men</option>
			<option value="2">Women</option>
		</select>
	  </div>
	  <div class="form-group input-serach">
		<input type="text" name="search" value="<?php echo $search; ?>" placeholder="Keyword here...">
	  </div>
	  <button type="submit" class="pull-right btn-search"></button>
</form>