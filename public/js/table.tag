<data-table>
    <script type="riot/tag" src="{!! asset('js/row.tag') !!}"></script>
    <div class="table-responsive">
        <table id="mytable" class="table table-bordred table-striped">
            <thead>
                <th>
                    <input type="checkbox" id="checkall" />
                </th>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Address</th>
                <th>Edit</th>
                <th>Delete</th>
            </thead>
            <tbody id="tbodyData">
                  <tr>
                <datarow></datarow>
            </tbody>
        </table>
        
    </div>    
   
        <script>
                 reload = function () {
                    var tbody = $('#tbodyData');
                    tbody.html("");
                    $.get("/studentsapi", function (datas, status) {
                        datas.map(function(data){
                            var tbody = $('#tbodyData');
                            tbody.append("<tr>"
                            +'<td><input type="checkbox" class="checkthis" data-nis="'+data.nis+'" /></td>'
                            +'<td data-nis="'+data.nis+'">'+data.nis+'</td>'
                            +'<td data-name="'+data.Name+'">'+data.Name+'</td>'
                            +'<td data-gender="'+data.Gender+'">'+data.Gender+'</td>'
                            +'<td data-address="'+data.Address+'">'+data.Address+'</td>'
                            +'<td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs edit" data-title="Edit" data-toggle="modal" data-target="#edit"><span class="glyphicon glyphicon-pencil"></span></button></p></td>'
                            +'<td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs delete" data-title="Delete" data-toggle="modal" data-target="#delete"><span class="glyphicon glyphicon-trash"></span></button></p></td>'
                            +"</tr>");
                        });
                        $('.edit').click(function(){
                            var tr = $(this).parents("tr");
                            console.log($(tr).children());
                            $(tr).children().map(function(){
                                if($(this).data('nis') != null)
                                {
                                    $('#nis').val($(this).data('nis'));
                                }
                                if($(this).data('name') != null)
                                {
                                    $('#name').val($(this).data('name'));
                                }
                                if($(this).data('gender') != null)
                                {
                                    $('#gender').val($(this).data('gender'));
                                }
                                if($(this).data('address') != null)
                                {
                                    $('#address').val($(this).data('address'));
                                }
                            });
                        });

                        $('.delete').click(function(){
                            var tr = $(this).parents("tr");
                            console.log($(tr).children());
                            $(tr).children().map(function(){
                                if($(this).data('nis') != null)
                                {
                                    $('#delnis').val($(this).data('nis'));
                                }
                            })
                        });
                    });
                }
            reload();
        </script>
        <script>riot.mount('datarow')</script>  
</data-table>