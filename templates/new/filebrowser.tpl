<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
*Copyright (C) 2012-2013  Psychokiller
*
*This program is free software; you can redistribute it and/or modify it under the terms of 
*the GNU General Public License as published by the Free Software Foundation; either 
*version 3 of the License, or any later version.
*
*This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
*without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
*See the GNU General Public License for more details.
*
*You should have received a copy of the GNU General Public License along with this program; if not, see http://www.gnu.org/licenses/. 
-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="de">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../templates/{$tmpl}/gfx/style.css" type="text/css" media="screen" />
<title>Webinterface - Filebrowser</title>
</head>
<body onload="window.resizeTo(500,600)">
<br>
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
                    <h3 class="box-title">{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']})</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <th>{$lang['name']}</th>
                            <th>{$lang['size']}</th>
                            <th>{$lang['date']}</th>
                            <th>{$lang['delete']}</th>
                        </tr>
                        {if !empty($flist)}
                            {if $smarty.get.path != "/" AND !empty($smarty.get.path)}
                                <tr>
                                    <td colspan="4"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}">..</a></td>
                                </tr>
                            {/if}
                            {foreach key=key item=value from=$flist}
                                <tr>
                                    <td>{if $value['type'] == 0} <img src='../gfx/images/folder.png' alt="" /> <a href="filebrowser.php?&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>{else}<img src='../gfx/images/file.png' alt="" /> <a href="filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>{/if}</td>
                                    <td>{$value['size']} Mb</td>
                                    <td>{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                    <td><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={$smarty.get.path}&amp;name={$value['name']}&amp;deletefile=1">{$lang['delete']}</a></td>
                                </tr>
                            {/foreach}
                        {else}
                            {if $smarty.get.path != "/" AND !empty($smarty.get.path)}
                                <tr>
                                    <td colspan="4"><a href="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;path={$newpath}">..</a></td>
                                </tr>
                            {/if}
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
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['upload']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <form enctype="multipart/form-data" method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
                            <input type="hidden" name="max_file_size" value="8388603" />
                            <input class="form-control" name="thefile" type="file" />
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-flat btn-default" type="submit" name="upload">{$lang['upload']}</button>
                        </form>
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
                        <form method="post" action="filebrowser.php?sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.pw}&amp;path={$smarty.get.path}">
                            <input placeholder="{$lang['name']}" class="form-control" type="text" name="fname"  />
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-default btn-flat" type="submit" name="createdir">{$lang['create']}</button>
                        </form>
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </div>
</div>
</body>
</html>