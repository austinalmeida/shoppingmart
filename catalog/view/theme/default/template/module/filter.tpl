<div id="filter">
	<?php foreach ($filter_groups as $filter_group) { ?>
	<div class="layered_subtitle"><?php echo $filter_group['name']; ?></div>
		<div class="layered-content filter-brand">
			<ul>
			<?php foreach ($filter_group['filter'] as $filter) { ?>
				<li style="padding-bottom:5px;">
					<?php if (in_array($filter['filter_id'], $filter_category)) { ?>
					<input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
					<label>
                       <span class="button"></span>
					   <?php echo $filter['name'] . ' (' . $filter['f_count'] . ')'; ?>
					</label>  
					<?php } else { ?>
					<input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?php if($filter['f_count'] == 0) { echo "disabled"; } ?> />
					<label>
                       <span class="button"></span>
						<?php echo $filter['name'] . ' (' . $filter['f_count'] . ')'; ?>
					</label>
					<?php } ?>
				</li>
			<?php } ?>
			</ul>
		</div>
	<?php } ?>
			</div>
		</div>
	</div>
</div>		
<script type="text/javascript">
$('#filter :checkbox').change(function() {
	filter = [];

	$('input[name^=\'filter\']:checked').each(function(element) {
		filter.push(this.value);
	});

	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
</script>
