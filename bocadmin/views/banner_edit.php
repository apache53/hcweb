
<div class="btn-group"><a href="<?php echo site_urlc('banner/index');?>" class="btn"> <i class="fa fa-arrow-left"></i> <?php echo lang('back_list')?> </a></div>

<?php include_once 'inc_form_errors.php'; ?>

<div class="boxed">
	<h3> <i class="fa fa-pencil"></i> 编辑消息 <span class="badge badge-success pull-right"><?php echo $title; ?></span></h3>
	<?php echo form_open(current_urlc(), array('class' => 'form-horizontal', 'id' => 'frm-edit')); ?>

		<div class="boxed-inner seamless">

			<div class="control-group">
				<label for="title" class="control-label">标题:</label>
				<div class="controls">
					<input type="text" name="title" id="title" value="<?php echo set_value('title',$it['title']); ?>"  placeholder="栏目名称" required=1>
					<span class="help-inline"></span>
				</div>
			</div>

			<div class="control-group">
				<label for="title" class="control-label">时间:</label>
				<div class="controls">
					<div class="input-append date timepicker">
						<input type="text" value="<?php echo date("Y/m/d H:i:s",set_value('timeline',$it['timeline'])); ?>" id="timeline" name="timeline">
						<span class="add-on"><i class="icon-th"></i></span>
					</div>
				</div>
			</div>

			<?php if ($this->cid == 2): ?>
			<div class="control-group">
				<label for="link" class="control-label">链接:<br />(以http://开头)</label>
				<div class="controls">
					<input type="text" name="link" id="link" value="<?php echo set_value('link',$it['link']); ?>"  placeholder="链接" required=1>
					<span class="help-inline"></span>
				</div>
			</div>
			<?php endif ?>

			<!-- ctype -->
		    <?php if ($ctype = list_coltypes($this->cid)) { ?>
			<div class="control-group">
				<label class="control-label" for="status"> 所属分类:</label>
				<div class="controls">
					<?php
						echo ui_btn_select('ctype',set_value("ctype",$it['ctype']),$ctype);
					?>
					<span class="help-inline"></span>
				</div>
			</div>
			<?php } ?>


			<?php if ($this->cid == 7): ?>
			<!-- ctype -->
		    <?php if ($ctype = list_coltypes($this->cid)) { ?>
			<div class="control-group">
				<label class="control-label" for="status"> 所属地区:</label>
				<div class="controls">
					<?php
						echo ui_btn_select('district_id',set_value("district_id",$it['district_id']),$district);
					?>
					<span class="help-inline"></span>
				</div>
			</div>
			<?php } ?>
			<?php endif ?>

			<div class="control-group">
				<label for="img" class="control-label">Banner图</label>
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
						<input type="hidden" name="photo" class="form-upload" data-more="0" value="<?php echo set_value('photo',$it['photo']) ?>">
						<input type="hidden" name="thumb" class="form-upload-thumb" value="<?php echo set_value('thumb',$it['thumb']) ?>">
					</div>
				</div>
			</div>

			<div id="js-photo-show" class="js-img-list-f">
				<!-- 模板 #tpl-img-list -->
			</div>
			<div class="clear"></div>

		</div>
		<div class="boxed-footer">
			<?php if ($this->ccid): ?>
			<input type="hidden" name="ccid" value="<?php echo $this->ccid ?>">
			<?php endif ?>
			<input type="hidden" name="cid" value="<?php echo $this->cid ?>">
			<input type="hidden" name="id" value="<?php echo $it['id']?>">
			<input type="submit" value="<?php echo lang('submit') ?>" class="btn btn-primary">
			<input type="reset" value="<?php echo lang('reset') ?>" class="btn btn-danger">
		</div>
	</form>
</div>

<!-- 注意加载顺序 -->
<?php include_once 'inc_ui_media.php'; ?>
<script type="text/javascript">
require(['adminer/js/ui','adminer/js/media','bootstrap-datetimepicker.zh'],function(ui,media){
	$('.timepicker').datetimepicker({'language':'zh-CN','format':'yyyy/mm/dd hh:ii:ss','todayHighlight':true});
	
	var banners_photos = <?php echo json_encode(one_upload($it['photo'])) ?>;
	media.init();
	media.show(banners_photos,"photo");
});
</script>
