
<div class="btn-group">
	<a href="<?php echo site_urlc('banner/index')?>" class='btn'> <i class="fa fa-arrow-left"></i> <?php echo lang('back_list')?></a>
</div>

<?php include_once 'inc_form_errors.php'; ?>

<div class="boxed">
	<h3> <i class="fa fa-plus"></i> <span class="badge badge-success pull-right"><?php echo $title; ?></span> <?php echo lang('add') ?></h3>
	<?php echo form_open(current_urlc(),array("class"=>"form-horizontal","id"=>"frm-create")); ?>

		<div class="boxed-inner seamless">
			<div class="control-group">
				<label class="control-label" for="title"> <?php echo lang('title') ?> </label>
				<div class="controls">
					<input type="text" id="title" name="title" value="<?php echo set_value("title") ?>" x-webkit-speech>
				</div>
			</div>

			<div class="control-group">
				<label for="title" class="control-label">时间:</label>
				<div class="controls">
					<div class="input-append date timepicker">
						<input type="text" value="<?php echo date("Y-m-d H:i:s",set_value('timeline',now())); ?>" id="timeline" name="timeline" data-date-format="yyyy-mm-dd hh:ii:ss">
						<span class="add-on"><i class="icon-th"></i></span>
					</div>
				</div>
			</div>

			<?php if ($this->cid == 2): ?>
			<div class="control-group">
				<label class="control-label" for="link">链接：<br />(以http://开头)</label>
				<div class="controls">
					<input type="text" id="link" name="link" value="<?php echo set_value("link") ?>" x-webkit-speech>
				</div>
			</div>
			<?php endif ?>

			<!-- ctype -->
			<?php if ($ctype = list_coltypes($this->cid)) { ?>
			<div class="control-group">
				<label class="control-label" for="status"> 所属分类:</label>
				<div class="controls">
					<?php
						echo ui_btn_select('ctype',set_value("ctype"),$ctype);
					?>
					<span class="help-inline"></span>
				</div>
			</div>
			<?php } ?>

			<?php if ($this->cid == 7): ?>
			<!-- ctype -->
			<div class="control-group">
				<label class="control-label" for="status"> 所属地区:</label>
				<div class="controls">
					<?php
						echo ui_btn_select('district_id',set_value("district_id"),$district);
					?>
					<span class="help-inline"></span>
				</div>
			</div>
			<?php endif ?>

			<!-- 图片上传 -->
			<div class="control-group">
				<label for="img" class="control-label"><?php echo lang('photo') ?>：</label>
				<div class="controls">
					<div class="btn-group">
						<span class="btn btn-success">
							<i class="fa fa-upload"></i>
							<span> <?php echo lang('upload_file') ?>
							<?php if (in_array($this->cid, array(7,8))): ?>
								(750x285)
							<?php endif ?>
							</span>
							<input class="fileupload" type="file" accept="">
						</span>
						<input type="hidden" name="photo" class="form-upload" data-more="0" value="<?php echo set_value("photo") ?>">
						<input type="hidden" name="thumb" class="form-upload-thumb" value="<?php echo set_value("thumb") ?>">
					</div>
				</div>
			</div>

			<!-- 对应 photo 模板容器 js 开头为js操作的容器 -->
			<div id="js-photo-show" class="js-img-list-f">
				<!-- 模板 #tpl-img-list -->
			</div>
			<div class="clear"></div>

		</div>

		<div class="boxed-footer">
			<input type="hidden" name="cid" value="<?php echo $this->cid ?>">
			<?php if ($this->ccid): ?>
			<input type="hidden" name="ccid" value="<?php echo $this->ccid ?>">
			<?php endif ?>
			<input type="submit" value=" <?php echo lang('submit'); ?> " class='btn btn-primary'>
			<input type="reset" value=' <?php echo lang('reset'); ?> ' class="btn btn-danger">
		</div>
	</form>
</div>

<?php include_once 'inc_ui_media.php'; ?>

<script type="text/javascript">
require(['adminer/js/ui','adminer/js/media','bootstrap-datetimepicker.zh'],function(ui,media){
	// timepick
	$('.timepicker').datetimepicker({'language':'zh-CN','format':'yyyy/mm/dd hh:ii:ss','todayHighlight':true});
	// media 上传
	media.init();
	var banners_photos = <?php echo json_encode(one_upload(set_value("photo"))) ?>;
	media.show(banners_photos,"photo");
});

</script>
