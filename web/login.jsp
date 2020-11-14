<%-- 
    Document   : login
    Created on : Sep 15, 2020, 1:54:01 PM
    Author     : HIEUNGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />" rel="stylesheet">
        <style>
            body{
                background: grey;
            }
            form{
                width:  350px;
                border: 3px solid #f1f1f1;
                padding: 20px;
                left: 38%;
                top: 15%;
                position: absolute;
                background: white;
                height: 475px;
                border-radius: 10px;
            }
            p{
                text-align: left;
            }
            .btn{
                color: #3399FF;
                border: 1px solid;
                margin: 0px 10px;
            }
        </style>
    </head>
    <body class="text-center">
        <form action="DispatchController" method="POST" class="form-signin">
            <h1><font color=3399FF>LOGIN</font></h1>
            <br/>
            <p> Email: </p>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus name="txtEmail">
            <br/>
            <p> Password: </p>
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="txtPassword">
            <br/>
            <input type="submit" value="Login" name="btAction" class="btn"/>   
            <input type="reset" value="Reset" class="btn"/> <br/>
            <br/>
            If you don't have account.<br/> Register <a href="createNewAccount.jsp">here</a> !
            <br/>
            <br/>
            <c:if test="${not empty sessionScope.INVALID}">
                <h6><font color="red">${sessionScope.INVALID}</font></h6>
                </c:if>
                <c:if test="${not empty requestScope.SUCCESSFULL}">
                <h6><font color="green">${requestScope.SUCCESSFULL}</font></h6>
                </c:if>
        </form>
    </body>
</html>
