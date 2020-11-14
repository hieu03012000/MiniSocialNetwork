<%-- 
    Document   : postDetail
    Created on : Sep 20, 2020, 11:57:16 PM
    Author     : HIEUNGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
        <link href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />" rel="stylesheet">
        <style>
            img{
                height: 400px;
                padding: 25px 10px;
            }

            .col-lg-4 {
                height: 650px;
            }
            .btn{
                color: #3399FF;
                border: 1px solid;
                margin: 0px 10px;
            }
            .dislike{
                border: 1px solid red;
                color: red;
            }
            form{
                width: 500px;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty sessionScope}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${not empty sessionScope}">
            <c:set var="dto" value="${requestScope.DETAIL}"/>
            <c:set var="list" value="${requestScope.COMMENT_LIST}"/>
            <c:set var="like" value="${requestScope.LIKE}"/>
            <c:set var="dislike" value="${requestScope.DISLIKE}"/>
            <c:set var="isSearch" value="${requestScope.IS_SEARCH}"/>
            <div class="navbar navbar-dark bg-dark">
                <c:url var="url" value="DispatchController">
                    <c:if test="${not empty isSearch}">
                        <c:param name="btAction" value="Search"/>
                        <c:param name="txtSearch" value="${requestScope.SEARCH_VALUE}"/>
                    </c:if>
                    <c:if test="${empty isSearch}">
                        <c:param name="btAction" value="showOwnPost"/>
                    </c:if>
                </c:url>
                <a href="${url}">Back</a>
                <c:set var="user" value="${sessionScope.DTO}"/>
                <h4><font color=3399FF>${user.name}</font></h4> 
                    <c:url var="url" value="DispatchController">
                        <c:param name="btAction" value="logout"/>
                    </c:url>
                <a href="${url}">Logout</a>
            </div>
            <div class="row">

                <nav class="jumbotron col-lg-8" style="overflow: auto; height: 659px;">
                    <div class="col-sm-8 mx-auto">
                        <h1>${dto.title}</h1>
                        <p>${dto.description}</p>
                        <img src="${dto.image}">
                        <p>${dto.date}</p>
                        <p>Author: ${dto.name}</p>
                        <form action="DispatchController">
                            <input type="hidden" name="txtMail" value="${user.email}" />
                            <input type="hidden" name="txtPostID" value="${dto.postID}" />
                            <input type="hidden" name="txtSearch" value="${requestScope.SEARCH_VALUE}" />
                            <input type="submit" value="Like  ${like}" name="btAction" class="btn"/>
                            <input type="submit" value="Dislike  ${dislike}" name="btAction" class="btn dislike"/>
                        </form>

                    </div>
                </nav>
                <div class="my-3 p-3 bg-white rounded shadow-sm col-lg-4" style="overflow: auto;">
                    <form action="DispatchController">
                        <input type="text" placeholder="Comment" aria-label="Comment" value="" name="txtComment">
                        <input type="hidden" name="txtEmail" value="${user.email}" />
                        <input type="hidden" name="txtPostID" value="${dto.postID}" />
                        <input type="hidden" name="txtSearch" value="${requestScope.SEARCH_VALUE}" />
                        <input type="submit" value="Comment" name="btAction" class="btn"/>
                    </form>
                    <br/>
                    <h3 class="border-bottom border-gray pb-2 mb-0">Comments</h3>
                    <c:forEach var="comments" items="${list}">
                        <div class="border-bottom border-gray pb-2 mb-0 " >
                            <p class="mb-1 text-muted">
                                <strong class="d-block text-gray-dark">${comments.name}</strong>
                                ${comments.comment}
                            </p><br/>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </c:if>

    </body>
</html>
