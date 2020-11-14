<%-- 
    Document   : createNewAccount
    Created on : Sep 15, 2020, 8:01:46 PM
    Author     : HIEUNGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Account</title>
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
                top: 5%;
                position: absolute;
                background: white;
                height: 600px;
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
            <h1><font color=3399FF>NEW ACCOUNT</font></h1>
            <br/>
            <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
            <p>Email*</p>
            <label for="inputEmail" class="sr-only">Email address</label>
            <input type="text" id="inputEmail" class="form-control" placeholder="Email address" required autofocus name="txtEmail">
            <c:if test="${not empty err.emailFormatError}">
                <font color="red">${err.emailFormatError}</font>
            </c:if>
            <c:if test="${not empty err.emailExistedError}">
                <font color="red">${err.emailExistedError}</font>
            </c:if>
            <br/>
            <p>Password*</p>
            <label for="inputPassword" class="sr-only">Email address</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Password" required autofocus name="txtPassword">
            <c:if test="${not empty err.passwordLengthError}">
                <font color="red">${err.passwordLengthError}</font>
            </c:if>
            <br/>
            <p>Confirm password*</p>
            <label for="inputConfirm" class="sr-only">Email address</label>
            <input type="password" id="inputConfirm" class="form-control" placeholder="Confirm password" required autofocus name="txtConfirm">
            <c:if test="${not empty err.confirmNotMatch}">
                <font color="red">${err.confirmNotMatch}</font>
            </c:if>
            <br/>
            <p>Name*</p>
            <label for="inputName" class="sr-only">Email address</label>
            <input type="text" id="inputName" class="form-control" placeholder="Name" required autofocus name="txtName">
            <c:if test="${not empty err.nameLengthError}">
                <font color="red">${err.nameLengthError}</font>
            </c:if>
            <br/>
            <br/>
            <input type="submit" value="Create New Account" name="btAction" class="btn"/>
            <input type="reset" value="Reset" class="btn"/>
        </form>
    </body>
</html>
