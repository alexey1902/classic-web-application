<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form id="sign-up" action="/sign-up" modelAttribute="user" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <h3 class="mb-5">Sign Up</h3>

    <div class="errors mb-5">
        <c:if test="${error != null}">
            <h5 class="mb-2" style="color: #b02a37">${error}</h5>
        </c:if>
        <div>
            <h5 class="mb-2" style="color: #b02a37"><form:errors path="firstName"/></h5>
        </div>
        <div>
            <h5 class="mb-2" style="color: #b02a37"><form:errors path="lastName"/></h5>
        </div>
        <div>
            <h5 class="mb-2" style="color: #b02a37"><form:errors path="email"/></h5>
        </div>
        <div>
            <h5 class="mb-2" style="color: #b02a37"><form:errors path="password"/></h5>
        </div>
    </div>

    <div class="form-outline mb-4">
        <form:label path="firstName" class="form-label">
            <form:input path="firstName" type="text" id="typeTextX-2"
                        class="form-control form-control-lg"
                        name="firstName" placeholder="First name" value="${user.firstName}"/>
        </form:label>
    </div>

    <div class="form-outline mb-4">
        <form:label path="lastName" class="form-label">
            <form:input path="lastName" type="text" id="typeTextX-3"
                        class="form-control form-control-lg"
                        name="lastName" placeholder="Last name" value="${user.lastName}"/>
        </form:label>
    </div>

    <div class="form-outline mb-4">
        <form:label path="username" class="form-label">
            <form:input path="username" type="text" id="typeTextX-3"
                        class="form-control form-control-lg"
                        name="username" placeholder="Username" value="${user.username}"/>
        </form:label>
    </div>

    <div class="form-outline mb-4">
        <form:label path="email" class="form-label">
            <form:input path="email" type="email" id="typeEmailX-2"
                        class="form-control form-control-lg"
                        name="email" placeholder="Email" value="${user.email}"/>
        </form:label>
    </div>

    <div class="form-outline mb-4">
        <form:label path="password" class="form-label">
            <form:input path="password" type="password" id="typePasswordX-2"
                        class="form-control form-control-lg"
                        name="password" placeholder="Password"/>
        </form:label>
    </div>

    <div class="form-outline mb-4">
        <label class="form-label">
            <input type="password" id="typePasswordX-3" class="form-control form-control-lg"
                   name="confirm" placeholder="Confirm password"/>
        </label>
    </div>

</form:form>

</body>
</html>
