<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Details</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    </head>
<body>
        
        <nav class="navbar navbar-dark bg-primary">
            <h3 style="color: white">User Details</h3>
        </nav>
        
        </br>
        <div class="row">
        
            <div class="col-sm-4">
                <div class="container">
                    
                    <form id="frmUser" name="frmUser">
                      
                        <div class="form-group" align="left">
                            <label> Name</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" size="30px" required>
                        </div>
                        
                        <div class="form-group">
                            <label>NIC</label>
                            <input type="text" name="nic" id="nic" class="form-control" placeholder="NIC" size="30px" required>
                        </div>
                        
                         <div class="form-group">
                            <label>Address</label>
                            <input type="text" name="address" id="address" class="form-control" placeholder="address" size="30px" required>
                        </div>
                        
                         <div class="form-group">
                            <label>Zip Code</label>
                            <input type="text" name="zipCode" id="zipCode" class="form-control" placeholder="zipCode" size="30px" required>
                        </div>
                        
                         <div class="form-group">
                            <label>PhoneNumber</label>
                            <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" placeholder="phoneNumber" size="30px" required>
                        </div>
                        
                         <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" id="email" class="form-control" placeholder="email" size="30px" required>
                        </div>
                        
                        
                         <div class="form-group" align="right">
                             <button type="button" class="btn btn-info" id="save" onclick="addUser()">Add</button>
                             <button type="button" class="btn btn-warning" id="reset" onclick="reSet()">Reset</button>
                        </div>  
                    </form>      
                </div>    
            </div>
            
            <div class="col-sm-8">
                
                <div class="panel-body">
                    <table id="tbl-user" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>  
                        </thead>  
                    </table>  
                </div>
            </div>
        </div>
        
         <script src="components/jquery/jquery.js" type="text/javascript"></script>
        <script src="components/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="components/jquery.validate.min.js" type="text/javascript"></script>
         <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
 
        <script>
            
            getall();
            var isNew = true;
            var id = null;
            
            
            //add user
            
            function addUser()
            {
            	
                if($("#frmUser").valid())
                {    
                    var url="";
                    var data= "";
                    var method;
 
                    if(isNew==true)
                    {
                        
                        url = 'add.jsp';
                        data = $("#frmUser").serialize();
                        method = 'POST'
                    }
                    else
                    {
                        
                        url = 'update.jsp';
                        data = $("#frmUser").serialize() + "&id=" + id;
                        method = 'POST'
 
                    }
                    
                    $.ajax({
                        
                        type: method,
                        url : url,
                        dataType: 'JSON',
                        data : data,
                        
                        success:function(data)
                        {
                            getall();
                            
                            $('#name').val("");
                            $('#nic').val("");
                            $('#address').val("");
                            $('#zipCode').val("");
                            $('#phoneNumber').val("");
                            $('#email').val("");
                            
                            if(isNew ==true)
                            {
                                alert("Record Adddeddd");
                            }
                            else
                            {
                                 alert("Record Updatee");
                                
                            }
                        }
 
                    });
  
                }
      
            }
 
            function getall()
            {
                
                $('#tbl-user').dataTable().fnDestroy();
                $.ajax({
                    
                    url: "all_user.jsp",
                    type : "GET",
                    dataType : "JSON",
                    
                    success:function(data)
                    {
                        
                       $('#tbl-user').dataTable({
                           "aaData":data,
                           "scrollX": true,
                           "aoColumns":
                                   [
                              
                                    {"sTitle": " Name","mData": "name"},
                                    {"sTitle": "NIC","mData": "nic"},
                                    {"sTitle": "Address","mData": "address"},
                                    {"sTitle": "Zip Code","mData": "zipCode"},
                                    {"sTitle": "Phone Number","mData": "phoneNumber"},
                                    {"sTitle": "Email","mData": "email"},
                                    
                                    
                                    {
                                        "sTitle":
                                        "Edit",
                                        "mData": "id",
                                        "render" : function(mData,type,row,meta)
                                        {
                                            return '<button class="btn btn-success" onclick="get_details('+ mData +')">Edit</button>';
                                        }
                                   },
                                    
                               {
                                        "sTitle":
                                        "Delete",
                                        "mData": "id",
                                        "render" : function(mData,type,row,meta)
                                        {
                                            return '<button class="btn btn-danger" onclick="get_delete('+ mData +')">Delete</button>';
                                        }
                                   },      
                                   ]
                       });
                      
                    }  
                  
                });
                
                
            }
 
            function get_details(id)
            {
            
                $.ajax({
                    
                    type: "POST",
                    url : "edit_return.jsp",
                    data : {"id": id},
              
                    
                    success: function(data)
                    {
                        isNew = false
                        var obj = JSON.parse(data);
                        id = obj[0].id
                        $('#name').val(obj[0].name);
                        $('#nic').val(obj[0].unic);
                        $('#address').val(obj[0].uaddress);
                        $('#zipCode').val(obj[0].uzipCode);
                        $('#phoneNumber').val(obj[0].uphoneNumber);
                        $('#email').val(obj[0].uemail);
                    }
  
                });
 
            }
 
            function get_delete(id)
            {
                
                $.ajax({
                    
                    type: 'POST',
                    url: 'delete.jsp',
                    dataType: 'JSON',
                    data:{"id": id},
                    
                    success:function(data)
                    {
                        alert("Record Deletedddd");
                        getall();
                    }            
                });
            }
  
        </script>

</body>
</html>