<div class="container-fluid">
    <div class="row">
        <div class="col-md-8">
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
                    <h3 class="box-title">{$lang['channel']} {$lang['editor']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <td width="50%">{$lang['name']}</td>
                            <td>
                                <form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
                                    {if isset($permoverview['b_channel_modify_name']) AND empty($permoverview['b_channel_modify_name'])}
                                        -
                                    {else}
                                        <div class="input-group">
                                            <input class="form-control" type="text" name="newsettings[channel_name]" value="{$channelinfo['channel_name']}" />
                                            <div class="input-group-btn">
                                                <button class="btn btn-default btn-flat" type="submit" name="editchannelname" >{$lang['rename']}</button>
                                            </div>
                                        </div>
                                    {/if}
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
                                <td>{$lang['topic']}</td>
                                <td>
                                    {if isset($permoverview['b_channel_modify_topic']) AND empty($permoverview['b_channel_modify_topic'])}
                                        -
                                    {else}
                                        <input class="form-control" type="text" name="newsettings[channel_topic]" value="{if isset($channelinfo['channel_topic'])}{$channelinfo['channel_topic']}{/if}" />
                                    {/if}
                                </td>
                        </tr>
                        <tr>
                            <td>{$lang['description']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_description']) AND empty($permoverview['b_channel_modify_description'])}
                                    -
                                {else}
                                    <input class="form-control" type="text" name="newsettings[channel_description]" value="{if isset($channelinfo['channel_description'])}{$channelinfo['channel_description']}{/if}" />
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['codec']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_codec']) AND empty($permoverview['b_channel_modify_codec'])}
                                    -
                                {else}
                                    <select class="form-control" name="newsettings[channel_codec]">
                                        <option value="0" {if $channelinfo['channel_codec'] == '0'}selected="selected"{/if}>{$lang['codec0']}</option>
                                        <option value="1" {if $channelinfo['channel_codec'] == '1'}selected="selected"{/if}>{$lang['codec1']}</option>
                                        <option value="2" {if $channelinfo['channel_codec'] == '2'}selected="selected"{/if}>{$lang['codec2']}</option>
                                        <option value="3" {if $channelinfo['channel_codec'] == '3'}selected="selected"{/if}>{$lang['codec3']}</option>
                                        <option value="4" {if $channelinfo['channel_codec'] == '4'}selected="selected"{/if}>{$lang['codec4']}</option>
                                        <option value="5" {if $channelinfo['channel_codec'] == '5'}selected="selected"{/if}>{$lang['codec5']}</option>
                                    </select>
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['codecquality']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_codec_quality']) AND empty($permoverview['b_channel_modify_codec_quality'])}
                                    -
                                {else}
                                    <select class="form-control" name="newsettings[channel_codec_quality]">
                                        <option value="0" {if $channelinfo['channel_codec_quality'] == '0'}selected="selected"{/if}>0</option>
                                        <option value="1" {if $channelinfo['channel_codec_quality'] == '1'}selected="selected"{/if}>1</option>
                                        <option value="2" {if $channelinfo['channel_codec_quality'] == '2'}selected="selected"{/if}>2</option>
                                        <option value="3" {if $channelinfo['channel_codec_quality'] == '3'}selected="selected"{/if}>3</option>
                                        <option value="4" {if $channelinfo['channel_codec_quality'] == '4'}selected="selected"{/if}>4</option>
                                        <option value="5" {if $channelinfo['channel_codec_quality'] == '5'}selected="selected"{/if}>5</option>
                                        <option value="6" {if $channelinfo['channel_codec_quality'] == '6'}selected="selected"{/if}>6</option>
                                        <option value="7" {if $channelinfo['channel_codec_quality'] == '7'}selected="selected"{/if}>7</option>
                                        <option value="8" {if $channelinfo['channel_codec_quality'] == '8'}selected="selected"{/if}>8</option>
                                        <option value="9" {if $channelinfo['channel_codec_quality'] == '9'}selected="selected"{/if}>9</option>
                                        <option value="10" {if $channelinfo['channel_codec_quality'] == '10'}selected="selected"{/if}>10</option>
                                    </select>
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['codecunencrypted']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_maxclients']) AND empty($permoverview['b_channel_modify_maxclients'])}
                                    -
                                {else}
                                    <select class="form-control" name="newsettings[channel_codec_is_unencrypted]">
                                        <option value="1" {if $channelinfo['channel_codec_is_unencrypted']==1}selected="selected"{/if}>{$lang['yes']}</option>
                                        <option value="0" {if $channelinfo['channel_codec_is_unencrypted']==0}selected="selected"{/if}>{$lang['no']}</option>
                                    </select>
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['maxclients']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_maxclients']) AND empty($permoverview['b_channel_modify_maxclients'])}
                                    -
                                {else}
                                    <input class="form-control" type="text" name="newsettings[channel_maxclients]" value="{$channelinfo['channel_maxclients']}" />
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['maxfamilyclients']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_maxfamilyclients']) AND empty($permoverview['b_channel_modify_maxfamilyclients'])}
                                    -
                                {else}
                                    <input class="form-control" type="text" name="newsettings[channel_maxfamilyclients]" value="{$channelinfo['channel_maxfamilyclients']}" />
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['type']}</td>
                            <td>
                                {if !isset($permoverview['b_channel_modify_make_temporary']) or $permoverview['b_channel_modify_make_temporary'] == 1}
                                    <input type="radio" name="chantyp" value="0" {if $channelinfo['channel_flag_permanent'] == 0 AND $channelinfo['channel_flag_semi_permanent'] == 0}checked="checked"{/if} /> {$lang['temporary']}<br/>
                                {/if}
                                {if !isset($permoverview['b_channel_modify_make_semi_permanent']) or $permoverview['b_channel_modify_make_semi_permanent'] == 1}
                                    <input type="radio" name="chantyp" value="1" {if $channelinfo['channel_flag_semi_permanent'] == 1}checked="checked"{/if} /> {$lang['semipermanent']}<br/>
                                {/if}
                                {if !isset($permoverview['b_channel_modify_make_permanent']) or $permoverview['b_channel_modify_make_permanent'] == 1}
                                    <input type="radio" name="chantyp" value="2" {if $channelinfo['channel_flag_permanent'] == 1 AND $channelinfo['channel_flag_default']==0}checked="checked"{/if} /> {$lang['permanent']}<br />
                                {/if}
                                {if !isset($permoverview['b_channel_modify_make_default']) or $permoverview['b_channel_modify_make_default'] == 1}
                                    <input type="radio" name="chantyp" value="3" {if $channelinfo['channel_flag_default'] == 1}checked="checked"{/if} /> {$lang['default']}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['maxfamilyclientsinherited']}</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_maxfamilyclients']) AND empty($permoverview['b_channel_modify_maxfamilyclients'])}
                                    -
                                {else}
                                    <select class="form-control" name="newsettings[channel_flag_maxfamilyclients_inherited]">
                                        <option value="0" {if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '0'}selected="selected"{/if}>0</option>
                                        <option value="1" {if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '1'}selected="selected"{/if}>1</option>
                                    </select>
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['neededtalkpower']}:</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_needed_talk_power']) AND empty($permoverview['b_channel_modify_needed_talk_power'])}
                                    -
                                {else}
                                    <input class="form-control" type="text" name="newsettings[channel_needed_talk_power]" value="{$channelinfo['channel_needed_talk_power']}" />
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <td>{$lang['phoneticname']}:</td>
                            <td>
                                {if isset($permoverview['b_channel_modify_name']) AND empty($permoverview['b_channel_modify_name'])}
                                    -
                                {else}
                                    <input class="form-control" type="text" name="newsettings[channel_name_phonetic]" value="{if isset($channelinfo['channel_name_phonetic'])}{$channelinfo['channel_name_phonetic']}{/if}" />
                                {/if}
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="submit" name="editchannel" class="btn btn-default btn-flat">{$lang['edit']}</button>
                </div>
            </div>
            <!-- /.box -->
            </form>
        </div>
        <div class="col-md-4">
            <div class="row">
                {if !isset($permoverview['b_channel_modify_password']) OR $permoverview['b_channel_modify_password'] == 1}
                    <form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
                        <div class="box">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['channelpassword']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['passwordset']}</td>
                                        <td>
                                            {if $channelinfo['channel_flag_password'] == 1}
                                                {$lang['yes']}
                                            {else}
                                                {$lang['no']}
                                            {/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>{$lang['newpassword']}</td>
                                        <td>
                                            {if $channelinfo['channel_flag_default'] == 1}
                                                {$lang['defaultnopw']}
                                            {else}
                                                <input class="form-control" type="text" name="newsettings[channel_password]" value="" />
                                            {/if}
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button class="btn btn-default btn-flat" type="submit" name="editpw">{$lang['send']}</button>
                            </div>
                        </div>
                        <!-- /.box -->
                    </form>
                {/if}
            </div>
            <div class="row">
                {if !isset($permoverview['b_channel_modify_parent']) OR $permoverview['b_channel_modify_parent'] == 1}
                    <form method="post" action="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}">
                        <div class="box">
                            <div class="box-header text-center">
                                <h3 class="box-title">{$lang['channelmove']}</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <table class="table table-striped table-hover">
                                    <tr>
                                        <td width="50%">{$lang['moveto']}</td>
                                        <td>
                                            <select class="form-control" name="move">
                                                <option value="0">{$lang['mainchannel']}</option>
                                                {foreach key=key item=value from=$channellist}
                                                    {if $value['cid'] != $cid}
                                                        <option value="{$value['cid']}">{$value['channel_name']}</option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button class="btn btn-default btn-flat" type="submit" name="movechan">{$lang['move']}</button>
                            </div>
                        </div>
                        <!-- /.box -->
                    </form>
                {/if}
            </div>
        </div>
    </div>
</div>