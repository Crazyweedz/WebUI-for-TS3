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
                                {foreach key=key item=value from=$folder.2}
                                    <tr>
                                        <td width="50%">{$value}</td>
                                        <td>
                                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                <input type="hidden" name="backupdate" value="{$value}" />
                                                <button class="btn btn-flat btn-default" type="submit" name="chose">{$lang['select']}</button>
                                            </form>
                                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                <input type="hidden" name="backupdate" value="{$value}" />
                                                <button class="btn btn-danger btn-flat" type="submit" name="deleteall" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                            </form>
                                        </td>
                                    </tr>
                                {/foreach}
                            {else}
                                {if	isset($files[0])}
                                    {foreach key=key item=value from=$files.0}
                                        <tr>
                                            <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                            <td>{$value['server']}</td>
                                            <td>
                                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                    <button class="btn btn-flat bg-purple btn-sm" type="submit" name="deploy" title="{$lang['deploy']}"><i class="fa fa-repeat"></i></button>
                                                </form>
                                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                    <button class="btn btn-flat btn-sm btn-danger" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                                </form>
                                            </td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    <tr>
                                        <td colspan="3" class="green1 center">No Backups found!</td>
                                    </tr>
                                {/if}
                            {/if}
                        {/if}
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                        <button class="btn btn-default btn-flat btn-sm" type="submit" name="create">{$lang['create']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
            {if $hoststatus == true}
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
                                    {foreach key=key item=value from=$folder[1]}
                                        <tr>
                                            <td width="50%">{$value}</td>
                                            <td>
                                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                    <input type="hidden" name="backupdate" value="{$value}" />
                                                    <button class="btn btn-default btn-sm btn-flat"  type="submit" name="chose">{$lang['select']}</button>
                                                </form>
                                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                    <input type="hidden" name="hostbackup" value="1" />
                                                    <input type="hidden" name="backupdate" value="{$value}" />
                                                    <button class="btn btn-danger btn-flat"  type="submit" name="deleteall" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
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
                                                    <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                        <input type="hidden" name="hostbackup" value="1" />
                                                        <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                        <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                        <input type="hidden" name="fileport" value="{$value['server']}" />
                                                        <button class="btn btn-sm btn-flat bg-purple" type="submit" name="deploy" title="{$lang['deploy']}"><i class="fa fa-repeat"></i></button>
                                                    </form>
                                                    <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}" style="width: auto; display: inline-block">
                                                        <input type="hidden" name="hostbackup" value="1" />
                                                        <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                                        <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                                        <input type="hidden" name="fileport" value="{$value['server']}" />
                                                        <button class="btn btn-sm btn-flat btn-danger" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    {else}
                                        <tr>
                                            <td colspan="3" class="green1 center">No Backups found!</td>
                                        </tr>
                                    {/if}
                                {/if}
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        {if $hoststatus==true}
                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
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