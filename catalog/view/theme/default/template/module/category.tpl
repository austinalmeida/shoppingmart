<div class="block left-module">
	<p class="title_block">Browse</p>
	<div class="block_content">
		<!-- layered -->
		<div class="layered layered-category">
			<div class="layered-content">
				<ul class="tree-menu">
				<?php foreach ($categories as $category) { ?>
				<?php if ($category['category_id'] == $category_id) { ?>
					<li class="active">
						<span></span><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
						<?php if ($category['children']) { ?>  
						<ul style="display: block;">
							<?php foreach ($category['children'] as $child) { ?>
							<?php if ($child['category_id'] == $child_id) { ?>
							  <li class="active"><span></span><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
							  <?php } else { ?>
							  <li><span></span><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
							  <?php } ?>
							<?php } ?>
						</ul>
						<?php } ?>
					</li>
				<?php } } ?>
				</ul>
			</div>
		</div>
	</div>
</div>