<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_client_complain_list']) AND empty($permoverview['b_client_complain_list'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['complainlist']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th width="15%">{$lang['targetnick']}</th>
                                <th width="30%">{$lang['sourcenick']}</th>
                                <th width="30%">{$lang['reason']}</th>
                                <th width="25%">{$lang['option']}</th>
                            </tr>
                            {assign var=i value="1"}
                            {foreach key=key item=value from=$newcomplainlist}
                                {foreach key=key2 item=value2 from=$value}
                                    <tr>
                                        <td><a href="javascript:Klappen('{$i}')"><img src="gfx/images/plus.png" id="Pic{$i}" border="0" alt="aus/ein-klappen" /></a> {$key2}</td>
                                        <td>&nbsp;</td>
                                        <td>{sprintf($lang['countcomplain'], count($value2))}</td>
                                        <td>
                                            {if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
                                                <form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
                                                    <input type="hidden" name="tcldbid" value="{$key}" />
                                                    <button class="btn btn-danger btn-flat" type="submit" name="delall" value="" title="{$lang['delall']}"><i class="fa fa-close"></i></button>
                                                </form>
                                            {/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="green1" colspan="4">
                                            <table class="table table-striped table-hover" id="Lay{$i}" cellpadding="0" cellspacing="0">
                                                {foreach key=key3 item=value3 from=$value2}
                                                    <tr>
                                                        <td width="15%">&nbsp;{date("d.m.Y - H:i", $value3['timestamp'])}</td>
                                                        <td width="30%">{secure($value3['fname'])}</td>
                                                        <td width="30%">{secure($value3['message'])}</td>
                                                        <td width="25%">
                                                            {if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
                                                                <form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
                                                                    <input type="hidden" name="tcldbid" value="{$key}" />
                                                                    <input type="hidden" name="fcldbid" value="{$key3}" />
                                                                    <button class="btn btn-danger btn-flat" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-close"></i></button>
                                                                </form>
                                                            {/if}
                                                        </td>
                                                    </tr>
                                                {/foreach}
                                            </table>
                                        </td>
                                    </tr>
                                {/foreach}
                                {assign var=i value="`$i+1`"}
                            {/foreach}
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>