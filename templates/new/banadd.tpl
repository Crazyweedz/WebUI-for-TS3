<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_client_ban_create']) AND empty($permoverview['b_client_ban_create'])}
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
                <form method="post" action="index.php?site=banadd&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['addban']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['ip']}</td>
                                    <td><input class="form-control" type="text" name="banip" value="" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['name']}</td>
                                    <td><input class="form-control" type="text" name="banname" value="" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['uniqueid']}</td>
                                    <td><input class="form-control" type="text" name="banuid" value="" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['reason']}</td>
                                    <td><input class="form-control" type="text" name="reason" value="" /></td>
                                </tr>
                                <tr>
                                    <td>{$lang['bantime']}</td>
                                    <td>
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="bantime" value="" />
                                            <span class="input-group-addon">{$lang['seconds']}</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="addban">{$lang['ban']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
        </div>
    </div>
</div>