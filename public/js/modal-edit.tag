<modaledit>
    <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                    <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
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
                    <button type="button" class="btn btn-warning btn-lg btnEdit" style="width: 100%;" onclick={updatedata}><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;Update</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        </div>
        <div class="modal-body">
            <input type="hidden" ref="delnis" id="delnis"/>
          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

        </div>
        <div class="modal-footer ">
          <button type="button" class="btn btn-success" onclick={deleterecord}><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>&nbsp;No</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
    updatedata()
    {
        var data = {name : this.refs.name.value, address : this.refs.address.value, gender : this.refs.gender.value, nis: this.refs.nis.value};
        <!--  console  -->
        <!--  $.put("/studentsapi")  -->
        $.ajax({
            url : "/studentsapi/"+data.nis,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type :"PUT",
            data :data,
            success: function(data){
                $('#edit').hide();
                reload();
            }
        });

    }
    deleterecord()
    {
        var data = {nis: this.refs.delnis.value};
        $.ajax({
            url : "/studentsapi/"+data.nis,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type :"DELETE",
            data :data,
            success: function(data){
                $('#delete').hide();
                reload();
            }
        });
    }
    <script type="text/javascript">
        
        // $(document).ready(function(){
        //     $("body").on("click", ".btnEdit", function(){
        //         // do some thing herer
        //         console.log(this.refs.name.value);
        //     });
        // });
    </script>
</modaledit>