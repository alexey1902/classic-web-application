<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Sign in</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</head>
<body>

<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem; background: lemonchiffon">
                    <div class="card-body p-5 text-center">
                        <form id="login" action="<c:url value="/sign-in"/>" method="post">

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <h4 class="mb-5">Sign In</h4>
                            <c:if test="${param['error'] != null}">
                                <h3 class="mb-5" style="color: #b02a37">Wrong Login Or Password</h3>
                            </c:if>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="email" id="typeEmailX-2" class="form-control form-control-lg"
                                           name="email" placeholder="Email"/></label></div>
                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="password" id="typePasswordX-2" class="form-control form-control-lg"
                                           name="password" placeholder="Password"/></label></div>
                        </form>

                        <button form="login" class="btn btn-primary btn-lg btn-block" type="submit" style="background: blueviolet">Login</button>

                        <hr class="my-4">

                        <a href="<c:url value="/sign-up"/>">
                            <input type="button" class="btn btn-primary btn-lg btn-block" value="Sign Up" style="background: blueviolet"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
