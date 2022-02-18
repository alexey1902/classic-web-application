<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>

<div class="position-absolute top-50 start-50 translate-middle">
    <div class="card" style="width: 30rem; height: 23rem;">
        <div class="card-header" aria-current="true" style="left: -20%; height: 20rem;">Заполните Форму</div>
        <form:form id="edit" action="/edit/${post_id}" modelAttribute="post" method="post">
            <ul class="list-group list-group-flush">
                <li class="list-group-item" >
                    <form:label path="title" class="form-label">
                        <form:input path="title" type="text" id="typeTextX-3"
                                    class="form-control form-control-lg"
                                    cssStyle="width: 27rem; position: center"
                                    name="title" placeholder="Заголовок" value="${post.title}"/>
                    </form:label>
                </li>
                <li class="list-group-item" style="height: 10rem;">
                    <form:label path="description" class="form-label">
                        <form:input path="description" type="text" id="typeTextX-3"
                                    class="form-control form-control-lg"
                                    cssStyle="width: 27rem; height: 7rem; position: relative"
                                    name="description" placeholder="Описание(не больше 255 символов)" value="${post.description}"/>
                    </form:label></li>
            </ul></form:form>
    </div>
    <div class="card-footer">
        <button form="edit" class="btn btn-primary btn-lg btn-block" type="submit">Редактировать Пост</button>
    </div>
</div>

</body>
</html>
