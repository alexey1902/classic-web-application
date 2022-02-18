<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar navbar-light"
     style="height: 10%; background-color: lemonchiffon; --bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ClassicWeb</a>
        <div class="collapse navbar-collapse" style="position: relative; top: 8px; left: 10px">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<c:url value="/home"/>">Главная</a></li>
                <li class="breadcrumb-item active" aria-current="page">Мои Посты</li>
            </ol>
        </div>
    </div>
</nav>
<div class="position-absolute bottom-70 start-50 translate-middle-x">
    <div class="row gy-4">
        <c:forEach items="${posts}" var="post">
            <article class="card-group-item">
                <div class="card" style="width: 25rem;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">${post.title}</li>
                        <li class="list-group-item" style="height: 5rem">${post.description}</li>
                    </ul>
                    <div class="card-footer">
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                            <button type="button" class="btn btn-outline-primary">Likes</button>
                            <form:form id="edit" action="/leave-comment/${post.id}" method="get"><button type="submit" class="btn btn-outline-primary" formmethod="get">Comments</button></form:form>
                            <form:form id="edit" action="/edit/${post.id}" method="get"><button type="submit" class="btn btn-outline-primary" formmethod="get">Edit</button></form:form>
                            <form:form id="delete" action="/delete/${post.id}" method="get"><button type="submit" class="btn btn-outline-primary" formmethod="get">Delete</button></form:form>
                        </div>
                    </div>
                </div>
            </article>
    </c:forEach>
    </div>
</div>
</body>
</html>
