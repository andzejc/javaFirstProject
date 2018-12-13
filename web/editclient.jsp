<%-- 
    Document   : index
    Created on : Oct 23, 2018, 2:06:00 PM
    Author     : HP
--%>

<%@page import="java.lang.Integer"%>
<%@page import="java.util.List"%>
<%@page import="javajdbs.DataBase"%>
<%@page import="com.person.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
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
            form{
                display: inline-block;
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
        <%
            DataBase data = new DataBase();
            List<Person> itr = data.client;
            for (Person p : itr) {%>
        <div>
            <form action="EditPerson" method="POST">
                <input  type="hidden" name="clientID" placeholder="Client ID" required="required" value="<%=p.getId()%>">
                <input  type="text" name="firstName" value="<%=p.getFirstName()%>" required="required">
                <input  type="text" name="lastName" value="<%=p.getLastName()%>" required="required">
                <input  type='date' name="birthData" value="<%=p.getBirthData()%>" required="required">
                <input  type='text' name="salary" value="<%=p.getSalary()%>" required="required">
                <button class="button2">Save</button>
            </form>


            <form action="delete" method="POST">
                <input  type="hidden" name="clientID" placeholder="Client ID" required="required" value="<%=p.getId()%>">
                <button class="button2">Delete</button>    
            </form>
            <form>
                <button class="button2">Addresses</button>
            </form>
            <form>
                <button class="button2">Contacts</button>
            </form>
            <%}%>
        </div>
    </body>
</html>