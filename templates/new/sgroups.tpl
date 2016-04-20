<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_servergroup_list']) AND empty($permoverview['b_virtualserver_servergroup_list'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                {if !empty($error) OR !empty($noerror)}
                    {if !empty($error)}
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            {$error}
                        </div>
                    {/if}
                    {if !empty($noerror)}
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                            {$noerror}
                        </div>
                    {/if}
                {/if}
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">{$lang['servergroups']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="3%">{$lang['id']}</td>
                                <td width="60%">{$lang['name']}</td>
                                <td width="8%">{$lang['type']}</td>
                                <td width="8%">{$lang['iconid']}</td>
                                <td width="8%">{$lang['savedb']}</td>
                                <td width="13%">{$lang['options']}</td>
                            </tr>
                            {if !empty($servergroups)}
                                {foreach key=key item=value from=$servergroups}
                                    <tr>
                                        <td>{$value['sgid']}</td>
                                        <td>
                                            <form method="post"
                                                  action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}">
                                                <div class="input-group">
                                                    <input class="form-control" type="text" name="name"
                                                           value="{$value['name']}"/>
                                        <span class="input-group-btn">
                                        <button class="btn btn-default btn-flat" type="submit"
                                                name="sendname">{$lang['rename']}</button>
                                        </span>
                                                </div>
                                            </form>
                                        </td>
                                        <td>{$value['type']}</td>
                                        <td>{sprintf('%u', $value['iconid'] & 0xffffffff)}</td>
                                        <td>{$value['savedb']}</td>
                                        <td>
                                            {if $value['type'] != '0'}
                                                <form method="post"
                                                      action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$value['sgid']}"
                                                      class="form-inline" style="width: auto; display: inline-block">
                                                    <button type="submit" class="btn btn-info btn-flat btn-sm"
                                                            name="groupclients" title="{$lang['clients']}"><i
                                                                class="fa fa-users"></i></button>
                                                </form>
                                            {/if}
                                            <form method="post"
                                                  action="index.php?site=sgroupeditperm&amp;sid={$sid}&amp;sgid={$value['sgid']}"
                                                  class="form-inline" style="width: auto; display: inline-block">
                                                <button type="submit" class="btn btn-flat btn-sm bg-purple"
                                                        name="permedit" title="{$lang['editperms']}"><i
                                                            class="fa fa-edit"></i></button>
                                            </form>
                                            {if !isset($permoverview['b_virtualserver_servergroup_delete']) or $permoverview['b_virtualserver_servergroup_delete'] == 1}
                                                <form method="post"
                                                      action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}"
                                                      class="form-inline" style="width: auto; display: inline-block">
                                                    <button class="btn btn-danger btn-flat btn-sm" type="submit"
                                                            name="delgroup" title="{$lang['delete']}"
                                                            onclick="return confirm('{$lang['deletemsgservergroup']}')">
                                                        <i class="fa fa-close"></i></button>
                                                </form>
                                            {/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>