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
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            {$noerror}
                        </div>
                    {/if}
                {/if}
                {if !isset($smarty.post.createserver) OR !empty($error)}
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {$lang['createserverdesc']}
                    </div>
                    <form method="post" action="index.php?site=createserver">
                        <div class="box" style="margin-bottom: 0">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['createnewserver']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['name']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_name]" value="{$screate_tmp['name']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['port']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_port]" value="{$screate_tmp['port']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['minclientversion']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_min_client_version]" value="{$screate_tmp['minclientversion']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['welcomemsg']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_welcomemessage]" value="{$screate_tmp['welcomemsg']}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['maxclients']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_maxclients]" value="{$screate_tmp['maxclients']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['maxreservedslots']}:</td>
                                        <td>
                                            <input class="form-control" type="text" name="newsettings[virtualserver_reserved_slots]" value="{$screate_tmp['reservedslots']}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['showonweblist']}:</td>
                                        <td>
                                            <input class="form-control" type="text" name="newsettings[virtualserver_weblist_enabled]" value="{$screate_tmp['showonweblist']}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['password']}:</td>
                                        <td>
                                            <input class="form-control" type="text" name="newsettings[virtualserver_password]" value="{$screate_tmp['password']}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['securitylevel']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_needed_identity_security_level]" value="{$screate_tmp['securitylvl']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['minclientschan']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$screate_tmp['forcesilence']}"/></td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <div class="box" style="margin-bottom: 0">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['host']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['hostmessage']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostmessage]" value="{$screate_tmp['hostmsg']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostmessageshow']}:</td>
                                        <td>
                                            <input {if $screate_tmp['hostmsgshow'] === '0'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="0" /> {$lang['nomessage']} <br />
                                            <input {if $screate_tmp['hostmsgshow'] === '1'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="1" /> {$lang['showmessagelog']}<br />
                                            <input {if $screate_tmp['hostmsgshow'] === '2'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="2" /> {$lang['showmodalmessage']}<br />
                                            <input {if $screate_tmp['hostmsgshow'] === '3'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="3" /> {$lang['modalandexit']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hosturl']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_url]" value="{$screate_tmp['hosturl']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostbannerurl']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$screate_tmp['hostbannerurl']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostbannerintval']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$screate_tmp['hostbannerint']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostbuttongfx']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$screate_tmp['hostbuttongfx']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostbuttontooltip']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$screate_tmp['hostbuttontip']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['hostbuttonurl']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_url]" value="{$screate_tmp['hostbuttonurl']}"/></td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <div class="box" style="margin-bottom: 0">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['autoban']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['autobancount']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_count]" value="{$screate_tmp['autobancount']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['autobantime']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_time]" value="{$screate_tmp['autobantime']}"/>
                                                <span class="input-group-addon">{$lang['seconds']}</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['removetime']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_complain_remove_time]" value="{$screate_tmp['removetime']}"/>
                                                <span class="input-group-addon">{$lang['seconds']}</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <div class="box" style="margin-bottom: 0">
                            <div class="box-header text-center table-hover">
                                <h3 class="box-title">{$lang['antiflood']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped">
                                    <tr>
                                        <td width="50%">{$lang['pointstickreduce']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$screate_tmp['pointstickreduce']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['pointsneededblockcmd']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$screate_tmp['pointsneededblockcmd']}"/></td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['pointsneededblockip']}:</td>
                                        <td><input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$screate_tmp['pointsneededblockip']}"/></td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <div class="box" style="margin-bottom: 0">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['transfers']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['upbandlimit']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$screate_tmp['uploadbandwidthlimit']}"/>
                                                <span class="input-group-addon">Byte/s</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['uploadquota']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_upload_quota]" value="{$screate_tmp['uploadquota']}"/>
                                                <span class="input-group-addon">MiB</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['downbandlimit']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$screate_tmp['downloadbandwidthlimit']}"/>
                                                <span class="input-group-addon">Byte/s</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['downloadquota']}:</td>
                                        <td>
                                            <div class="input-group">
                                                <input class="form-control" type="text" name="newsettings[virtualserver_download_quota]" value="{$screate_tmp['downloadquota']}"/>
                                                <span class="input-group-addon">MiB</span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                        <div class="box">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['logs']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['logclient']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_client]" value="1" {if $screate_tmp['virtualserver_log_client'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_client]" value="0" {if $screate_tmp['virtualserver_log_client'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['logquery']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_query]" value="1" {if $screate_tmp['virtualserver_log_query'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_query]" value="0" {if $screate_tmp['virtualserver_log_query'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['logchannel']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_channel]" value="1" {if $screate_tmp['virtualserver_log_channel'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_channel]" value="0" {if $screate_tmp['virtualserver_log_channel'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['logpermissions']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_permissions]" value="1" {if $screate_tmp['virtualserver_log_permissions'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_permissions]" value="0" {if $screate_tmp['virtualserver_log_permissions'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['logserver']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_server]" value="1" {if $screate_tmp['virtualserver_log_server'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_server]" value="0" {if $screate_tmp['virtualserver_log_server'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['logfiletransfer']}:</td>
                                        <td>
                                            <input type="radio" name="newsettings[virtualserver_log_filetransfer]" value="1" {if $screate_tmp['virtualserver_log_filetransfer'] === '1'}checked="checked"{/if} /> {$lang['yes']}
                                            <input type="radio" name="newsettings[virtualserver_log_filetransfer]" value="0" {if $screate_tmp['virtualserver_log_filetransfer'] === '0'}checked="checked"{/if} /> {$lang['no']}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="submit" name="createserver" class="btn btn-flat btn-default">{$lang['create']}</button>
                            </div>
                            <!-- box-footer -->
                        </div>
                        <!-- /.box -->
                    </form>
                {/if}
            {/if}
        </div>
    </div>
</div>