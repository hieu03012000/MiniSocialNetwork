<%-- 
    Document   : showOwnPost
    Created on : Sep 24, 2020, 1:54:46 PM
    Author     : HIEUNGUYEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Post</title>
        <link href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            form{
                width:  600px;
                padding: 20px;
                display: inline-block;
            }
            p, h3, a{
                text-align: left;
                padding: 5px;
            }
            img{
                width: 325px;
                padding: 30px;
            }
            .row{
                margin-left: 0;
            }
            .btn{
                color: #3399FF;
                border: 1px solid;
                margin: 0px 10px;
            }
            .F{
                width: 500px;
            }
            p.descriptione{
                overflow: hidden;
                height: 50px;
            }

        </style>
    </head>
    <body class="text-center">
        <c:if test="${empty sessionScope}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <c:if test="${not empty sessionScope}">
            <div class="navbar navbar-dark bg-dark">
                <c:url var="url" value="DispatchController">
                    <c:param name="btAction" value="Search"/>
                    <c:param name="txtSearch" value="${requestScope.SEARCH_VALUE}"/>
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

                <nav id="sidebarMenu" class="col-md-3 col-lg-3 d-md-block bg-light sidebar collapse">
                    <div class="sidebar-sticky pt-3">
                        <h4>Notification: </h4>
                        <c:set var="noice" value="${sessionScope.NOICE}"/>
                        <ul class="nav flex-column mb-2">
                            <c:forEach var="n" items="${noice}">
                                <li class="nav-item">
                                    <c:url var="urlDetail" value="DispatchController">
                                        <c:param name="btAction" value="readMore"/>
                                        <c:param name="txtSearch" value="${requestScope.SEARCH_VALUE}"/>
                                        <c:param name="txtPostID" value="${n.postID}"/>
                                        <c:param name="isSearchPage" value="no"/>
                                    </c:url>
                                    <p><a href="${urlDetail}">${n.sender} is ${n.type} your ${n.title} article at ${n.date}</a></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-9 px-md-4">

                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                        <input type="submit" value="Add New Post" name="btAction" class="btn" data-toggle="modal" data-target="#exampleModalCenter"/>

                        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <form class="F" action="NewPostServlet" method="POST" enctype="multipart/form-data">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">New post</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p> Title: </p>
                                            <input class="form-control mr-sm-2" type="text" placeholder="Title" aria-label="Title" name="txtTitle" value="">
                                            <br/>
                                            <p> Description: </p>
                                            <textarea class="form-control mr-sm-2" placeholder="Description" aria-label="Description" name="txtDescription" value="" rows="4" cols="50"></textarea>
                                            <br/>
                                            <input type="hidden" name="isSearchPage" value="no" />
                                            <p> Image: </p>
                                            <p><input type="file" name="txtImage" value=""/></p>

                                        </div>
                                        <div class="modal-footer">
                                            <input type="submit" value="Close" class="btn" data-dismiss="modal"/>
                                            <input type="submit" value="Post" name="btAction" class="btn" />
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>

                    <c:set var="countPage" value="${requestScope.PAGE_COUNT}"/>
                    <c:forEach var="num" begin="${1}" end="${countPage}">
                        <form action="DispatchController" class="page">
                            <input type="hidden" name="btAction" value="Search" />
                            <input type="submit" class="btn page" value="${num}" name="btnPage" />
                            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                        </form>
                    </c:forEach>
                    <div class="row mb-2">

                        <c:set var="list" value="${sessionScope.LIST_BY_EMAIL}"/>
                        <c:if test="${not empty list}">
                            <c:forEach var="dto" items="${list}">
                                <div class="col-md-6">
                                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <h3 class="mb-0">${dto.title}</h3>
                                            <p class="mb-1 text-muted">${dto.date}</p>
                                            <p class="descriptione">${dto.description}</p>
                                            <c:url var="urlReadMore" value="DispatchController">
                                                <c:param name="btAction" value="readMore"/>
                                                <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                <c:param name="txtPostID" value="${dto.postID}"/>
                                            </c:url>
                                            <a href="${urlReadMore}">Read more</a>
                                            <c:url var="url" value="DispatchController">
                                                <c:param name="btAction" value="deletePost"/>
                                                <c:param name="txtPostID" value="${dto.postID}"/>
                                                <c:param name="isSearchPage" value="no"/>
                                            </c:url>
                                            <a href="${url}">Delete</a>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <img src="${dto.image}">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                </main>
            </div>
        </c:if>
    </body>
</html>
