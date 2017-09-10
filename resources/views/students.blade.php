<html lang="en">
<meta name="csrf-token" content="{{ csrf_token() }}">
<head>
  <meta charset="utf-8">
  <meta name="robots" content="noindex, nofollow">

  <title>Bootstrap Snippet for Datatable - Bootsnipp.com</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <style type="text/css">

  </style>
  <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script type="riot/tag" src="{!! asset('js/table.tag') !!}"></script>
  <script type="riot/tag" src="{!! asset('js/modal-edit.tag') !!}"></script>
  <script type="riot/tag" src="{!! asset('js/modal-add.tag') !!}"></script>
  <script src="https://cdn.jsdelivr.net/npm/riot@3.7/riot+compiler.min.js"></script>
</head>

<body style="">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h4>Bootstrap Snipp for Datatable</h4>
        <modaladd></modaladd>
        <script>
          riot.mount('modaladd')
        </script>
        <button class="btn btn-primary btn-xs edit" data-title="add" data-toggle="modal" data-target="#add">Add New</button>
        <data-table></data-table>
        <script>
          riot.mount('data-table')
        </script>
      </div>
    </div>
  </div>
  <modaledit></modaledit>
  <script>
    riot.mount('modaledit')
  </script>




  <script type="text/javascript">
    $(document).ready(function () {
      $("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
          $("#mytable input[type=checkbox]").each(function () {
            $(this).prop("checked", true);
          });

        } else {
          $("#mytable input[type=checkbox]").each(function () {
            $(this).prop("checked", false);
          });
        }
      });
    });
  </script>


</body>

</html>