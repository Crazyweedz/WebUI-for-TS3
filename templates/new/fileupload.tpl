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
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {$lang['iconupinfo']}
            </div>
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['iconupload']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <form class="form-horizontal" enctype="multipart/form-data" action="index.php?site=fileupload&amp;sid={$sid}" method="post">
                        <div class="form-group">
                            <label class="col-md-2 control-label" for="thefile">{$lang['iconupload']}:</label>
                            <div class="col-md-10">
                                <input type="hidden" name="max_file_size" value="81920" />
                                <input id="thefile" name="thefile" class="input-file" type="file">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label sr-only" for="singlebutton">Single Button</label>
                            <div class="col-md-10">
                                <button type="submit" id="singlebutton" name="upload" class="btn btn-default btn-flat">{$lang['iconupload']}</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title"></h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <form method="post" action="index.php?site=fileupload&amp;sid={$sid}">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$lang['icon']}</th>
                                <th>{$lang['name']}</th>
                                <th>{$lang['id']}</th>
                                <th>Ma&szlig;e</th>
                                <th>Type</th>
                                <th>{$lang['delete']} {$lang['selectall']}<input type="checkbox" name="checkall" value="0" onclick="check(2)" /></th>
                            </tr>
                            {foreach key=key item=value from=$allicons}
                                <tr>
                                    <td><img style="border:0"src="site/showfile.php?name=icon_{$value.name}&amp;port={$port}" alt="" /></td>
                                    <td>{$key}</td>
                                    <td>{$value.id}</td>
                                    <td>{$value.info.0}*{$value.info.1}</td>
                                    <td>
                                        {if $value.info.2 == 1}
                                            .gif
                                        {elseif $value.info.2 == 2}
                                            .jpg
                                        {elseif $value.info.2 == 3}
                                            .png
                                        {/if}
                                    </td>
                                    <td><input type="checkbox" id="list{$value['virtualserver_id']}" name="delicons[]" value="/{$key}" /></td>
                                </tr>
                            {/foreach}
                        </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" name="delaction" class="btn btn-default btn-flat">{$lang['delete']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>