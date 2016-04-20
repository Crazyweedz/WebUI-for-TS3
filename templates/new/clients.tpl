<div class="container-fluid">
    {if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            {$lang['nopermissions']}
        </div>
    {else}
        <div class="row">
            <div class="col-md-4">
                <form method="post" action="index.php?site=clients&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['searchfor']} {$lang['client']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">
                                <select class="form-control" name="searchby">
                                    <option value="uniqueid">{$lang['uniqueid']}</option>
                                    <option value="cldbid">{$lang['cldbid']}</option>
                                    <option value="name">{$lang['name']}</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="search" placeholder="ID" />
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="sendsearch">{$lang['search']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['clients']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td>
                                    {if $pages!=0}
                                        {while $print_pages <= $pages}
                                            {if $print_pages == 1}
                                                <a class="paging" href="index.php?site=clients&amp;sid={$sid}&amp;getstart=0{if isset($smarty.get.sortby)}&amp;sortby={$smarty.get.sortby}{/if}{if isset($smarty.get.sorttype)}&amp;sorttype={$smarty.get.sorttype}{/if}">{$print_pages}</a>
                                            {else}
                                                -<a class="paging" href="index.php?site=clients&amp;sid={$sid}&amp;getstart={$countstarted}{if isset($smarty.get.sortby)}&amp;sortby={$smarty.get.sortby}{/if}{if isset($smarty.get.sorttype)}&amp;sorttype={$smarty.get.sorttype}{/if}">{$print_pages}</a>
                                            {/if}
                                        {/while}
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=cldbid&amp;sorttype={if $sortby == 'cldbid' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['dbid']}</a>
                                </th>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=unique&amp;sorttype={if $sortby == 'client_unique_identifier' AND $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['uniqueid']}</a>
                                </th>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=name&amp;sorttype={if $sortby == 'client_nickname' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['nickname']}</a>
                                </th>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=created&amp;sorttype={if $sortby == 'client_created' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['created']}</a>
                                </th>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=lastcon&amp;sorttype={if $sortby == 'client_lastconnected' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['lastonline']}</a>
                                </th>
                                <th>
                                    <a href="index.php?site=clients&amp;sid={$sid}&amp;sortby=status&amp;sorttype={if $sortby == 'clid' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['status']}</a>
                                </th>
                                <th>{$lang['option']}</th>
                            </tr>
                            {while $showclients <= $duration AND isset($clientdblist[$getstart])}
                                <tr>
                                    <td>
                                        {$clientdblist[$getstart]['cldbid']}
                                    </td>
                                    <td>{$clientdblist[{$getstart}]['client_unique_identifier']}</td>
                                    <td>{$clientdblist[{$getstart}]['client_nickname']}</td>
                                    <td>{$clientdblist[{$getstart}]['client_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                    <td>{$clientdblist[{$getstart}]['client_lastconnected']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                    <td>
                                        {if isset($clientdblist[{$getstart}]['clid'])}
                                            <span class="online">{$lang['online']}</span>
                                        {else}
                                            <span class="offline">{$lang['offline']}</span>
                                        {/if}
                                    </td>
                                    <td>
                                        <form method="post" action="index.php?site=cleditperm&amp;sid={$sid}&amp;cldbid={$clientdblist[{$getstart}]['cldbid']}" class="form-inline" style="width: auto; display: inline-block">
                                            <div class="form-group">
                                                <button class="btn btn-info btn-flat btn-sm" type="submit" name="editperms" title="{$lang['editperms']}"><i class="fa fa-eye"></i></button>
                                            </div>
                                        </form>
                                        {if !isset($permoverview['b_client_delete_dbproperties']) OR $permoverview['b_client_delete_dbproperties'] == 1}
                                            <form method="post" action="index.php?site=clients&amp;sid={$sid}" class="form-inline" style="width: auto; display: inline-block">
                                                <div class="form-group">
                                                    <input type="hidden" name="cldbid" value="{$clientdblist[{$getstart}]['cldbid']}" />
                                                    <button class="btn btn-danger btn-flat btn-sm" type="submit" class="delete" name="clientdel" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgclient']}')"><i class="fa fa-close"></i></button>
                                                </div>
                                            </form>
                                        {/if}
                                    </td>
                                </tr>
                                {assign var=getstart value="`$getstart+1`"}
                            {/while}
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    {/if}
</div>