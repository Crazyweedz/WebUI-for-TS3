<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			{if isset($permoverview['b_virtualserver_servergroup_list']) AND empty($permoverview['b_virtualserver_servergroup_list'])}
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					{$lang['nopermissions']}
				</div>
			{else}
				{if !empty($error) OR !empty($noerror)}
					{if !empty($error)}
						<div class="alert alert-danger alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							{$error}
						</div>
					{/if}
					{if !empty($noerror)}
						<div class="alert alert-success alert-dismissible" role="alert">
							<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							{$noerror}
						</div>
					{/if}
				{/if}
				<div class="box">
					<div class="box-header text-center">
						<h3 class="box-title">{$lang['channelgroups']}</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<table class="table table-striped table-hover">
							<tr>
								<td width="3%">{$lang['id']}</td>
								<td width="60%">{$lang['name']}</td>
								<td width="8%">{$lang['type']}</td>
								<td width="8%">{$lang['iconid']}</td>
								<td width="8%">{$lang['savedb']}</td>
								<td width="13%">{$lang['options']}</td>
							</tr>
							{if !empty($channelgroups)}
								{foreach key=key item=value from=$channelgroups}
									{if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
									<tr>
										<td>{$value['cgid']}</td>
										<td>
											<form method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}">
												<div class="input-group">
													<input class="form-control" type="text" name="name" value="{$value['name']}" />
													<div class="input-group-btn">
														<button class="btn btn-default btn-flat" type="submit" name="sendname">{$lang['rename']}</button>
													</div>
												</div>
											</form>
										</td>
										<td>{$value['type']}</td>
										<td>{$value['iconid']}</td>
										<td>{$value['savedb']}</td>
										<td>
											{if $value['type'] != '0'}
												<form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$value['cgid']}" class="form-inline" style="width: auto; display: inline-block">
													<button type="submit" class="btn btn-info btn-sm btn-flat" name="permedit" title="{$lang['clients']}"><i class="fa fa-eye"></i></button>
												</form>
											{/if}
											<form method="post" action="index.php?site=cgroupeditperm&amp;sid={$sid}&amp;cgid={$value['cgid']}" class="form-inline" style="width: auto; display: inline-block">
												<button type="submit" class="btn bg-purple btn-sm btn-flat" name="permedit" title="{$lang['editperms']}"><i class="fa fa-edit"></i></button>
											</form>
											{if !isset($permoverview['b_virtualserver_channelgroup_delete']) or $permoverview['b_virtualserver_channelgroup_delete']==1}
												<form method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}" class="form-inline" style="width: auto; display: inline-block">
													<button type="submit" class="btn btn-danger btn-sm btn-flat" name="delgroup" title="{$lang['delete']}"  onclick="return confirm('{$lang['deletemsgchannelgroup']}')"><i class="fa fa-close"></i></button>
												</form>
											{/if}
										</td>
									</tr>
									{assign var=change_col value="`$change_col+1`"}
								{/foreach}
							{/if}
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				<table style="width:100%" class="border" cellpadding="1" cellspacing="0">
				</table>
			{/if}
		</div>
	</div>
</div>