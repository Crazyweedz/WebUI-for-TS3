<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_servergroup_create']) AND empty($permoverview['b_virtualserver_servergroup_create'])}
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
                <form method="post" action="index.php?site=sgroupadd&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['addservergroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['type']}</td>
                                    <td>
                                        <label class="radio-inline">
                                            <input type="radio" name="type" value="0" /> {$lang['template']}
                                        </label>
                                        <label class="radio-inline">
                                            <input checked="checked" type="radio" name="type" value="1" /> {$lang['normal']}
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="type" value="2" /> {$lang['query']}
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['name']}</td>
                                    <td>
                                        <input class="form-control" type="text" name="name" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['copypermsfrom']}</td>
                                    <td>
                                        <select class="form-control" name="copyfrom">
                                            <option value="0">-</option>
                                            {foreach key=key item=value from=$servergroups}
                                                <option value="{$value['sgid']}">{$value['name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['overwritegroup']}</td>
                                    <td>
                                        <select class="form-control" name="overwrite">
                                            <option value="0">-</option>
                                            {foreach key=key item=value from=$servergroups}
                                                <option value="{$value['sgid']}">{$value['name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="addgroup">{$lang['add']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
        </div>
    </div>
</div>