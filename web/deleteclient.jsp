
<%@page import="com.person.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Clients System</title>
        <style>
            a{
                text-decoration: none;
                  color: black;
            }
            h1{
                color: whitesmoke;
                font-size: 45px;
                font-family:sans-serif;
                padding-top: 50px;
            }
            button{
                width: 200px; 
                height: 50px; 
                background-color: whitesmoke;
                font-size: 20px; 
                font-weight: 700; 
                margin: 5px; 
                border-radius: 5px;
            }
            input{
                width: 250px;
                height: 25px;
                margin: 10px;
                border-radius: 5px;
            }
            .button2{
                width: 150px;
                height: 25px;
                background-color: whitesmoke;
                font-size: 16px; 
                font-weight: 700;
                margin: 10px; 
                border-radius: 5px
            }

        </style>
    </head>
    <body>
        <!-- header -->
        <div style=' text-align:center; width: 100%; height: 200px; background-color: #92b9d5'; >
            <h1> Clients registration system.</h1>
        </div>

        <div style="border: 1px solid black; padding: 20px"> 
            <a href="createdPersons.jsp">
                <button>Add client</button>
            </a>
            <a href="showlist.jsp">
                <button>Show client list</button>
            </a>
            <a href="findClient.jsp">
                <button>Edit client</button>
            </a>
            <a href="deleteclient.jsp">
                <button>Delete client</button>
            </a>
            <a href="exit.jsp">
                <button>Exit</button>
            </a>
        </div>
        <div>
            <form action="delete" method="POST">
                <input  type="text" name="clientID" placeholder="Client ID" required="required">
                <button class="button2" >Delete client</button>
            </form>
        </div>
    </body>
</html>