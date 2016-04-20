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
<title>Webinterface - Interactive</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <br>
            {if !isset($smarty.get.clid)}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['massaction']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <form method="post" name="f2" action="interactive.php?sid={$smarty.get.sid}">
                            <select class="form-control" name="action" onchange="this.form.submit()">
                                <option value="">{$lang['select']}</option>
                                <option value="kick">{$lang['kick']}</option>
                                <option value="ban">{$lang['ban']}</option>
                                <option value="move">{$lang['move']}</option>
                            </select>
                        </form>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            {if $smarty.post.action == 'move'}
                <script type="text/javascript">
                    //<![CDATA[
                    window.resizeTo(350,550);
                    //]]>
                </script>
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['massmover']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['moveallclients']}</td>
                                    <td><input type="checkbox" name="moveall" value="1" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['moveclientsbysgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$servergrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td>
                                                <input type="checkbox" name="movebysgroup[]" value="{$value['sgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['moveclientsbycgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$channelgrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td><input type="checkbox" name="movebycgroup[]" value="{$value['cgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                                <tr>
                                    <td width="50%">{$lang['movefrom']}</td>
                                    <td>
                                        <select class="form-control" name="movebycid[]" size="3" multiple="multiple">
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="green1">{$lang['moveto']}:</td>
                                    <td class="green1">
                                        <select class="form-control" name="cid">
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="sendmassmove">{$lang['move']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if $smarty.post.action == 'kick'}
                <script type="text/javascript">
                    //<![CDATA[
                    window.resizeTo(350,550);
                    //]]>
                </script>
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['masskicker']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['kickallclients']}</td>
                                    <td><input type="checkbox" name="kickall" value="1" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['kickclientsbysgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$servergrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td>
                                                <input type="checkbox" name="kickbysgroup[]" value="{$value['sgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['kickclientsbycgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$channelgrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td>
                                                <input type="checkbox" name="kickbycgroup[]" value="{$value['cgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                                <tr>
                                    <td>{$lang['kickfrom']}</td>
                                    <td>
                                        <select class="form-control" name="kickbycid[]" size="3" multiple="multiple">
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['kickmsg']}:</td>
                                    <td><input class="form-control" type="text" name="kickmsg" value="" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" name="sendmasskick" value="" onclick="self.close()" class="btn btn-default btn-flat">{$lang['kick']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if $smarty.post.action == 'ban'}
                <script type="text/javascript">
                    //<![CDATA[
                    window.resizeTo(350,550);
                    //]]>
                </script>
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['massban']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['banallclients']}</td>
                                    <td><input type="checkbox" name="banall" value="1" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box" style="margin-bottom: 0">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['banclientsbysgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$servergrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td>
                                                <input type="checkbox" name="banbysgroup[]" value="{$value['sgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['banclientsbycgroup']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                {foreach key=key item=value from=$channelgrouplist}
                                    {if $value['type']!=0}
                                        <tr>
                                            <td width="50%">{$value['name']}</td>
                                            <td>
                                                <input type="checkbox" name="banbycgroup[]" value="{$value['cgid']}" />
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                                <tr>
                                    <td>{$lang['banfrom']}</td>
                                    <td>
                                        <select class="form-control" name="banbycid[]" size="3" multiple="multiple">
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['banmsg']}</td>
                                    <td><input class="form-control" type="text" name="banmsg" value=""></td>
                                </tr>
                                <tr>
                                    <td>{$lang['bantime']}</td>
                                    <td>
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="bantime" value="">
                                            <span class="input-group-addon">{$lang['seconds']}</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="sendmassban" value="" onclick="self.close()">{$lang['ban']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {else}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$smarty.get.nick}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <form method="post" name="f2" action="interactive.php?sid={$smarty.get.sid}&amp;clid={$smarty.get.clid}&amp;nick={$smarty.get.nick}">
                            <select class="form-control" name="action" onchange="this.form.submit()">
                                <option value="">{$lang['select']}</option>
                                <option value="kick">{$lang['kick']}</option>
                                <option value="ban">{$lang['ban']}</option>
                                <option value="poke">{$lang['poke']}</option>
                                <option value="move">{$lang['move']}</option>
                            </select>
                        </form>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            {if $smarty.post.action == 'kick'}
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}" onsubmit="window.close()">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">{$lang['kick']} {$smarty.get.nick}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['kickmsg']}</td>
                                    <td><input class="form-control" type="text" name="kickmsg" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <input type="hidden" name="clid" value="{$smarty.get.clid}" />
                            <button class="btn btn-default btn-flat" type="submit" name="sendkick" onclick="self.close()">{$lang['kick']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if $smarty.post.action == 'ban'}
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['ban']} {$smarty.get.nick}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['banmsg']}</td>
                                    <td>
                                        <input class="form-control" type="text" name="banmsg" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['bantime']}</td>
                                    <td>
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="bantime" value="">
                                            <span class="input-group-addon">{$lang['seconds']}</span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <input type="hidden" name="clid" value="{$smarty.get.clid}" />
                            <button class="btn btn-default btn-flat" type="submit" name="sendban" onclick="self.close()">{$lang['ban']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if $smarty.post.action == 'poke'}
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['poke']} {$smarty.get.nick}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['pokemsg']}</td>
                                    <td>
                                        <input class="form-control" type="text" name="pokemsg">
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <input type="hidden" name="clid" value="{$smarty.get.clid}" />
                            <button type="submit" name="sendpoke" onclick="self.close()" class="btn btn-default btn-flat">{$lang['poke']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if $smarty.post.action=='move'}
                <form method="post" name="f1" target="opener" action="../index.php?site=serverview&amp;sid={$smarty.get.sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['move']} {$_GET['nick']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td>{$lang['move']}</td>
                                    <td>
                                        <select class="form-control" name="cid">
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                                ";
                                            {/foreach}
                                        </select>
                                    </td>
                                <tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <input type="hidden" name="clid" value="{$smarty.get.clid}" />
                            <button class="btn btn-default btn-flat" type="submit" name="sendmove" onclick="self.close()">{$lang['move']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {/if}
        </div>
    </div>
</div>
</body>
</html>