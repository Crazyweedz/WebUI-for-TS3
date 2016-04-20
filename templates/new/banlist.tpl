<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_client_ban_list']) AND empty($permoverview['b_client_ban_list'])}
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
                <div class="alert alert-warning alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Vous n'êtes pas obligé de remplir les 3 premiers champs. Seulement 1 des 3 suffit !</p>
                </div>
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['banlist']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['banid']}</th>
                                <th>{$lang['ip']}/{$lang['name']}/{$lang['uniqueid']}</th>
                                <th>{$lang['created']}</th>
                                <th>{$lang['invokername']}</th>
                                <th>{$lang['invokeruid']}</th>
                                <th>{$lang['reason']}</th>
                                <th>{$lang['length']}</th>
                                <th>{$lang['enforcement']}</th>
                                <th>{$lang['option']}</th>
                            </tr>
                            {if !empty($banlist)}
                                {foreach key=key item=value from=$banlist}
                                    <tr>
                                        <td>{$value['banid']}</td>
                                        <td>{$value['ip']}{$value['name']}{$value['uid']}</td>
                                        <td>{$value['created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                        <td>{secure($value['invokername'])}</td>
                                        <td>{$value['invokeruid']}</td>
                                        <td>{$value['reason']}</td>
                                        <td>{if isset($value['duration'])} {$value['duration']}{else}0{/if}</td>
                                        <td>{$value['enforcement']}</td>
                                        <td>
                                            {if !isset($permoverview['b_client_ban_delete']) OR $permoverview['b_client_ban_delete'] == 1}
                                                <form method="post" action="index.php?site=banlist&amp;sid={$sid}">
                                                    <input type="hidden" name="banid" value="{$value['banid']}" />
                                                    <button class="btn btn-danger btn-flat btn-sm" type="submit" name="unban"><i class="fa fa-close"></i></button>
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