<%--
  Created by IntelliJ IDEA.
  User: acer
  Date: 26.02.15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <script src="/js/jquery-1.11.2.min.js"></script>
    <script src="/js/bootstrap-table.min.js"></script>
    <script src="/js/bootstrap-table-flatJSON.min.js"></script>
    <script src="/js/bootstrap.js"></script>

    <!-- Bootstrap -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/default.css" rel="stylesheet">
    <link href="/css/font-awesome.css" rel="stylesheet">
    <link href="/css/bootstrap-table.min.css" rel="stylesheet">


    <!--for VK-->
    <script src="http://vk.com/js/api/openapi.js" type="text/javascript"></script>




</head>

<body>
<div class="table">
    <div class="modal fade" id="groupsTable" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ">
                <div class="modal-header"><button class="close" type="button" data-dismiss="modal">x</button>
                    <h4 class="modal-title" id="myModalLabel">Groups</h4>
                </div>
                <div class="modal-body">

                    <table id="events-id2" data-url="admin/group/getall" data-toggle="table" data-height="299" data-cache="false" data-show-toggle="true" data-flat="true" data-search="true">
                        <thead>
                        <tr>
                            <th data-field="id" data-sortable="false">ID</th>
                            <th data-field="name" data-sortable="false">Group name</th>
                            <th data-field="teacher.firstname" data-sortable="false">Teacher name</th>
                            <th data-field="teacher.lastname" data-sortable="false">Teacher surname</th>
                            <th data-field="startDate" data-sortable="false">Start date</th>
                            <th data-field="finishDate" data-sortable="false">Finish date</th>
                            <th data-field="operate" data-formatter="operateFormatter" data-events="operateEvents">Item Operate</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
                </div>

            </div>
        </div>
    </div>

    <script>
        function operateFormatter(value, row, index) {
            return [
                '<a class="edit ml10" href="javascript:void(0)" title="Edit">',
                '<i class="glyphicon glyphicon-edit"></i>',
                '</a>',
                '<a class="remove ml10" href="javascript:void(0)" title="Remove">',
                '<i class="glyphicon glyphicon-remove"></i>',
                '</a>'
            ].join('');
        }

        window.operateEvents = {
            'click .edit': function (e, value, row, index) {
                $.ajax({
                    url: "admin/group/edit/" + row.id,
                    type: "GET",
                    success: function(data, code, xhr) {
                        alert(data);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert(jqXHR.status + ' ' + jqXHR.responseText);
                    },
                    dataType: 'json',
                })
            },
            'click .remove': function (e, value, row, index) {
                alert('You click remove icon, row: ' + JSON.stringify(row));
                console.log(value, row, index);
            }
        };
    </script>
</div>
<div class="menu">

    <div class="container-fluid">

        <div class="row">
            <div class=" col-xs-offset-1 col-sm-offset-1  col-md-offset-1 col-lg-offset-1">

                <div>
                    <p style="color: #ffffff"><i class="fa fa-cog fa-2x" ></i> Admin </p>

                    <div class="list-group">
                        <a class="list-group-item" href="/admin/student/search"><i class="fa fa-child fa-1x"></i>&nbsp;
                            студент</a>
                        <a class="list-group-item" href="#groupsTable" data-toggle="modal"><i class="fa fa-users fa-1x"></i>&nbsp;
                            группа</a>
                        <a class="list-group-item" href="/admin/teacher/search"><i class="fa fa-user-secret fa-1x"></i>&nbsp;
                            преподаватель</a>
                        <a class="list-group-item" href="/admin/car/search"><i class="fa fa-car fa-1x"></i>&nbsp;
                            автомобиль</a>

                    </div>
                </div>

                <br>
                <br>
            </div>

        </div>
    </div>
</div>

</body>
</html>
