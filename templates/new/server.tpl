<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if $hoststatus === false AND $serverhost === true}
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {$error}
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
            <form method="post" action="index.php?site=server" class="form-horizontal">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label sr-only">Email</label>
                    <div class="col-sm-12">
                        <textarea class="form-control" type="text" name="msgtoall" size="100" placeholder="{$lang['msgtoall']}"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="submit" name="sendmsg" class="btn btn-default">{$lang['send']}</button>
                    </div>
                </div>
            </form>
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['server']}</h3>
                </div>
                <!-- /.box-header -->
                {if !empty($serverlist)}
                <div class="box-header text-center">
                    <h3 class="box-title">{$serverstats}</h3>
                </div>
                <!-- /.box-header -->
                {/if}
                <div class="box-body no-padding">
                    <form method="post" name="saction" action="index.php?site=server">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th><a href="index.php?site=server&amp;sortby=id&amp;sorttype={if $sortby == 'virtualserver_id' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['id']}</a></th>
                                <th><a href="index.php?site=server&amp;sortby=name&amp;sorttype={if $sortby == 'virtualserver_name' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['name']}</a></th>
                                <th><a href="index.php?site=server&amp;sortby=port&amp;sorttype={if $sortby == 'virtualserver_port' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['port']}</a></th>
                                <th><a href="index.php?site=server&amp;sortby=status&amp;sorttype={if $sortby == 'virtualserver_status' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['status']}</a></th>
                                <th><a href="index.php?site=server&amp;sortby=uptime&amp;sorttype={if $sortby == 'virtualserver_uptime' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['runtime']}</a></th>
                                <th><a href="index.php?site=server&amp;sortby=clients&amp;sorttype={if $sortby == 'virtualserver_clientsonline' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['clients']}</a></th>
                                <th>{$lang['autostart']}</th>
                                <th>{$lang['options']}</th>
                            </tr>
                            {if !empty($serverlist)}
                            <tr>
                                <td colspan="7" align="right"></td>
                                <td>
                                    <button type="submit" name="massaction" onclick="return confirm(confirmAction())" class="btn btn-flat btn-default">{$lang['action']}</button>
                                </td>
                            </tr>
                            {foreach key=key item=value from=$serverlist}
                            <tr>
                                <td>{$value['virtualserver_id']}</td>
                                <td><a href="index.php?site=serverview&amp;sid={$value['virtualserver_id']}">{$value['virtualserver_name']}</a></td>
                                <td>{$value['virtualserver_port']}</td>
                                <td>
                                    {if $value['virtualserver_status'] == "online"}
                                    <span style="color:green">{$lang['online']}</span>
                                    {elseif $value['virtualserver_status'] == "online virtual"}
                                    <span style="color:#0063dc">{$lang['onlinevirtual']}</span>
                                    {elseif $value['virtualserver_status'] == "offline"}
                                    <span style="color:red">{$lang['offline']}</span>
                                    {/if}
                                </td>
                                <td>{$value['virtualserver_uptime']}</td>
                                <td>{$value['virtualserver_clientsonline']} / {$value['virtualserver_maxclients']}</td>
                                <td><input type="checkbox" name="caction[{$value['virtualserver_id']}][auto]" value="1" {if $value['virtualserver_autostart'] == 1}checked="checked"{/if}/></td>
                                <td>
                                    <select class="form-control" id="caction{$value['virtualserver_id']}" name="caction[{$value['virtualserver_id']}][action]" onchange="confirmArray('{$value['virtualserver_id']}', '{$value['virtualserver_name']|addslashes}', '{$value['virtualserver_port']}', '');">
                                        <option value="">{$lang['select']}</option>
                                        <option value="start">{$lang['start']}</option>
                                        <option value="stop">{$lang['stop']}</option>
                                        <option value="del">{$lang['delete']}</option>
                                    </select>
                                </td>
                            </tr>
                            {/foreach}
                            <tr>
                                <td colspan="7" align="right"></td>
                                <td>
                                    <button type="submit" name="massaction" onclick="return confirm(confirmAction())" class="btn btn-flat btn-default">{$lang['action']}</button>
                                </td>
                            </tr>
                            {else}
                            <tr>
                                <tdcolspan='8'>{$lang['noserver']}</td>
                            </tr>
                            {/if}
                        </table>
                    </form>
                    {/if}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>