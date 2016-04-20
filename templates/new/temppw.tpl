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
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['temppw']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>Nickname</th>
                            <th>Uid</th>
                            <th>Desc</th>
                            <th>Password</th>
                            <th>Start</th>
                            <th>End</th>
                            <th>Channel</th>
                            <th>Option</th>
                        </tr>
                        {if !empty($temppwlist)}
                            {foreach key=id item=temppw from=$temppwlist}
                                <tr>
                                    <td>{$temppw.nickname}</td>
                                    <td>{$temppw.uid}</td>
                                    <td>{$temppw.desc}</td>
                                    <td>{$temppw.pw_clear}</td>
                                    <td>{$temppw.start|date_format:"%B %d, %H:%M:%S"}</td>
                                    <td>{$temppw.end|date_format:"%B %d, %H:%M:%S"}</td>
                                    <td>{$temppw.tcid}</td>
                                    <td>
                                        <form method="post" action="index.php?site=temppw&amp;sid={$sid}">
                                            <input name="pw" value="{$temppw.pw_clear}" type="hidden">
                                            <button class="btn btn-danger btn-flat btn-sm" name="temppwdel" value="" title="{$lang['delete']}" type="submit"><i class="fa fa-close"></i></button>
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
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['create']} {$lang['temppw']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form class="form-horizontal" method="post" action="index.php?site=temppw&amp;sid={$sid}">
                        <!-- Password input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="passwordinput">Password Input</label>
                            <div class="col-md-12">
                                <input id="passwordinput" name="password" type="text" placeholder="{$lang['password']}" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="textinput">Text Input</label>
                            <div class="col-md-12">
                                <div class="input-group">
                                    <input id="textinput" name="duration" type="text" placeholder="{$lang['duration']}" class="form-control input-md">
                                    <span class="input-group-addon">{$lang['seconds']}</span>
                                </div>
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="textinput">Text Input</label>
                            <div class="col-md-12">
                                <input id="textinput" name="description" type="text" placeholder="{$lang['description']}" class="form-control input-md">
                            </div>
                        </div>
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="selectbasic">Select Basic</label>
                            <div class="col-md-12">
                                <select id="selectbasic" name="tcid" class="form-control">
                                    {foreach key=id item=channel from=$channellist}
                                        <option value="{$channel.cid}">{$channel.channel_name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" name="create" class="btn btn-default btn-flat">{$lang['create']}</button>
                    </form>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>