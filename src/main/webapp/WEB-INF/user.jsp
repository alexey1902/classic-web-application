<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</head>
<body>
<div class="container align-items-center mt-5">
    <table class="table table-bordered table-striped table-hover align-middle">
        <caption class="caption-top text-center mt-5"><h2>User information</h2></caption>
        <tbody>
        <tr>
            <td>Имя</td>
            <td>${user.firstName}</td>
        </tr>
        <tr>
            <td>Фамилия</td>
            <td>${user.lastName}</td>
        </tr>
        <tr>
            <td>Почта</td>
            <td>${user.email}</td>
        </tr>
        <tr>
            <td>Роль</td>
            <td>${user.role}</td>
        </tr>
        </tbody>
    </table>
    <c:if test="${user.id eq user_id}">
        <form action="/user/${user.id}/edit" method="get">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit"><spring:message code="label.actions.edit"/></button>
        </form>
    </c:if>
</div>
</body>
</html>
