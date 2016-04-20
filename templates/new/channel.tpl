<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_channel_list']) AND empty($permoverview['b_virtualserver_channel_list'])}
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
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['channel']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <td>{$lang['id']}</td>
                            <td>{$lang['pid']}</td>
                            <td>{$lang['name']}</td>
                            <td>{$lang['option']}</td>
                        </tr>
                        {if !empty($channellist)}
                            {foreach key=key item=value from=$channellist}
                                <tr>
                                    <td>{$value['cid']}</td>
                                    <td>{$value['pid']}</td>
                                    <td>{$value['channel_name']}</td>
                                    <td>
                                        <form method="post" action="index.php?site=channelview&amp;sid={$sid}&amp;cid={$value['cid']}" class="form-inline" style="width: auto; display: inline-block">
                                            <div class="form-group">
                                                <button type="submit" name="select" title="{$lang['select']}" class="btn btn-info btn-flat btn-sm"><i class="fa fa-eye"></i></button>
                                            </div>
                                        </form>
                                        <form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$value['cid']}" class="form-inline" style="width: auto; display: inline-block">
                                            <div class="form-group">
                                                <button type="submit" name="editperms" title="{$lang['editchannel']}" class="btn bg-maroon btn-flat btn-sm"><i class="fa fa-pencil"></i></button>
                                            </div>
                                        </form>
                                        <form method="post" action="index.php?site=channeleditperm&amp;sid={$sid}&amp;cid={$value['cid']}" class="form-inline" style="width: auto; display: inline-block">
                                            <div class="form-group">
                                                <button type="submit" name="editperms" title="{$lang['editperms']}" class="btn bg-purple btn-flat btn-sm"><i class="fa fa-edit"></i></button>
                                            </div>
                                        </form>
                                        <form method="post" action="index.php?site=channel&amp;sid={$sid}" class="form-inline" style="width: auto; display: inline-block">
                                            <input type="hidden" name="cid" value="{$value['cid']}" />
                                            {if $value['total_clients'] > 0}
                                                <input type="hidden" name="force" value="1" />
                                            {/if}
                                            {if !isset($permoverview['b_channel_delete_permanent']) AND $value['channel_flag_permanent'] == 1 OR $permoverview['b_channel_delete_permanent'] == 1 AND $value['channel_flag_permanent'] == 1}
                                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                                    <div class="form-group">
                                                        <button type="submit" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" class="btn btn-danger btn-flat btn-sm"><i class="fa fa-close"></i></button>
                                                    </div>
                                                {/if}
                                            {/if}
                                            {if !isset($permoverview['b_channel_delete_semi_permanent']) AND $value['channel_flag_semi_permanent'] == 1 OR $permoverview['b_channel_delete_semi_permanent'] == 1 AND $value['channel_flag_semi_permanent'] == 1}
                                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                                    <div class="form-group">
                                                        <button type="submit" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" class="btn btn-danger btn-flat btn-sm"><i class="fa fa-close"></i></button>
                                                    </div>
                                                {/if}
                                            {/if}
                                            {if !isset($permoverview['b_channel_delete_temporary']) AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0 OR $permoverview['b_channel_delete_temporary'] == 1 AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0}
                                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                                    <div class="form-group">
                                                        <button type="submit" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')" class="btn btn-danger btn-flat btn-sm"><i class="fa fa-close"></i></button>
                                                    </div>
                                                {/if}
                                            {/if}
                                        </form>
                                    </td>
                                </tr>
                            {/foreach}
                        {/if}
                    </table>
                    {/if}
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>