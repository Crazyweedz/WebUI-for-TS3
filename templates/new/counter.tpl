<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            {if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    {$lang['nopermissions']}
                </div>
            {else}
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['clientcounter']}</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">
                        <table class="table table-striped table-hover">
                            <tr>
                                <td width="50%">{$lang['total']}</td>
                                <td>{$totalclients} {$lang['clients']}</td>
                            </tr>
                            <tr>
                                <td>{$lang['online']}</td>
                                <td>
                                    {$count_online} {$lang['clients']} | {$perc_online}%
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['today']}</td>
                                <td>
                                    {$count_today} {$lang['clients']} | {$perc_today}%
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['thisweek']}</td>
                                <td>
                                    {$count_week} {$lang['clients']} | {$perc_week}%
                                </td>
                            </tr>
                            <tr>
                                <td>{$lang['thismonth']}</td>
                                <td>
                                    {$count_month} {$lang['clients']} | {$perc_month}%
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            {/if}
        </div>
    </div>
</div>