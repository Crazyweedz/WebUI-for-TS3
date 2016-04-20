<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if $hoststatus === false AND $serverhost === true}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nohoster']}
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
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['servbackdesc']}
                </div>
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['snapwarning']}
                </div>
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['serverbackups']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['created']}</th>
                                <th>{$lang['server']}</th>
                                <th>{$lang['options']}</th>
                            </tr>
                            {if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
                                {if !isset($smarty.post.backupdate)}
                                    {foreach key=key item=value from=$folder[2]}
                                        <tr>
                                            <td class="{$td_col}">{$value}</td>
                                            <td colspan="2">
                                                <form method="post" action="index.php?site=iserverbackup">
                                                    <input type="hidden" name="backupdate" value="{$value}" />
                                                    <button type="submit" name="chose" class="btn btn-default btn-flat">{$lang['select']}</button>
                                                </form>
                                            </td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    {if	isset($files[0])}
                                        {foreach key=key item=value from=$files[0]}
                                            <tr>
                                                <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                                <td>{$value['server']}</td>
                                                <td>
                                                    <form class="form-inline" method="post" action="index.php?site=iserverbackup" style="display: inline">
                                                        <div class="form-group">
                                                            <select name="deployon" class="form-control input-sm">
                                                                <option value="">-</option>
                                                                {if !empty($serverlist)}
                                                                    {foreach key=key2 item=value2 from=$serverlist}
                                                                        <option value="{$value2['virtualserver_port']}">{$value2['virtualserver_name']}:{$value2['virtualserver_port']}</option>
                                                                    {/foreach}
                                                                {/if}
                                                            </select>
                                                        </div>
                                                        <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                        <input type="hidden" name="fileport" value="{$value['server']}" />
                                                        <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                        <button type="submit" name="deploy" value="" title="{$lang['deploy']}" class="btn btn-success btn-sm btn-flat"><i class="fa fa-check"></i></button>
                                                        <button type="submit" name="delete" value="" title="{$lang['delete']}" class="btn btn-danger btn-sm btn-flat"><i class="fa fa-close"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    {else}
                                        <tr class="text-center">
                                            <td colspan="3">No Backups found!</td>
                                        </tr>
                                    {/if}
                                {/if}
                            {else}
                                <tr class="text-center">
                                    <td colspan="3">No Backups found!</td>
                                </tr>
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <form method="post" action="index.php?site=iserverbackup">
                            <button class="btn btn-default btn-flat" type="submit" name="create">{$lang['create']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['host']} {$lang['serverbackups']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['created']}</th>
                                <th>{$lang['server']}</th>
                                <th>{$lang['options']}</th>
                            </tr>
                            {if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
                                {if !isset($smarty.post.backupdate)}
                                    {foreach key=key item=value from=$folder.1}
                                        <tr>
                                            <td>{$value}</td>
                                            <td colspan="2">
                                                <form method="post" action="index.php?site=iserverbackup">
                                                    <input type="hidden" name="backupdate" value="{$value}" />
                                                    <button type="submit" name="chose" class="btn btn-default btn-flat">{$lang['select']}</button>
                                                </form>
                                            </td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    {if	isset($files[1])}
                                        {foreach key=key item=value from=$files[1]}
                                            <tr>
                                                <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                                <td>{$value['server']}</td>
                                                <td>
                                                    <form class="form-inline" method="post" action="index.php?site=iserverbackup">
                                                        <div class="form-group">
                                                            <select class="form-control input-sm" name="deployon">
                                                                <option value="">-</option>
                                                                {if !empty($serverlist)}
                                                                    {foreach key=key2 item=value2 from=$serverlist}
                                                                        <option value="{$value2['virtualserver_port']}">{$value2['virtualserver_name']}:{$value2['virtualserver_port']}</option>
                                                                    {/foreach}
                                                                {/if}
                                                            </select>
                                                        </div>
                                                        <input type="hidden" name="hostbackup" value="1" />
                                                        <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                        <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                        <input type="hidden" name="fileport" value="{$value['server']}" />
                                                        <button class="btn btn-flat bg-purple btn-sm" type="submit" name="deploy" value="" title="{$lang['deploy']}"><i class="fa fa-repeat"></i></button>
                                                        <button class="btn btn-danger btn-flat btn-sm" type="submit" name="delete" value="" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    {else}
                                        <tr class="text-center">
                                            <td colspan="3">No Backups found!</td>
                                        </tr>
                                    {/if}
                                {/if}
                            {else}
                                <tr class="text-center">
                                    <td colspan="3">No Backups found!</td>
                                </tr>
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <form method="post" action="index.php?site=iserverbackup">
                            <input type="hidden" name="hostbackup" value="1" />
                            <button class="btn btn-default btn-flat" type="submit" name="create">{$lang['host']} {$lang['create']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>