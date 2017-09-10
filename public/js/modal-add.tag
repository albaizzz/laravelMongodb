<modaladd>
    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="add" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                    <h4 class="modal-title custom_align" id="Heading">Add Data</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input class="form-control " type="hidden" id="nis" ref="nis" placeholder="nis">
                        <input class="form-control " type="text" id="name" ref="name" placeholder="Name">
                    </div>
                    <div class="form-group">

                        <input class="form-control " type="text" ref="gender" id="gender" placeholder="Gender">
                    </div>
                    <div class="form-group">
                        <input rows="2" class="form-control" id="address" ref="address" placeholder="Address">


                    </div>
                </div>
                <div class="modal-footer ">
                    <button type="button" class="btn btn-warning btn-lg btnEdit" style="width: 100%;" onclick={savedata}><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;Update</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    savedata()
    {
        var data = {name : this.refs.name.value, address : this.refs.address.value, gender : this.refs.gender.value, nis: this.refs.nis.value};
        <!--  console  -->
        <!--  $.put("/studentsapi")  -->
        $.ajax({
            url : "/studentsapi/",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type :"POST",
            data :data,
            success: function(data){
                $('#add').hide();
                reload();
            }
        });

    }
</modaladd>