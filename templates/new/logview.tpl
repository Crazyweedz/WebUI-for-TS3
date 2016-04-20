<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_log_view']) AND empty($permoverview['b_virtualserver_log_view'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['error']}
                </div>
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                <div class="box">
                    <div class="box-header">
                        <form method="post" action="index.php?site=logview&amp;sid={$sid}">
                            <input type="hidden" name="begin_pos" value="{$begin_pos}"/>
                            <button type="submit" name="showmore" class="btn btn-default btn-flat">{$lang['showmoreentrys']}</button>
                        </form>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['date']}</th>
                                <th>{$lang['level']}</th>
                                <th>{$lang['type']}</th>
                                <th>{$lang['serverid']}</th>
                                <th>{$lang['message']}</th>
                            </tr>
                            {if !empty($serverlog)}
                                {foreach key=key item=value from=$serverlog}
                                    {if empty($smarty.post.type.error) AND empty($smarty.post.type.warning) AND empty($smarty.post.type.debug) AND empty($smarty.post.type.info) OR $smarty.post.type.error == $value['level'] OR $smarty.post.type.warning == $value['level'] OR $smarty.post.type.debug == $value['level'] OR $smarty.post.type.info == $value['level']}
                                        <tr>
                                            <td>{$value[0]}</td>
                                            <td>{$value[1]}</td>
                                            <td>{$value[2]}</td>
                                            <td>{$value[3]}</td>
                                            <td>{$value[4]}</td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <form method="post" action="index.php?site=logview&amp;sid={$sid}">
                            <input type="hidden" name="begin_pos" value="{$begin_pos}"/>
                            <button type="submit" name="showmore" class="btn btn-default btn-flat">{$lang['showmoreentrys']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>