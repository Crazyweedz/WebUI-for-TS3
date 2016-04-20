<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
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
            <form method="post" action="index.php?site=clientcleaner&amp;sid={$sid}">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['clientcleaner']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-striped table-hover">
                            {if isset($deleted)}
                                <tr>
                                    <td colspan="2">{$deleted}</td>
                                </tr>
                            {/if}
                            <tr>
                                <td width="45%">{$lang['deleteallclientsoffline']}</td>
                                <td>
                                    <div class="input-group">
                                        <input class="form-control" type="text" name="number" value="30" size="3"/>
                                        <span class="input-group-addon">{$lang['deleteallclientsoffline2']}</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['checkgroupsprotected']}</td>
                                <td>
                                    {foreach key=key item=value from=$sgrouplist}
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="sgroups[]" value="{$value.sgid}" /> {$value.name}
                                        </label>
                                    {/foreach}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-default btn-flat" type="submit" name="cleanit">{$lang['clean']}</button>
                    </div>
                </div>
                <!-- /.box -->
            </form>
        </div>
    </div>
</div>