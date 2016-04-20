<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_servergroup_client_list']) AND empty($permoverview['b_virtualserver_servergroup_client_list'])}
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
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['searchfor']} {$lang['client']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label sr-only"></label>
                            <div class="col-sm-12">
                                <select class="form-control" name="searchby">
                                    <option value="cldbid">{$lang['cldbid']}</option>
                                    <option value="name">{$lang['name']}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label sr-only"></label>
                            <div class="col-sm-12">
                                <input class="form-control" type="text" name="search"/>
                            </div>
                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" name="sendsearch" class="btn btn-default btn-flat">{$lang['search']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <div class="col-md-3">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['addclient']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form class="form-horizontal" method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label sr-only"></label>
                            <div class="col-sm-12">
                                <input class="form-control" type="text" name="cldbid" placeholder="{$lang['cldbid']}" />
                            </div>
                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button class="btn btn-flat btn-default" type="submit" name="addclient">{$lang['add']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">({$sgroupid}) {$sgroupname} {$lang['groupmember']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>{$lang['uniqueid']}</th>
                            <th>{$lang['dbid']}</th>
                            <th>{$lang['name']}</th>
                            <th>{$lang['created']}</th>
                            <th>{$lang['lastonline']}</th>
                            <th>{$lang['option']}</th>
                        </tr>
                        {if !empty($groupclients)}
                            {foreach key=key item=value from=$groupclients}
                                <tr>
                                    <td>{$value['client_unique_identifier']}</td>
                                    <td>{$value['cldbid']}</td>
                                    <td>{secure($value['client_nickname'])}</td>
                                    <td>{date("d.m.Y", $value['client_created'])}</td>
                                    <td>{date("d.m.Y", $value['client_lastconnected'])}</td>
                                    <td>
                                        <form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}" class="form-inline">
                                            <input type="hidden" name="cldbid" value="{$value['cldbid']}" />
                                            <button class="btn btn-danger btn-flat btn-sm" type="submit" name="kickclient" title="kick"><i class="fa fa-close"></i></button>
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
        {/if}
    </div>
</div>