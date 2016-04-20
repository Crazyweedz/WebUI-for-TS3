<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
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
                {$lang['chanbackdesc']}
            </div>
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['chanbackups']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <td>{$lang['created']}</td>
                            <td>{$lang['server']}</td>
                            <td>{$lang['options']}</td>
                        </tr>
                        {if isset($files[0]) AND !empty($files[0])}
                            {foreach key=key item=value from=$files[0]}
                                {if $serverhost === true AND $hoststatus === false AND $value['server'] == $getserverip OR $serverhost === false OR $hoststatus === true}
                                    <tr>
                                        <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                        <td>{$value['server']}</td>
                                        <td>
                                            <button class="btn btn-info btn-sm btn-flat" type="button" name="view" title="{$lang['view']}" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}');" style="display: inline-block; margin: auto;"><i class="fa fa-eye"></i></button>
                                            <form method="post" action="index.php?site=backup&amp;sid={$sid}" class="form-inline" style="width: auto; display: inline-block">
                                                <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                <input type="hidden" name="fileport" value="{$value['server']}" />
                                                <button class="btn btn-flat bg-purple btn-sm"><i class="fa fa-repeat" title="{$lang['deploy']}" type="submit" name="deploy"></i></button>
                                            </form>
                                            <form method="post" action="index.php?site=backup&amp;sid={$sid}" class="form-inline" style="width: auto; display: inline-block">
                                                <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                <input type="hidden" name="fileport" value="{$value['server']}" />
                                                <button class="btn btn-sm btn-danger btn-flat" title="{$lang['delete']}" type="submit" name="delete"><i class="fa fa-close"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                {/if}
                            {/foreach}
                        {/if}
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <form method="post" action="index.php?site=backup&amp;sid={$sid}">
                        <button class="btn btn-default btn-flat" type="submit" name="create">{$lang['create']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
            {if $serverhost == true AND $hoststatus == true OR $serverhost == false}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['host']} {$lang['chanbackups']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>{$lang['created']}</td>
                                <td>{$lang['server']}</td>
                                <td>{$lang['options']}</td>
                            </tr>
                            {if isset($files[1]) AND !empty($files[1])}
                                {foreach key=key item=value from=$files[1]}
                                    <tr>
                                        <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                        <td>{$value['server']}</td>
                                        <td>
                                            <button class="btn btn-info btn-sm btn-flat" type="button" name="view" title="{$lang['view']}" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}&amp;hostbackup=1');" style="margin: auto; display: inline-block"><i class="fa fa-eye"></i></button>
                                            <form method="post" action="index.php?site=backup&amp;sid={$sid}" style="margin: auto; display: inline-block">
                                                <input type="hidden" name="hostbackup" value="1" />
                                                <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                <input type="hidden" name="fileport" value="{$value['server']}" />
                                                <button class="btn btn-sm btn-flat bg-purple" type="submit" name="deploy" title="{$lang['deploy']}"><i class="fa fa-repeat"></i></button>
                                            </form>
                                            <form method="post" action="index.php?site=backup&amp;sid={$sid}" style="margin: auto; display: inline-block">
                                                <input type="hidden" name="hostbackup" value="1" />
                                                <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                <input type="hidden" name="fileport" value="{$value['server']}" />
                                                <button class="btn btn-danger btn-sm btn-flat" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                {/foreach}
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        {if $serverhost == true AND $hoststatus == true OR $serverhost == false}
                            <form method="post" action="index.php?site=backup&amp;sid={$sid}">
                                <input type="hidden" name="hostbackup" value="1" />
                                <button class="btn btn-default btn-flat" type="submit" name="create">{$lang['host']} {$lang['create']}</button>
                            </form>
                        {/if}
                    </div>
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>