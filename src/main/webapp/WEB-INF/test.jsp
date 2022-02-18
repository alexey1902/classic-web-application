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


<%-- <div class="container">
          <div class="row align-items-start">
      <div class="col"><button type="button" class="btn btn-primary">Like</button></div>
      <div class="col"><button type="button" class="btn btn-primary">Comment</button></div>
      <div class="col"><button type="button" class="btn btn-primary">Edit</button></div></div></div>--%>

<%--</div>--%>

<%--<div class="card-body">
    <c:forEach items="${posts}" var="post">
        <tr>
            <td>${post.title}</td>
            <td>${post.description}</td>
        </tr>
    </c:forEach>
</div>--%>
<%--<div class="row d-flex justify-content-center align-items-center h-25 container">--%>

<form:form id="edit" action="/edit/${user_id}/${post.id}" method="get"></form:form>
<%-- <button type="submit" class="btn btn-outline-primary" formaction="/edit/${post.id}">Edit</button>--%>
<button form="edit" type="submit" class="btn btn-outline-primary">Edit</button>



/*    @GetMapping("/edit/{post_id}")
public String editPost(@PathVariable long post_id, Model model){
Post post = postRepository.getById(post_id);
model.addAttribute("post", post);
return "edit_post";
}*/


/*
@PostMapping("/edit/{post_id}")
public String editPost(@ModelAttribute("post") Post post, @PathVariable long post_id){
Post postToUpdate = postRepository.getById(post_id);
postToUpdate.setTitle(post.getTitle());
postToUpdate.setDescription(post.getDescription());
postRepository.save(postToUpdate);
return "redirect:/home";
}
*/


/* @Column(name = "local_date_time", nullable = false)
@JsonFormat(pattern = ("yyyy-MM-dd HH:mm:ss"))
private LocalDateTime localDateTime;*/

/*
@PostMapping("/edit/{user_id}/{post_id}")
public String editPost(@ModelAttribute("post") Post post, @PathVariable long post_id, @PathVariable long user_id){
Post postToUpdate = postRepository.getById(post_id);
postToUpdate.setTitle(post.getTitle());
postToUpdate.setDescription(post.getDescription());
postRepository.save(postToUpdate);
return "redirect:/show-posts/" + postToUpdate.getPostOwner().getId();
}
*/


/*
@GetMapping("/create-post/{user_id}")
public String newPost(@PathVariable long user_id, @ModelAttribute("post") Post post, Model model){
//model.addAttribute("user", userRepository.getById(user_id));
model.addAttribute("post", post);
return "create_post";
}
*/


/*    @GetMapping("/create-post/{user_id}")
public String newPost(@ModelAttribute("post") Post post, @PathVariable long user_id){
return "create_post";
}

@PostMapping("/create-post/{user_id}")
public String createPost(@ModelAttribute("post") Post post, @PathVariable long user_id){
modification.create(user_id, post);
return "redirect:/home";
}*/
