<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Create Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar navbar-light" style="height: 10%; background-color: lemonchiffon; --bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ClassicWeb</a>
        <div class="collapse navbar-collapse" style="position: relative; top: 8px; left: 10px">
                <ol class="breadcrumb" >
                    <li class="breadcrumb-item"><a   href="<c:url value="/home"/>">Главная</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Создание Поста</li>
                </ol>
        </div>
    </div>
</nav>

<div class="position-absolute top-50 start-50 translate-middle">
    <div class="card" style="width: 30rem; height: 23rem;">
        <div class="card-header" aria-current="true" style="left: -20%; height: 20rem;">Заполните Форму</div>
        <form:form id="create" action="/create-post/${user_id}" modelAttribute="post" method="post">
        <ul class="list-group list-group-flush">
            <li class="list-group-item" >
                <form:label path="title" class="form-label">
                    <form:input path="title" type="text" id="typeTextX-3"
                                class="form-control form-control-lg"
                                cssStyle="width: 27rem; position: center"
                                name="title" placeholder="Заголовок" value="${post.title}"/>
                </form:label>
            </li>

            <sec:authentication property="principal.id" var="user_id_test"/>


            <li class="list-group-item" style="height: 10rem;">
                <form:label path="description" class="form-label">
                    <form:input path="description" type="text" id="typeTextX-3"
                            class="form-control form-control-lg"
                            cssStyle="width: 27rem; height: 7rem; position: relative"
                            name="description" placeholder="Описание(не больше 255 символов)" value="${post.description}"/>
                </form:label></li>
                <li class="list-group-item">
                <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Категории
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                    </div>
                </div>
                    <div class="accordion-item"></div></div>
           </li>
        </ul></form:form>
    </div>
    <div class="card-footer">
        <button form="create" class="btn btn-primary btn-lg btn-block" type="submit">Создать Пост</button>
    </div>
</div>

</body>
</html>
