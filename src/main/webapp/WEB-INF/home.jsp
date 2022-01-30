<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <title>Home</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: lemonchiffon">
  <div class="container-fluid" style="background-color: lemonchiffon">
    <a class="navbar-brand" href="#">ClassicWeb</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo02" >
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Мои Посты</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Друзья</a> </li>
       <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal.id" var="user_id"/>
        <li class="nav-item"><a class="nav-link" href="<c:url value="/create-post/${user_id}"/>">Создать пост</a> </li>
       </sec:authorize>
      </ul>
      <div>
        <form class="d-flex" style="position: relative; top: 8px; left: -10%;">
        <input style="border-radius: 2rem;" class="form-control me-2" type="search" placeholder="Поиск" aria-label="Search">
        <%--<button class="btn btn-outline-success" style="background: blueviolet;" type="submit">Искать</button>
        --%>  <button class="btn btn-primary" type="button" style="border-radius: 2rem; border-color: deepskyblue; background-color:deepskyblue ">Искать</button>
      </form></div>
      <div class="nav-item dropdown" id="myDropdown2" style="left: -1%;">

        <sec:authorize access="isAuthenticated()">
          <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown" style="float: right">
            <sec:authentication property="principal.firstName"/> <sec:authentication property="principal.lastName"/></a>
          <ul class="dropdown-menu" style="left: -1%;">
            <sec:authentication property="principal.id" var="user_id"/>
            <li><a class="dropdown-item" href="<c:url value="/user/${user_id}"/>">Аккаунт</a></li>
            <sec:authentication property="principal.id" var="user_id"/>
            <li><form action="<c:url value="/logout"/>" method="post">
              <a class="dropdown-item" href="<c:url value="/logout"/>">Выйти</a></form></li>
          </ul>
        </sec:authorize>

        <sec:authorize access="!isAuthenticated()">
          <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown" style="float: right">Профиль</a>
          <ul class="dropdown-menu" style="left: -30%;">
            <li><a class="dropdown-item" href="<c:url value="/sign-in"/>">Войти</a></li>
            <li><a class="dropdown-item" href="<c:url value="/sign-up"/>">Регистрация</a></li>
          </ul>
        </sec:authorize>

      </div>
    </div>
  </div>
</nav>
</body>
</html>
