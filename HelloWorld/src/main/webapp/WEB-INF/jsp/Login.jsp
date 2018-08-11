<html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="css/login.css" type="text/css" />
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<div class="container">
        <div class="card card-container">
           
            <form:form class="form-signin" action="login" modelAttribute="user">
                <form:input path="username" type="text" id="inputEmail" class="form-control" placeholder="User Name" />
                <form:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password" />
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
            </form:form>
            
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
        </div>
    </div>
</body>
</html>
