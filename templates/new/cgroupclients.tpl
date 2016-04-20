<div class="container-fluid">
    {if isset($permoverview['b_virtualserver_channelgroup_client_list']) AND empty($permoverview['b_virtualserver_channelgroup_client_list'])}
        <div class="row">
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {$lang['nopermissions']}
            </div>
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
        <div class="row">
            <div class="col-md-4">
                <form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['searchfor']}{$lang['client']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">
                                <select class="form-control" name="searchby">
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
            <div class="col-md-4">
                <form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['addclient']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    {foreach key=key item=value from=$channellist}
                                        <option value="{$value['cid']}">{$value['channel_name']}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="cldbid" placeholder="ID" />
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="addclient">{$lang['add']}</button>
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
                        <h3 class="box-title">({$cgroupid}) {$cgroupname} {$lang['groupmember']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['channelid']}</th>
                                <th>{$lang['channelname']}</th>
                                <th>{$lang['clientdbid']}</th>
                                <th>{$lang['clientname']}</th>
                                <th>{$lang['created']}</th>
                                <th>{$lang['lastonline']}</th>
                                <th>{$lang['option']}</th>
                            </tr>
                            {if !empty($groupclients)}
                                {foreach key=key item=value from=$groupclients}
                                    <tr>
                                        <td width="10%">{$value['cid']}</td>
                                        <td width="10%">{secure($value['channel_name'])}</td>
                                        <td width="10%">{$value['cldbid']}</td>
                                        <td width="10%">{secure($value['client_nickname'])}</td>
                                        <td width="10%">{$value['client_created']}</td>
                                        <td width="10%">{$value['client_lastconnected']}</td>
                                        <td>
                                            <form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
                                                <div class="input-group">
                                                    <select class="form-control" name="cgid">
                                                        {foreach key=key2 item=value2 from=$channelgroups}
                                                            {if $value2['cgid'] != $cgroupid AND $value2['type'] != '0'}
                                                                <option value="{$value2['cgid']}">({$value2['cgid']}){$value2['name']}</option>
                                                            {/if}
                                                        {/foreach}
                                                    </select>
                                                    <div class="input-group-btn">
                                                        <button class="btn btn-default btn-flat" type="submit" name="switchgroup">{$lang['switch']}</button>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="cid" value="{$value['cid']}" />
                                                <input type="hidden" name="cldbid" value="{$value['cldbid']}" />
                                            </form>
                                        </td>
                                    </tr>
                                {/foreach}
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    {/if}
</div>