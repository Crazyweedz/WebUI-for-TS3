<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if !empty($error)}
                {if !empty($error)}
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {$error}
                    </div>
                {/if}
            {/if}
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {$lang['permexdesc']}
            </div>
            <form method="post" action="index.php?site=permexport&amp;sid={$sid}">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['permexport']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="50%">{$lang['sourcetype']}</td>
                                <td>
                                    <select class="form-control" name="sourcemode">
                                        <option value="1">{$lang['servergroup']}</option>
                                        <option value="2">{$lang['channelgroup']}</option>
                                        <option value="3">{$lang['channel']}</option>
                                        <option value="4">{$lang['client']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['sourceid']}</td>
                                <td><input class="form-control" type="text" name="sourceid" value="" /></td>
                            </tr>
                            <tr>
                                <td>{$lang['targettype']}</td>
                                <td>
                                    <select class="form-control" name="targetmode">
                                        <option value="1">{$lang['servergroup']}</option>
                                        <option value="2">{$lang['channelgroup']}</option>
                                        <option value="3">{$lang['channel']}</option>
                                        <option value="4">{$lang['client']}</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['targetid']}</td>
                                <td><input class="form-control" type="text" name="targetid" value="" /></td>
                            </tr>
                            {if isset($smarty.post.showcommands) AND empty($error)}
                                <tr>
                                    <td colspan="2">
                                        <textarea class="form-control"  name="showfield" cols="50" rows="10" readonly="readonly">{$permexport}</textarea>
                                    </td>
                                </tr>
                            {/if}
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-default btn-flat" type="submit" name="showcommands">{$lang['view']}</button>
                    </div>
                </div>
                <!-- /.box -->
            </form>
        </div>
    </div>
</div>