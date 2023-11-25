<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Petshop Cão Q-Late - Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
	    function validateForm() {
	        var email = $("#email").val();
	        var password = $("#password").val();
	        var errorElement = $("#error-message");
	
	        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	
	        if (email === "" || !emailRegex.test(email) && email !== "admin") {
	            errorElement.html('<div class="alert alert-danger" role="alert">Por favor, insira um endereço de e-mail válido.</div>');
	            return false;
	        }
	
	        if (password === "") {
	            errorElement.html('<div class="alert alert-danger" role="alert">Por favor, insira sua senha.</div>');
	            return false;
	        }
	
	        errorElement.text("");
	        return true;
	    }
	</script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h2 class="text-center">Petshop Cão Q-Late</h2>
                    </div>
                    <div class="card-body">
                    	<div id="success-message" class="mt-2">
                            <c:if test="${not empty success}">
                                <div class="alert alert-success" role="alert">${success}</div>
                            </c:if>
                        </div>
                    
                    	<div id="error-message" class="mt-2">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger" role="alert">${error}</div>
                            </c:if>
                        </div>
                        <form action="login" method="post" id="loginForm" onsubmit="return validateForm()">
						    <div class="form-group">
						        <label for="email">Email:</label>
						        <input type="text" name="email" id="email" class="form-control" />
						    </div>
						    <div class="form-group">
						        <label for="password">Senha:</label>
						        <input type="password" name="password" id="password" class="form-control" />
						    </div>
						    <div class="text-center">
						        <button type="submit" class="btn btn-info">Entrar</button>
						    </div>
						    <div id="error-message" class="mt-2"></div>
						</form>
                        <p class="mt-3 text-center">
                            <a href="register">Não possui uma conta?</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
