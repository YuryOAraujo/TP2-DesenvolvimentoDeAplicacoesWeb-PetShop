<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro Petshop Cão Q-Late</title>
</head>
<body>
	<h2>Petshop Cão Q-Late - Cadastro</h2>
	
	<form action="registerForm" method="post">
		<p>CPF: <input type="text" name="cpf"></p>
		<p>Nome: <input type="text" name="name"></p>
		<p>Data de Nascimento: <input type="text" name="birthDate"></p>
		<p>Email: <input type="text" name="email"></p>
		<p>Senha: <input type="password" name="password"></p>
		<p>Telefone: <input type="text" name="phone"></p>
		<input type="submit" name="register">
	</form>
</body>
</html>