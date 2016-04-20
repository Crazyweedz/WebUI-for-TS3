<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if !isset($sid)}
                {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                    <meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic" />
                {/if}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['instancetraffic']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped">
                            <tr>
                                <th width="33%">{$lang['description']}</th>
                                <th width="33%">{$lang['incoming']}</th>
                                <th width="33%">{$lang['outgoing']}</th>
                            </tr>
                            <tr>
                                <td>{$lang['packetstransfered']}</td>
                                <td>{$hostinfo['connection_packets_received_total']}</td>
                                <td>{$hostinfo['connection_packets_sent_total']}</td>
                            </tr>
                            <tr>
                                <td>{$lang['bytestransfered']}</td>
                                <td>{$hostinfo['connection_bytes_received_total']}</td>
                                <td>{$hostinfo['connection_bytes_sent_total']}</td>
                            </tr>
                            <tr>
                                <td>{$lang['bandwidthlastsecond']}</td>
                                <td>{$hostinfo['connection_bandwidth_received_last_second_total']} /s</td>
                                <td>{$hostinfo['connection_bandwidth_sent_last_second_total']} /s</td>
                            </tr>
                            <tr>
                                <td>{$lang['bandwidthlastminute']}</td>
                                <td>{$hostinfo['connection_bandwidth_received_last_minute_total']} /s</td>
                                <td>{$hostinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
                            </tr>
                            <tr>
                                <td>{$lang['filetransferbandwidth']}</td>
                                <td>{$hostinfo['connection_filetransfer_bandwidth_received']} /s</td>
                                <td>{$hostinfo['connection_filetransfer_bandwidth_sent']} /s</td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                            <a href="index.php?site=servertraffic&amp;refresh=off">{$lang['stoprefresh']}</a>
                        {else}
                            <a href="index.php?site=servertraffic&amp;refresh=on">{$lang['autorefresh']}</a>
                        {/if}
                    </div>
                    <!-- box-footer -->
                </div>
                <!-- /.box -->
            {else}
                {if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {$lang['error']}
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        {$lang['nopermissions']}
                    </div>
                {else}
                    {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                        <meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic&amp;sid={$sid}" />
                    {/if}
                    <div class="box">
                        <div class="box-header text-center">
                            <h3 class="box-title">{$lang['instancetraffic']}</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body no-padding">
                            <table class="table table-striped">
                                <tr>
                                    <th width="33%">{$lang['description']}</th>
                                    <th width="33%">{$lang['incoming']}</th>
                                    <th width="33%">{$lang['outgoing']}</th>
                                </tr>
                                <tr>
                                    <td>{$lang['packetstransfered']}</td>
                                    <td>{$hostinfo['connection_packets_received_total']}</td>
                                    <td>{$hostinfo['connection_packets_sent_total']}</td>
                                </tr>
                                <tr>
                                    <td>{$lang['bytestransfered']}</td>
                                    <td>{$hostinfo['connection_bytes_received_total']}</td>
                                    <td>{$hostinfo['connection_bytes_sent_total']}</td>
                                </tr>
                                <tr>
                                    <td>{$lang['bandwidthlastsecond']}</td>
                                    <td>{$hostinfo['connection_bandwidth_received_last_second_total']} /s</td>
                                    <td>{$hostinfo['connection_bandwidth_sent_last_second_total']} /s</td>
                                </tr>
                                <tr>
                                    <td>{$lang['bandwidthlastminute']}</td>
                                    <td>{$hostinfo['connection_bandwidth_received_last_minute_total']} /s</td>
                                    <td>{$hostinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
                                </tr>
                                <tr>
                                    <td>{$lang['filetransferbandwidth']}</td>
                                    <td>{$hostinfo['connection_filetransfer_bandwidth_received']} /s</td>
                                    <td>{$hostinfo['connection_filetransfer_bandwidth_sent']} /s</td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                                <a href="index.php?site=servertraffic&amp;refresh=off">{$lang['stoprefresh']}</a>
                            {else}
                                <a href="index.php?site=servertraffic&amp;refresh=on">{$lang['autorefresh']}</a>
                            {/if}
                        </div>
                        <!-- box-footer -->
                    </div>
                    <!-- /.box -->
                {/if}
            {/if}
        </div>
    </div>
</div>