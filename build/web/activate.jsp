<%-- 
    Document   : activate
    Created on : Sep 28, 2020, 3:44:43 AM
    Author     : HIEUNGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />" rel="stylesheet">
        <title>Active your email</title>
        <style>
            .btn{
                color: #3399FF;
                border: 1px solid;
                margin: 0px 10px;
            }
            form{
                margin:  100px;
            }
        </style>
    </head>
    <body class="text-center">
        <form action="DispatchController">
            <h3 style="color: #3399FF">Enter code to activate your account</h3>
            <input type="text" name="txtCode" value="" />
            <input type="submit" value="Activate" name="btAction" class="btn"/>
        </form>
    </body>
</html>
