
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
                cursor: pointer;
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
            .button3{
                width: 80px;
                height: 25px;
                background-color: whitesmoke;
                font-size: 16px; 
                font-weight: 700;
                margin: 10px; 
                border-radius: 5px
            }
            td {
                padding: 2px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th{
                padding: 20px;
                border-bottom: 3px solid #ddd;
                font-size: 22px;
            }
            .but{
                width: 100px;
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
            <form  action="GetDataServlet" method="POST"  style="display: inline-block">
                <a href="showlist.jsp">
                    <button>Show client list</button>
                </a>  
            </form>
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
            List<Person> itr = data.showDB();

        %>

        <table>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Birtch Data</th>
                <th>Salary</th>
            </tr>
            <%for (Person elem : itr) {%>
            <tr>
                <td>
                    <%=elem.getId()%>
                </td>
                <td>
                    <%=elem.getFirstName()%>
                </td>
                <td>     
                    <%=elem.getLastName()%>
                </td>
                <td>     
                    <%=elem.getBirthData()%>
                </td>
                <td>     
                    <%=elem.getSalary()%>
                </td>
                <td class="but">
                    <form action="FindClients" method="POST">
                        <input  type="hidden" name="clientID" placeholder="Client ID" required="required" value="<%=elem.getId()%>">
                        <button class="button3">Edit</button>
                    </form>
                </td>

                <td class="but">
                    <form action="delete" method="POST">
                        <input  type="hidden" name="clientID" placeholder="Client ID" required="required" value="<%=elem.getId()%>">
                        <button class="button3">Delete</button>    
                    </form>
                </td>
                <td class="but">
                    <form action="AddAddresses" method="POST">
                        <input  type="hidden" name="clientID" placeholder="Client ID" required="required" value="<%=elem.getId()%>">
                        <input  type="hidden" name="FirstName" placeholder="Client ID" required="required" value="<%=elem.getFirstName()%>">
                        <input  type="hidden" name="LastName" placeholder="Client ID" required="required" value="<%=elem.getLastName()%>">
                        <button class="button3">Address</button>    
                    </form>
                </td>
                
                <td class="but"><button class="button3">Contacts</button></td>
            </tr>
            <%}%> 
        </table>
    </body>
</html>