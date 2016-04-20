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
            {/if}

            <div class="col-md-6">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['chosechanclient']}</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">
                        <form method="post" action="index.php?site=chanclienteditperm&amp;sid={$sid}">
                            <input class="form-control" type="text" name="cid" placeholder="{$lang['channelid']}" /> <br>
                            <input class="form-control" type="text" name="cldbid" placeholder="{$lang['clientdbid']}" />
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="showperms">{$lang['view']}</button>
                        </form>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </div>
</div>


{if isset($smarty.post.cid) AND isset($smarty.post.cldbid)}



    <div class="box">
        <div class="box-header text-center">
            <h3 class="box-title">({$smarty.post.cid}) {$channelname} ({$smarty.post.cldbid}) {$clientname} {$lang['permissionlist']}</h3>
            <div class="box-tools">
                <form method="post" action="index.php?site=chanclienteditperm&amp;sid={$sid}" class="form-inline">
                    <label class="checkbox-inline">
                        <input type="checkbox" name="showmyperms" value="1" onchange="submit()" {if $showmyperms == 1}checked="checked"{/if} />{$lang['showgrantedonly']}
                    </label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="input-group" style="width: 150px;">
                        <input type="hidden" name="cid" value="{$smarty.post.cid}" />
                        <input type="hidden" name="cldbid" value="{$smarty.post.cldbid}" />
                        <input type="text" name="searchperms" class="form-control input-sm pull-right" placeholder="{$lang['filter']}">
                        <div class="input-group-btn">
                            <button class="btn btn-sm btn-default btn-flat" type="submit" name="search" title="{$lang['search']}"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </form>
                <form method="post" action="index.php?site=chanclienteditperm&amp;sid={$sid}">
                    <input type="hidden" name="cid" value="{$smarty.post.cid}" />
                    <input type="hidden" name="cldbid" value="{$smarty.post.cldbid}" />

                </form>
            </div>
        </div><!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
            <table class="table table-striped table-hover">
                    <tr>
                        <th>&nbsp;<a href="javascript:Klappen(0)"><img src="gfx/images/{$disp_pic}.png" id="Pic0" name="{$disp_pic}" border="0" alt="aus/ein-klappen" /></a> {$lang['showall']}</th>
                    </tr>
                </table>
                <table  class="table table-striped table-hover" cellpadding="0" cellspacing="0" style="width:100%">
                    {foreach key=key item=value from=$allperms}
                    {if $key == 0}
                        <tr>
                            <td colspan="6">
                                &nbsp;<a href="javascript:Klappen(1)"><img src="gfx/images/{$disp_pic}.png" id="Pic1" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['global']}
                            </td>
                        </tr>
                    {/if}
                    {if $key == 1}
                    <tr>
                        <td colspan="6">
                            <div style="display:{$display}" id="Lay1">
                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="5">&nbsp;
                                            <a href="javascript:Klappen(2)"><img src="gfx/images/{$disp_pic}.png" id="Pic2" border="0" alt="aus/ein-klappen" /></a>
                                            &nbsp;{$lang['information']}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay2">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 2}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="5">&nbsp;<a href="javascript:Klappen(3)"><img src="gfx/images/{$disp_pic}.png" id="Pic3" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['virtualservermanagement']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay3">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 3}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="5">&nbsp;<a href="javascript:Klappen(4)"><img src="gfx/images/{$disp_pic}.png" id="Pic4" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['administration']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay4">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 4}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td colspan="5">&nbsp;<a href="javascript:Klappen(5)"><img src="gfx/images/{$disp_pic}.png" id="Pic5" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['settings']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay5">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 5}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">&nbsp;<a href="javascript:Klappen(6)"><img src="gfx/images/{$disp_pic}.png" id="Pic6" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['virtualserver']}</td>
                    </tr>
                    <tr>
                        <td style="width:100%" colspan="6">
                            <div style="display:{$display}" id="Lay6">
                                <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style='width:60px'>&nbsp;</td>
                                        <td colspan="5">&nbsp;<a href="javascript:Klappen(7)"><img src="gfx/images/{$disp_pic}.png" id="Pic7" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay7">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 7}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(8)"><img src="gfx/images/{$disp_pic}.png" id="Pic8" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['administration']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay8">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 8}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(9)"><img src="gfx/images/{$disp_pic}.png" id="Pic9" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['settings']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay9">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 9}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class='maincat left' colspan="6">&nbsp;<a href="javascript:Klappen(10)"><img src="gfx/images/{$disp_pic}.png" id="Pic10" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['channel']}</td>
                    </tr>
                    <tr>
                        <td style="width:100%" colspan="6">
                            <div style="display:{$display}" id="Lay10">
                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th width="1%">&nbsp;</th>
                                        <th width="15%">{$lang['permid']}</th>
                                        <th width="45%">{$lang['permname']}</th>
                                        <th width="5%">{$lang['value']}</th>
                                        <th width="17%">{$lang['options']}</th>
                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                    </tr>
                                    {/if}
                                    {if $key == 10}
                                    <tr>
                                        <td class='subcat' style='width:51px'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(11)"><img src="gfx/images/{$disp_pic}.png" id="Pic11" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay11">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 11}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(12)"><img src="gfx/images/{$disp_pic}.png" id="Pic12" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['create']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay12">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 12}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(13)"><img src="gfx/images/{$disp_pic}.png" id="Pic13" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay13">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 13}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(14)"><img src="gfx/images/{$disp_pic}.png" id="Pic14" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['delete']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay14">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 14}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(15)"><img src="gfx/images/{$disp_pic}.png" id="Pic15" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['access']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay15">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 15}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr class='maincat left'>
                        <td colspan="6">&nbsp;<a href="javascript:Klappen(16)"><img src="gfx/images/{$disp_pic}.png" id="Pic16" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['group']}</td>
                    </tr>
                    <tr>
                        <td style="width:100%" colspan="6">
                            <div style="display:{$display}" id="Lay16">
                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th width="1%">&nbsp;</th>
                                        <th width="15%">{$lang['permid']}</th>
                                        <th width="45%">{$lang['permname']}</th>
                                        <th width="5%">{$lang['value']}</th>
                                        <th width="17%">{$lang['options']}</th>
                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                    </tr>
                                    {/if}
                                    {if $key == 16}
                                    <tr>
                                        <td class='subcat' style='width:51px'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(17)"><img src="gfx/images/{$disp_pic}.png" id="Pic17" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay17">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 17}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(18)"><img src="gfx/images/{$disp_pic}.png" id="Pic18" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['create']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay18">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 18}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(19)"><img src="gfx/images/{$disp_pic}.png" id="Pic19" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay19">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 19}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(20)"><img src="gfx/images/{$disp_pic}.png" id="Pic20" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['delete']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay20">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 20}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr class='maincat left'>
                        <td colspan="6">&nbsp;<a href="javascript:Klappen(21)"><img src="gfx/images/{$disp_pic}.png" id="Pic21" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['client']}</td>
                    </tr>
                    <tr>
                        <td style="width:100%" colspan="6">
                            <div style="display:{$display}" id="Lay21">
                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th width="1%">&nbsp;</th>
                                        <th width="15%">{$lang['permid']}</th>
                                        <th width="45%">{$lang['permname']}</th>
                                        <th width="5%">{$lang['value']}</th>
                                        <th width="17%">{$lang['options']}</th>
                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                    </tr>
                                    {/if}
                                    {if $key == 21}
                                    <tr>
                                        <td class='subcat' style='width:51px'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(22)"><img src="gfx/images/{$disp_pic}.png" id="Pic22" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay22">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 22}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(23)"><img src="gfx/images/{$disp_pic}.png" id="Pic23" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['admin']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay23">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 23}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(24)"><img src="gfx/images/{$disp_pic}.png" id="Pic24" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['basics']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay24">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 24}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='subcat'>&nbsp;</td>
                                        <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(25)"><img src="gfx/images/{$disp_pic}.png" id="Pic25" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <div style="display:{$display}" id="Lay25">
                                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <th width="1%">&nbsp;</th>
                                                        <th width="15%">{$lang['permid']}</th>
                                                        <th width="45%">{$lang['permname']}</th>
                                                        <th width="5%">{$lang['value']}</th>
                                                        <th width="17%">{$lang['options']}</th>
                                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                                    </tr>
                                                    {/if}
                                                    {if $key == 25}
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr class='maincat left'>
                        <td colspan="6">&nbsp;<a href="javascript:Klappen(26)"><img src="gfx/images/{$disp_pic}.png" id="Pic26" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['filetransfer']}</td>
                    </tr>
                    <tr>
                        <td style="width:100%" colspan="6">
                            <div style="display:{$display}" id="Lay26">
                                <table class="table table-striped table-hover" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <th width="1%">&nbsp;</th>
                                        <th width="15%">{$lang['permid']}</th>
                                        <th width="45%">{$lang['permname']}</th>
                                        <th width="5%">{$lang['value']}</th>
                                        <th width="17%">{$lang['options']}</th>
                                        <th width="17%">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></th>
                                    </tr>
                                    {/if}
                                    {foreach key=key2 item=value2 from=$value.permissions}
                                        {if $showmyperms == 0 AND empty($searchperms) OR $showmyperms == 1 AND $value2['available'] == 1 OR $showmyperms == 0 AND $value2['permname']|strpos:{$searchperms} !== false OR $showmyperms == 0 AND $value2['permid']|strpos:{$searchperms} !== false}
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>{$value2['permid']}</td>
                                                <td>{$value2['permname']} <br />({$value2['permdesc']})</td>
                                                <td>
                                                    {if $value2['permname']|substr:0:2 != 'i_'}
                                                        <input type='checkbox' {if $value2['permvalue'] == 1}checked="checked"{/if} name="perm[{$value2['permid']}][value]" value="1" />
                                                    {else}
                                                        <input class="form-control" {if $value2['permname'] == 'i_icon_id'}id="iconid"{/if} type='text' size="1" name="perm[{$value2['permid']}][value]" value="{$value2['permvalue']}" />
                                                        {if $value2['permname'] == 'i_icon_id'}<a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}');">{$lang['set']}</a>{/if}
                                                    {/if}
                                                </td>
                                                <td>
                                                    {if $value2['available'] == 1}
                                                        <input type='hidden' name="perm[{$value2['permid']}][available]" value='1' />
                                                        <input type='checkbox' name="perm[{$value2['permid']}][delperm]" value='1' /> {$lang['delete']}
                                                    {/if}
                                                </td>
                                                <td>
                                                    <input  class="form-control" type='text' maxlength="3" size="1" name="perm[{$value2['grantpermid']}][value]" value="{$value2['grant']}" />
                                                    <input type='hidden' name="perm[{$value2['grantpermid']}][grant]" value='1' />
                                                    {if $value2['grantav'] == 1}
                                                        <input type='hidden' name="perm[{$value2['grantpermid']}][available]" value='1' />
                                                        <input type='checkbox' name="perm[{$value2['grantpermid']}][delperm]" value='1' /> {$lang['delete']}
                                                    {/if}
                                                </td>
                                            </tr>
                                        {/if}
                                    {/foreach}
                                    {/foreach}
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <input type="hidden" name="showmyperms" value="{$showmyperms}" />
                <button type="submit" name="editall" class="btn btn-default btn-flat">{$lang['edit']}</button>
            </div>
    </form>
        </div><!-- /.box-body -->
    </div><!-- /.box -->

    <form method="post" action="index.php?site=chanclienteditperm&amp;sid={$sid}">
        <table  class="border" cellpadding="0" cellspacing="0" style="width:100%">
            <tr>
                <td class="thead" style="width:50px">&nbsp;<a href="javascript:Klappen(0)"><img src="gfx/images/{$disp_pic}.png" id="Pic0" name="{$disp_pic}" border="0" alt="aus/ein-klappen" /></a></td>
                <td class="thead" style="width:45px">{$lang['permid']}</td>
                <td class="thead" style="width:410px">{$lang['permname']}</td>
                <td class="thead" style="width:50px">{$lang['value']}</td>
                <td class="thead" style="width:101px">{$lang['options']}</td>
                <td class="thead" style="width:100px">{$lang['grant']} <input type="text" name="granttoall" size="3" maxlength="3" /></td>
            </tr>
            {foreach key=key item=value from=$allperms}
            {if $key == 0}
                <tr>
                    <td class='maincat left' colspan="6">
                        &nbsp;<a href="javascript:Klappen(1)"><img src="gfx/images/{$disp_pic}.png" id="Pic1" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['global']}
                    </td>
                </tr>
            {/if}
            {if $key == 1}
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay1">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class='subcat' style='width:60px'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(2)"><img src="gfx/images/{$disp_pic}.png" id="Pic2" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay2">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 2}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(3)"><img src="gfx/images/{$disp_pic}.png" id="Pic3" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['virtualservermanagement']}</td></tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay3">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 3}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(4)"><img src="gfx/images/{$disp_pic}.png" id="Pic4" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['administration']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay4">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 4}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(5)"><img src="gfx/images/{$disp_pic}.png" id="Pic5" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['settings']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay5">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 5}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class='maincat left' colspan="6">&nbsp;<a href="javascript:Klappen(6)"><img src="gfx/images/{$disp_pic}.png" id="Pic6" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['virtualserver']}</td>
            </tr>
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay6">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class='subcat' style='width:60px'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(7)"><img src="gfx/images/{$disp_pic}.png" id="Pic7" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay7">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 7}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(8)"><img src="gfx/images/{$disp_pic}.png" id="Pic8" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['administration']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay8">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 8}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(9)"><img src="gfx/images/{$disp_pic}.png" id="Pic9" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['settings']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay9">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 9}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td class='maincat left' colspan="6">&nbsp;<a href="javascript:Klappen(10)"><img src="gfx/images/{$disp_pic}.png" id="Pic10" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['channel']}</td>
            </tr>
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay10">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            {/if}
                            {if $key == 10}
                            <tr>
                                <td class='subcat' style='width:51px'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(11)"><img src="gfx/images/{$disp_pic}.png" id="Pic11" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay11">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 11}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(12)"><img src="gfx/images/{$disp_pic}.png" id="Pic12" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['create']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay12">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 12}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(13)"><img src="gfx/images/{$disp_pic}.png" id="Pic13" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay13">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 13}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(14)"><img src="gfx/images/{$disp_pic}.png" id="Pic14" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['delete']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay14">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 14}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(15)"><img src="gfx/images/{$disp_pic}.png" id="Pic15" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['access']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay15">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 15}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr class='maincat left'>
                <td colspan="6">&nbsp;<a href="javascript:Klappen(16)"><img src="gfx/images/{$disp_pic}.png" id="Pic16" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['group']}</td>
            </tr>
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay16">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            {/if}
                            {if $key == 16}
                            <tr>
                                <td class='subcat' style='width:51px'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(17)"><img src="gfx/images/{$disp_pic}.png" id="Pic17" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay17">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 17}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(18)"><img src="gfx/images/{$disp_pic}.png" id="Pic18" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['create']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay18">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 18}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(19)"><img src="gfx/images/{$disp_pic}.png" id="Pic19" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay19">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 19}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(20)"><img src="gfx/images/{$disp_pic}.png" id="Pic20" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['delete']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay20">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 20}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr class='maincat left'>
                <td colspan="6">&nbsp;<a href="javascript:Klappen(21)"><img src="gfx/images/{$disp_pic}.png" id="Pic21" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['client']}</td>
            </tr>
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay21">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            {/if}
                            {if $key == 21}
                            <tr>
                                <td class='subcat' style='width:51px'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(22)"><img src="gfx/images/{$disp_pic}.png" id="Pic22" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['information']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay22">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 22}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(23)"><img src="gfx/images/{$disp_pic}.png" id="Pic23" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['admin']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay23">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 23}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(24)"><img src="gfx/images/{$disp_pic}.png" id="Pic24" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['basics']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay24">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 24}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class='subcat'>&nbsp;</td>
                                <td class='subcat' colspan="5">&nbsp;<a href="javascript:Klappen(25)"><img src="gfx/images/{$disp_pic}.png" id="Pic25" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['modify']}</td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <div style="display:{$display}" id="Lay25">
                                        <table style="width:100%;border-collapse:collapse;border:0" cellpadding="0" cellspacing="0">
                                            {/if}
                                            {if $key == 25}
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr class='maincat left'>
                <td colspan="6">&nbsp;<a href="javascript:Klappen(26)"><img src="gfx/images/{$disp_pic}.png" id="Pic26" border="0" alt="aus/ein-klappen" /></a>&nbsp;{$lang['filetransfer']}</td></tr>
            <tr>
                <td style="width:100%" colspan="6">
                    <div style="display:{$display}" id="Lay26">
                        <table style="width:100%;border-collapse:collapse;" cellpadding="0" cellspacing="0">
                            {/if}
                            {foreach key=key2 item=value2 from=$value.permissions}
                                {if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
                                {if $showmyperms == 0 AND empty($searchperms) OR $showmyperms == 1 AND $value2['available'] == 1 OR $showmyperms == 0 AND $value2['permname']|strpos:{$searchperms} !== false OR $showmyperms == 0 AND $value2['permid']|strpos:{$searchperms} !== false}
                                    <tr>
                                        <td class="{$td_col}" style="width:50px">&nbsp;</td>
                                        <td class="{$td_col}" style="width:45px">{$value2['permid']}</td>
                                        <td class="{$td_col}" style="width:410px">{$value2['permname']} <br />({$value2['permdesc']})</td>
                                        <td class="{$td_col}" style="width:50px">
                                            {if $value2['permname']|substr:0:2 != 'i_'}
                                                <input type='checkbox' {if $value2['permvalue'] == 1}checked="checked"{/if} name="perm[{$value2['permid']}][value]" value="1" />
                                            {else}
                                                <input {if $value2['permname'] == 'i_icon_id'}id="iconid"{/if} type='text' size="1" name="perm[{$value2['permid']}][value]" value="{$value2['permvalue']}" />
                                                {if $value2['permname'] == 'i_icon_id'}<a href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}');">{$lang['set']}</a>{/if}
                                            {/if}
                                        </td>
                                        <td class="{$td_col}" style="width:100px">
                                            {if $value2['available'] == 1}
                                                <input type='hidden' name="perm[{$value2['permid']}][available]" value='1' />
                                                <input type='checkbox' name="perm[{$value2['permid']}][delperm]" value='1' /> {$lang['delete']}
                                            {/if}
                                        </td>
                                        <td class="{$td_col}" style="width:100px">
                                            <input type='text' maxlength="3" size="1" name="perm[{$value2['grantpermid']}][value]" value="{$value2['grant']}" />
                                            <input type='hidden' name="perm[{$value2['grantpermid']}][grant]" value='1' />
                                            {if $value2['grantav'] == 1}
                                                <input type='hidden' name="perm[{$value2['grantpermid']}][available]" value='1' />
                                                <input type='checkbox' name="perm[{$value2['grantpermid']}][delperm]" value='1' /> {$lang['delete']}
                                            {/if}
                                        </td>
                                    </tr>
                                    {assign var=change_col value="`$change_col+1`"}
                                {/if}
                            {/foreach}
                            {/foreach}
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="6" class="center">
                    <input type="hidden" name="cid" value="{$smarty.post.cid}" />
                    <input type="hidden" name="cldbid" value="{$smarty.post.cldbid}" />
                    <input type="hidden" name="showmyperms" value="{$showmyperms}" />
                    <input type="submit" name="editall" value="{$lang['edit']}" />
                </td>
            </tr>
        </table>
    </form>
{/if}