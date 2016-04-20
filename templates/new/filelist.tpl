<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['upload']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form class="form-horizontal" enctype="multipart/form-data" method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="selectbasic">{$lang['channel']}</label>
                            <div class="col-md-12">
                                {if empty($smarty.get.cid)}
                                    <select id="selectbasic" name="cid" class="form-control">
                                        {foreach key=key item=value from=$channellist}
                                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                                        {/foreach}
                                    </select>
                                {/if}
                            </div>
                        </div>
                        <!-- ile Button -->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="filebutton">{$lang['upload']}</label>
                            <div class="col-md-12">
                                <input type="hidden" name="max_file_size" value="8388603" />
                                <input id="filebutton" name="thefile" class="input-file form-control" type="file">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button id="singlebutton" type="submit" name="upload" class="btn btn-default btn-flat">{$lang['upload']}</button>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <div class="col-md-6">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['createfolder']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form class="form-horizontal" method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="selectbasic">{$lang['channel']}</label>
                            <div class="col-md-12">
                                {if empty($smarty.get.cid)}
                                    <select id="selectbasic" name="cid" class="form-control">
                                        {foreach key=key item=value from=$channellist}
                                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                                        {/foreach}
                                    </select>
                                {/if}
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label sr-only" for="textinput">{$lang['name']}</label>
                            <div class="col-md-12">
                                <input id="textinput" name="fname" type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button id="singlebutton" name="createdir" class="btn btn-default btn-flat">{$lang['create']}</button>
                </div>
            </div>
            <!-- /.box -->
        </div>
    </div>
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
                    <h3 class="box-title">{if !empty($smarty.get.cid)}{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']}){else}{$lang['filelist']}{/if}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>{$lang['name']}</th>
                            <th>{$lang['size']}</th>
                            <th>{$lang['date']}</th>
                            <th>{$lang['channel']}</th>
                            <th>{$lang['delete']}</th>
                        </tr>
                        {if $smarty.get.path != "/" AND !empty($smarty.get.path)}
                            <tr>
                                <td colspan="3"><a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$cid}&amp;path={$newpath}">..</a></td>
                            </tr>
                        {/if}
                        {if !empty($getallfiles)}
                            {foreach key=key item=value from=$getallfiles}
                                {if $key !== 'totalsize'}
                                    <tr>
                                        <td>{if $value['type'] == 0} <img src='gfx/images/folder.png' alt="" /> <a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>{else}<img src='gfx/images/file.png' alt="" /> <a href="site/filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>{/if}</td>
                                        <td>{$value['size']} Mb</td>
                                        <td>{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                        <td>{$value['cname']}</td>
                                        <td><a href="index.php?site=filelist&amp;sid={$sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if empty($smarty.get.path)}/{else}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;deletefile=1">{$lang['delete']}</a></td>
                                    </tr>
                                {elseif $key === 'totalsize'}
                                    <tr>
                                        <td>{$lang['totalsize']}</td>
                                        <td colspan="4">{$value} Mb</td>
                                    </tr>
                                {/if}
                            {/foreach}
                        {else}
                            <tr>
                                <td colspan="4">
                                    {$lang['nofilesfound']}
                                </td>
                            </tr>
                        {/if}
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>