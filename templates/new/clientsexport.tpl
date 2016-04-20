<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form method="post" action="site/clientsexport.php" target="_blank">
				<div class="alert alert-warning alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					{$lang['clientsexportdesc']}
				</div>
				<div class="box">
					<div class="box-header text-center">
						<h3 class="box-title">{$lang['clientsexport']}</h3>
					</div><!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped table-hover">
							<tr>
								<td width="50%">
									<div class="input-group">
										<input class="form-control" type="text" name="sid" value="" placeholder="{$lang['serverid']}"/>
										<input type="hidden" name="sid" value="{$sid}"/>
										<span class="input-group-btn">
											<button class="btn btn-default btn-flat" type="submit" name="give">{$lang['clientsexport']}</button>
										</span>
									</div>
								</td>
							</tr>
						</table>
					</div><!-- /.box-body -->
				</div><!-- /.box -->
			</form>
		</div>
	</div>
</div>