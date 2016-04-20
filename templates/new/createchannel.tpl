<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_channel_create_permanent']) AND isset($permoverview['b_channel_create_semi_permanent']) AND isset($permoverview['b_channel_create_temporary']) AND empty($permoverview['b_channel_create_permanent']) AND empty($permoverview['b_channel_create_semi_permanent']) AND empty($permoverview['b_channel_create_temporary'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
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
                <form method="post" action="index.php?site=createchannel&amp;sid={$sid}">
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['createachannel']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <td width="50%">{$lang['pid']}</td>
                                    <td>
                                        <select class="form-control" name="settings[cpid]">
                                            <option value="0">{$lang['mainchannel']}</option>
                                            {foreach key=key item=value from=$channellist}
                                                <option value="{$value['cid']}">{$value['channel_name']}</option>
                                            {/foreach}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['name']}</td>
                                    <td><input class="form-control" type="text" name="settings[channel_name]"/></td>
                                </tr>
                                <tr>
                                    <td>{$lang['topic']}</td>
                                    <td>
                                        {if isset($permoverview['b_channel_create_with_topic']) AND empty($permoverview['b_channel_create_with_topic'])}
                                            -
                                        {else}
                                            <input class="form-control" type="text" name="settings[channel_topic]" value="" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="green2">{$lang['description']}:</td>
                                    <td class="green2">
                                        {if isset($permoverview['b_channel_create_with_description']) AND empty($permoverview['b_channel_create_with_description'])}
                                            -
                                        {else}
                                            <input class="form-control" type="text" name="settings[channel_description]" value="" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['codec']}</td>
                                    <td>
                                        <select class="form-control" name="settings[channel_codec]">
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_speex8']) OR $permoverview['b_channel_create_modify_with_codec_speex8']==1}
                                                <option value="0">{$lang['codec0']}</option>
                                            {/if}
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_speex16']) OR $permoverview['b_channel_create_modify_with_codec_speex16']==1}
                                                <option value="1">{$lang['codec1']}</option>
                                            {/if}
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_speex32']) OR $permoverview['b_channel_create_modify_with_codec_speex32']==1}
                                                <option value="2">{$lang['codec2']}</option>
                                            {/if}
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_celtmono48']) OR $permoverview['b_channel_create_modify_with_codec_celtmono48']==1}
                                                <option value="3">{$lang['codec3']}</option>
                                            {/if}
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_opusvoice']) OR $permoverview['b_channel_create_modify_with_codec_opusvoice']==1}
                                                <option value="3">{$lang['codec4']}</option>
                                            {/if}
                                            {if !isset($permoverview['b_channel_create_modify_with_codec_opusmusic']) OR $permoverview['b_channel_create_modify_with_codec_opusmusic']==1}
                                                <option value="3">{$lang['codec5']}</option>
                                            {/if}
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['codecquality']}</td>
                                    <td>
                                        {if isset($permoverview['i_channel_create_modify_with_codec_maxquality']) AND empty($permoverview['i_channel_create_modify_with_codec_maxquality'])}
                                            -
                                        {else}
                                            <select class="form-control" name="settings[channel_codec_quality]">
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['maxclients']}</td>
                                    <td>
                                        {if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
                                            -
                                        {else}
                                            <input class="form-control" type="text" name="settings[channel_maxclients]" value="-1" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['maxfamilyclients']}</td>
                                    <td>
                                        {if isset($permoverview['b_channel_create_with_maxfamilyclients']) AND empty($permoverview['b_channel_create_with_maxfamilyclients'])}
                                            -
                                        {else}
                                            <input class="form-control" type="text" name="settings[channel_maxfamilyclients]" value="-1" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['type']}</td>
                                    <td>
                                        {if !isset($permoverview['b_channel_create_semi_permanent']) OR $permoverview['b_channel_create_semi_permanent']==1}
                                            {$lang['semipermanent']} <input type="radio" name="chantyp" value="1" checked="checked" /><br/>
                                        {/if}
                                        {if !isset($permoverview['b_channel_create_permanent']) OR $permoverview['b_channel_create_permanent']==1}
                                            {$lang['permanent']} <input type="radio" name="chantyp" value="2" /><br />
                                        {/if}
                                        {if !isset($permoverview['b_channel_create_with_default']) OR $permoverview['b_channel_create_with_default']==1}
                                            {$lang['default']} <input type="radio" name="chantyp" value="3" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['maxfamilyclientsinherited']}</td>
                                    <td>
                                        {if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
                                            -
                                        {else}
                                            <select class="form-control" name="settings[channel_flag_maxfamilyclients_inherited]">
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                            </select>
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['neededtalkpower']}</td>
                                    <td>
                                        {if isset($permoverview['b_channel_create_with_needed_talk_power']) AND empty($permoverview['b_channel_create_with_needed_talk_power'])}
                                            -
                                        {else}
                                            <input class="form-control" type="text" name="settings[channel_needed_talk_power]" value="0" />
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <td>{$lang['phoneticname']}</td>
                                    <td><input class="form-control" type="text" name="settings[channel_name_phonetic]" value="" /></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="submit" name="createchannel" class="btn btn-default btn-flat">{$lang['create']}</button>
                        </div>
                    </div>
                    <!-- /.box -->
                </form>
            {/if}
        </div>
    </div>
</div>