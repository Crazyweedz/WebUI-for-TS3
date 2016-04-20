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
            {if isset($permoverview['b_virtualserver_token_list']) AND empty($permoverview['b_virtualserver_token_list'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                <form method="post" action="index.php?site=token&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['tokenlist']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th>{$lang['token']}</th>
                                    <th>{$lang['type']}</th>
                                    <th>{$lang['id1']}</th>
                                    <th>{$lang['id2']}</th>
                                    <th>{$lang['created']}</th>
                                    <th>{$lang['description']}</th>
                                    <th>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="checkall" value="0" onclick="check(1)" /> {$lang['selectall']}
                                        </label>
                                    </th>
                                </tr>
                                {if !empty($tokenlist)}
                                    {foreach key=key item=value from=$tokenlist}
                                        <tr>
                                            <td>{$value['token']}</td>
                                            <td>
                                                {if $value['token_type']==0}
                                                    {$lang['servergroup']}
                                                {elseif $value['token_type'] == 1}
                                                    {$lang['channelgroup']}
                                                {/if}
                                            </td>
                                            <td>
                                                {if $value['token_type'] == 0}
                                                    {foreach key=key2 item=value2 from=$sgrouplist}
                                                        {if $value2['sgid'] == $value['token_id1']}
                                                            {$value2['name']}
                                                        {/if}
                                                    {/foreach}
                                                {elseif $value['token_type'] == 1}
                                                    {foreach key=key2 item=value2 from=$cgrouplist}
                                                        {if $value2['cgid'] == $value['token_id1']}
                                                            {$value2['name']}
                                                        {/if}
                                                    {/foreach}
                                                {/if}
                                            </td>
                                            <td>
                                                {if $value['token_type']==1}
                                                    {foreach key=key2 item=value2 from=$channellist}
                                                        {if $value2['cid'] == $value['token_id2']}
                                                            {$value2['channel_name']}
                                                        {/if}
                                                    {/foreach}
                                                {/if}
                                            </td>
                                            <td>{$value['token_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                                            <td>{$value['token_description']}</td>
                                            <td>
                                                {if !isset($permoverview['b_virtualserver_token_delete']) OR $permoverview['b_virtualserver_token_delete']==1}
                                                    <input type="checkbox" name="token[]" value="{$value['token']}" />
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                {/if}
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="deltoken">{$lang['delete']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
            {if isset($permoverview['b_virtualserver_token_add']) AND empty($permoverview['b_virtualserver_token_add'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                <form method="post" action="index.php?site=token&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['createtoken']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th>{$lang['type']}</th>
                                    <th>{$lang['groups']}</th>
                                    <th>{$lang['channel']}</th>
                                    <th>{$lang['description']}</th>
                                    <th>{$lang['number']}</th>
                                </tr>
                                <tr>
                                    <td>
                                        <select class="form-control" name="tokentype" onchange="hide_select(this.value)">
                                            <option value="">{$lang['type']}</option>
                                            <option value="0">(0){$lang['servergroup']}</option>
                                            <option value="1">(1){$lang['channelgroup']}</option>
                                        </select>
                                    </td>
                                    <td>
                                        <div id="groups">
                                            <select class="form-control" id="servergroups" name="tokenid1_1">
                                                <optgroup label="{$lang['servergroups']}">
                                                    {foreach key=key item=value from=$sgrouplist}
                                                        {if $value['type'] != 0}
                                                            <option value="{$value['sgid']}">({$value['sgid']}) {$value['name']}</option>
                                                        {/if}
                                                    {/foreach}
                                                </optgroup>
                                            </select>
                                            <select class="form-control" id="channelgroups" style="display:none" name="tokenid1_2">
                                                <optgroup label="{$lang['channelgroups']}">
                                                    {foreach key=key item=value from=$cgrouplist}
                                                        {if $value['type'] != 0}
                                                            <option value="{$value['cgid']}">({$value['cgid']}) {$value['name']}</option>
                                                        {/if}
                                                    {/foreach}
                                                </optgroup>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <select class="form-control" id="channel" style="display:none" name="tokenid2">
                                            <option value="0">{$lang['channel']}</option>
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                    <td class="green1 center">
                                        <input class="form-control" type="text" name="description" value="" />
                                    </td>
                                    <td class="green1 center">
                                        <input  class="form-control" type="text" name="number" size="3" value="1" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button class="btn btn-default btn-flat" type="submit" name="addtoken">{$lang['create']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
        </div>
    </div>
</div>