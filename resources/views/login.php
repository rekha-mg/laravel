<?php
session_start();
// You can set the value however you like.
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background-color: #007bff;
            /*background-image: url("http://localhost/laravel/images/money.jpg");*/
        }
        form{
            background-color: #9fcdff;
            padding:10px;
        }


    </style>
    <script>

    $(document).ready(function() {
        $("#login").click(function () {
            var name = $('#name').val();
            var password=$('#password').val();

            if(name) {
                $.ajax({
                    url:'/api/login/'+name+'/'+password,
                    type: 'POST',
                    success: function (response, textStatus, xhr) {
                        if(response.data.length ===1 ) {
                            alert("Login successfull :" + response.data[0].member_name);
                            // calling function
                            storeSession(name);
                            if(response.data[0].member_name=="admin"){
                                document.location.href="http://127.0.0.1:8000/adminviewdetails";
                            } else{
                                document.location.href="http://127.0.0.1:8000/userviewdetails";
                            }

                        } else {
                                alert("plz login again... something is wrong");
                            }
                        },
                        error: function (response, textStatus, errorThrown) {
                            if (response && response.responseJSON && response.responseJSON.message) {
                                alert(response.responseJSON.message);
                            } else {
                                alert("something wrong happened");
                            }
                        }
                    });
                } else {
                        alert("Please fill the form before submit login.");
                        }
                    });
                });

        function storeSession(name){
            alert("session set");
            $.ajax({
                url:'/session/set',
                type: 'get',
                data: name,
                success: function (response, textStatus, xhr) {
                    console.log(response);
                },
                error: function (response, textStatus, errorThrown) {
                    if (response && response.responseJSON && response.responseJSON.message) {
                        alert(response.responseJSON.message);
                    } else {
                        alert("something wrong happened");
                    }
                }
            });


        }


    </script>
</head>
<body>

    <div class="container">
        <div id="first_div">
            <h1>Chit Funds</h1>
        </div>
        <div>
            <nav class="navbar navbar-expand-sm bg-secondary">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1:8000/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1:8000/contact">Contact Us</a>
                    </li>

                </ul>
            </nav>

        </div>
        <div>


        </div>


        <form action="">
            <div class="form-group">
                <label for="name">User name:</label>
                <input type="text" class="form-control" id="name" placeholder="Enter ur name" name="member_name">
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="password" placeholder="Enter password" name="password">
            </div>
            <div class="form-group form-check">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="remember"> Remember me
                </label>
            </div>

            <button type="submit" class="btn btn-primary" id="login">Submit</button>
        </form>


    </div>

    <div>

    </div>


</body>
</html>
