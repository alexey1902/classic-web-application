<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <title>Comments</title>
</head>

<body>

<form:form id="create" action="/leave-comment/${comment.relatedPost.id}" modelAttribute="comment" method="post">
    <ul class="list-group list-group-flush">
        <li class="list-group-item" style="height: 10rem;">
            <form:label path="description" class="form-label">
                <form:input path="description" type="text" id="typeTextX-3"
                            class="form-control form-control-lg"
                            cssStyle="width: 27rem; height: 7rem; position: relative"
                            name="description" placeholder="Описание(не больше 255 символов)" value="${comment.description}"/>
            </form:label></li>
    </ul></form:form>
<div class="card-footer">
    <button form="create" class="btn btn-primary btn-lg btn-block" type="submit">Комментировать</button>
</div>

<div class="position-absolute bottom-70 start-50 translate-middle-x">
    <div class="row gy-4">
        <c:forEach items="${comments}" var="comment">
            <article class="card-group-item">
                <div class="card" style="width: 25rem;">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">${comment.commentOwner.username}</li>
                        <li class="list-group-item">${comment.description}</li>
                        <li class="list-group-item">${comment.localDate}</li>
                    </ul>
                    <div class="card-footer">
                        <div class="btn-group" role="group" aria-label="Basic outlined example"></div>
                    </div>
                </div>
            </article>
        </c:forEach>
    </div>
</div>
</body>

</html>
