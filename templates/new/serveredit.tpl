<div class="container-fluid">
    <div class="row">
        <div class="col-md-8">
            {if !empty($error) OR !empty($noerror)}
                {if !empty($error)}
                    <div class="alert alert-success alert-dismissible" role="alert">
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
            <form method="post" action="index.php?site=serveredit&amp;sid={$sid}">
                <div class="box" style="margin-bottom: 0">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['virtualserver']} #{$serverinfo['virtualserver_id']} {$lang['editor']} </h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="50%">{$lang['autostart']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_autostart']) AND empty($permoverview['b_virtualserver_modify_autostart'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_autostart]">
                                            <option value="1" {if $serverinfo['virtualserver_autostart'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                            <option value="0" {if $serverinfo['virtualserver_autostart'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['port']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_port']) AND empty($permoverview['b_virtualserver_modify_port'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_port]" value="{$serverinfo['virtualserver_port']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['minclientversion']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_min_client_version']) AND empty($permoverview['b_virtualserver_modify_min_client_version'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_min_client_version]" value="{$serverinfo['virtualserver_min_client_version']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['name']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_name']) AND empty($permoverview['b_virtualserver_modify_name'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_name]" value="{$serverinfo['virtualserver_name']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['welcomemsg']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_welcomemessage']) AND empty($permoverview['b_virtualserver_modify_welcomemessage'])}
                                        -
                                    {else}
                                        <textarea class="form-control" name="newsettings[virtualserver_welcomemessage]" rows="5" cols="30">{$serverinfo['virtualserver_welcomemessage']}</textarea>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['maxclients']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_maxclients']) AND empty($permoverview['b_virtualserver_modify_maxclients'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_maxclients]" value="{$serverinfo['virtualserver_maxclients']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['maxreservedslots']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_reserved_slots']) AND empty($permoverview['b_virtualserver_modify_reserved_slots'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_reserved_slots]" value="{$serverinfo['virtualserver_reserved_slots']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['showonweblist']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_weblist']) AND empty($permoverview['b_virtualserver_modify_weblist'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_weblist_enabled]">
                                            <option value="1" {if $serverinfo['virtualserver_weblist_enabled'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                            <option value="0" {if $serverinfo['virtualserver_weblist_enabled'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['codecencryptionmode']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_codec_encryption_mode']) AND empty($permoverview['b_virtualserver_modify_codec_encryption_mode'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_codec_encryption_mode]">
                                            <option value="0" {if $serverinfo['virtualserver_codec_encryption_mode'] == 0}selected='selected'{/if}>{$lang['codecencryptionmodeindi']}</option>
                                            <option value="1" {if $serverinfo['virtualserver_codec_encryption_mode'] == 1}selected='selected'{/if}>{$lang['codecencryptionmodegoff']}</option>
                                            <option value="2" {if $serverinfo['virtualserver_codec_encryption_mode'] == 2}selected='selected'{/if}>{$lang['codecencryptionmodegon']}</option>
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['passwordset']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_password']) AND empty($permoverview['b_virtualserver_modify_password'])}
                                        -
                                    {else}
                                        {if $serverinfo['virtualserver_flag_password'] == 1}{$lang['yes']}{else} {$lang['no']}{/if}
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['securitylevel']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_needed_identity_security_level']) AND empty($permoverview['b_virtualserver_modify_needed_identity_security_level'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_needed_identity_security_level]" value="{$serverinfo['virtualserver_needed_identity_security_level']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['minclientschan']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_channel_forced_silence']) AND empty($permoverview['b_virtualserver_modify_channel_forced_silence'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['iconid']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_icon_id']) AND empty($permoverview['b_virtualserver_modify_icon_id'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" id="iconid" type="text" name="newsettings[virtualserver_icon_id]" value="{$serverinfo['virtualserver_icon_id']}" />
                                        <span class="input-group-addon">
                                        <a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}&amp;port={$serverinfo['virtualserver_port']}');">{$lang['set']}</a>
                                        </span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
                <div class="box" style="margin-bottom: 0">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['standardgroups']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="50%">{$lang['servergroup']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_default_servergroup']) AND empty($permoverview['b_virtualserver_modify_default_servergroup'])}
                                        -
                                    {else}
                                        <select class="form-control"name="newsettings[virtualserver_default_server_group]">
                                            {foreach key=key item=value from=$servergroups}
                                                {if $value['type'] == 1}
                                                    <option {if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}selected="selected"{/if} value="{$value['sgid']}">{$value['sgid']} {$value['name']}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['channelgroup']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_default_channelgroup']) AND empty($permoverview['b_virtualserver_modify_default_channelgroup'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_default_channel_group]">
                                            {foreach key=key item=value from=$channelgroups}
                                                {if $value['type'] == 1}
                                                    <option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['chanadmingroup']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_default_channeladmingroup']) AND empty($permoverview['b_virtualserver_modify_default_channeladmingroup'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_default_channel_admin_group]">
                                            {foreach key=key item=value from=$channelgroups}
                                                {if $value['type'] == 1}
                                                    <option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
                                                {/if}
                                            {/foreach}
                                        </select>
                                    {/if}
                                </td>
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
                                <td width="50%">{$lang['hostmessage']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
                                        -
                                    {else}
                                        <textarea class="form-control" name="newsettings[virtualserver_hostmessage]" rows="5" cols="30">{$serverinfo['virtualserver_hostmessage']}</textarea>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostmessageshow']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
                                        -
                                    {else}
                                        <select class="form-control" name="newsettings[virtualserver_hostmessage_mode]">
                                            <option value="0" {if $serverinfo['virtualserver_hostmessage_mode'] == 0}selected='selected'{/if}>{$lang['nomessage']}</option>
                                            <option value="1" {if $serverinfo['virtualserver_hostmessage_mode'] == 1}selected='selected'{/if}>{$lang['showmessagelog']}</option>
                                            <option value="2" {if $serverinfo['virtualserver_hostmessage_mode'] == 2}selected='selected'{/if}>{$lang['showmodalmessage']}</option>
                                            <option value="3" {if $serverinfo['virtualserver_hostmessage_mode'] == 3}selected='selected'{/if}>{$lang['modalandexit']}</option>
                                        </select>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hosturl']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_url]" value="{$serverinfo['virtualserver_hostbanner_url']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostbannerurl']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                                        -
                                    {else}
                                        {if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
                                            <img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
                                        {/if}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$serverinfo['virtualserver_hostbanner_gfx_url']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostbannerintval']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$serverinfo['virtualserver_hostbanner_gfx_interval']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostbuttontooltip']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$serverinfo['virtualserver_hostbutton_tooltip']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostbuttongfx']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$serverinfo['virtualserver_hostbutton_gfx_url']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['hostbuttonurl']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_url]" value="{$serverinfo['virtualserver_hostbutton_url']}" />
                                    {/if}
                                </td>
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
                                <td width="50%">{$lang['autobancount']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_count]" value="{$serverinfo['virtualserver_complain_autoban_count']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['autobantime']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_time]" value="{$serverinfo['virtualserver_complain_autoban_time']}" />
                                            <span class="input-group-addon">{$lang['seconds']}</span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['removetime']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_complain_remove_time]" value="{$serverinfo['virtualserver_complain_remove_time']}" />
                                            <span class="input-group-addon">{$lang['seconds']}</span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
                <div class="box" style="margin-bottom: 0">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['antiflood']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="50%">{$lang['pointstickreduce']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$serverinfo['virtualserver_antiflood_points_tick_reduce']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['pointsneededblockcmd']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_command_block']}" />
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['pointsneededblockip']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}" />
                                    {/if}
                                </td>
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
                                <td width="50%">{$lang['upbandlimit']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$serverinfo['virtualserver_max_upload_total_bandwidth']}" />
                                            <span class="input-group-addon">Byte/s</span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['uploadquota']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_upload_quota]" value="{$serverinfo['virtualserver_upload_quota']}" />
                                            <span class="input-group-addon">MiB</span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['downbandlimit']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$serverinfo['virtualserver_max_download_total_bandwidth']}" />
                                            <span class="input-group-addon">Byte/s</span>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['downloadquota']}</td>
                                <td>
                                    {if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[virtualserver_download_quota]" value="{$serverinfo['virtualserver_download_quota']}" />
                                            <span class="input-group-addon">MiB</span>
                                        </div>
                                    {/if}
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
                                <td width="50%">{$lang['logclient']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_client]">
                                        <option value="1" {if $serverinfo['virtualserver_log_client'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_client'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['logquery']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_query]">
                                        <option value="1" {if $serverinfo['virtualserver_log_query'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_query'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['logchannel']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_channel]">
                                        <option value="1" {if $serverinfo['virtualserver_log_channel'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_channel'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['logpermissions']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_permissions]">
                                        <option value="1" {if $serverinfo['virtualserver_log_permissions'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_permissions'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['logserver']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_server]">
                                        <option value="1" {if $serverinfo['virtualserver_log_server'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_server'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['logfiletransfer']}</td>
                                <td>
                                    <select class="form-control" name="newsettings[virtualserver_log_filetransfer]">
                                        <option value="1" {if $serverinfo['virtualserver_log_filetransfer'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $serverinfo['virtualserver_log_filetransfer'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-flat btn-default" type="submit" name="editserver">{$lang['edit']}</button>
                    </div>
                </div>
                <!-- /.box -->
            </form>
        </div>
        <div class="col-md-4">
            {if !isset($permoverview['b_virtualserver_modify_password']) OR $permoverview['b_virtualserver_modify_password'] == 1}
                <form class="form-horizontal" method="post" action="index.php?site=serveredit&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['serverpassword']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- Password input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label sr-only" for="newsettings[virtualserver_password]">{$lang['newpassword']}</label>
                                <div class="col-md-12">
                                    <input id="passwordinput" name="newsettings[virtualserver_password]" type="password" placeholder="{$lang['newpassword']}" class="form-control input-md">
                                </div>
                            </div>
                            <!-- Button -->
                            <div class="form-group">
                                <label class="col-md-4 control-label sr-only" for="singlebutton">Single Button</label>
                                <div class="col-md-12">
                                    <button id="singlebutton" type="submit" name="editpw" class="btn btn-flat btn-default">{$lang['send']}</button>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
        </div>
    </div>
</div>