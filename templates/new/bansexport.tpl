<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                {$lang['bansexportdesc']}
            </div>
            <div class="box">
                <div class="box-header text-center">
                    <h3 class="box-title">{$lang['bansexport']}</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body no-padding">
                    <table class="table table-striped table-hover">
                        <tr>
                            <td>
                                <textarea class="form-control" rows="10" cols="70" readonly="readonly">{$banexport}</textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>
</div>