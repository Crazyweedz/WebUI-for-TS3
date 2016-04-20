<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if $hoststatus === false AND $serverhost === true}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$nohoster}
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
                        <h3 class="box-title">{$lang['instanceedit']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <form method="post" action="index.php?site=instanceedit">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['questsquerygroup']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_guest_serverquery_group]" value="{$instanceinfo['serverinstance_guest_serverquery_group']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['tempsadmingroup']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_template_serveradmin_group]" value="{$instanceinfo['serverinstance_template_serveradmin_group']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['tempcadmingroup']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_template_channeladmin_group]" value="{$instanceinfo['serverinstance_template_channeladmin_group']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['tempsdefgroup']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_template_serverdefault_group]" value="{$instanceinfo['serverinstance_template_serverdefault_group']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['tempcdefgroup']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_template_channeldefault_group]" value="{$instanceinfo['serverinstance_template_channeldefault_group']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['filetransport']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_filetransfer_port]" value="{$instanceinfo['serverinstance_filetransfer_port']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['maxdownbandwidth']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_max_download_total_bandwidth]" value="{$instanceinfo['serverinstance_max_download_total_bandwidth']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['maxupbandwidth']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_max_upload_total_bandwidth]" value="{$instanceinfo['serverinstance_max_upload_total_bandwidth']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['squeryfloodcmd']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_serverquery_flood_commands]" value="{$instanceinfo['serverinstance_serverquery_flood_commands']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['squeryfloodtime']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_serverquery_flood_time]" value="{$instanceinfo['serverinstance_serverquery_flood_time']}" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['squerybantime']}</td>
                                    <td><input class="form-control" type="text" name="newsettings[serverinstance_serverquery_ban_time]" value="{$instanceinfo['serverinstance_serverquery_ban_time']}" /></td>
                                </tr>
                            </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-flat btn-default" type="submit" name="editinstance">{$lang['edit']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['showonweblist']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <form method="post" action="index.php?site=instanceedit">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th width="33%">{$lang['serverid']}</th>
                                    <th width="33%">{$lang['name']}</th>
                                    <th width="33%" align="right">{$lang['selectall']}<input type="checkbox" name="checkall" value="0" onclick="check(1)" /></th>
                                </tr>
                                {if !empty($serverlist)}
                                    {foreach key=key item=value from=$serverlist}
                                        <tr>
                                            <td class="{$td_col}">{$value['virtualserver_id']}</td>
                                            <td class="{$td_col}">{$value['virtualserver_name']}</td>
                                            <td class="{$td_col}">
                                                <input type="hidden" name="list[{$value['virtualserver_id']}][0]" value="0" />
                                                <input {if $value['virtualserver_weblist_enabled'] == 1}checked="checked"{/if} type="checkbox" id="list{$value['virtualserver_id']}" name="list[{$value['virtualserver_id']}][0]" value="1"/>
                                            </td>
                                        </tr>
                                    {/foreach}
                                {/if}
                            </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-flat btn-default" type="submit" name="editshowlist">{$lang['edit']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>