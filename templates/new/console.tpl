<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['queryconsole']}</h3>
                </div><!-- /.box-header -->
            </div><!-- /.box -->
        </div>
    </div>
    <div class="row">
        <form method="post" action="index.php?site=console&amp;sid={$sid}">
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['inputbox']}</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <textarea class="form-control" name="command" cols="50" rows="10"></textarea>
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <button class="btn btn-default btn-flat" type="submit" name="execute">{$lang['execute']}</button>
                    </div>
                </div><!-- /.box -->
            </div>
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header text-center">
                        <h3 class="box-title">{$lang['outputbox']}</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                        <textarea class="form-control" name="output" cols="80" rows="20" readonly="readonly">{$showOutput}</textarea>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </form>
    </div>
</div>