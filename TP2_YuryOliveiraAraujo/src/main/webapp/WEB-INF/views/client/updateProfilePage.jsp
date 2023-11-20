<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atualizar perfil</title>
</head>
<body>
    <p>Atualizar perfil</p>
    
    <form action="updateProfile">
    	<input type="hidden" name="id" value="${user.id}">
    	<input type="hidden" name="permission" value="${user.permission}">
    	<input type="hidden" name="confirmed" value="${user.confirmed}">
    	<input type="hidden" name="confirmationToken" value="${user.confirmationToken}">
        <label for="name">Nome:</label>
        <input type="text" id="name" name="name" value="${user.name}" readonly><br>
        <label for="cpf">CPF:</label>
        <input type="text" id="cpf" name="cpf" value="${user.cpf}" readonly><br>
        <label for="birthDate">Data de nascimento:</label>
        <input type="text" id="birthDate" name="birthDate" value="${user.birthDate.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}" readonly><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="${user.email}" readonly><br>
        <label for="phone">Telefone:</label>
        <input type="text" id="phone" name="phone" value="${user.phone}"><br>
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" value="${user.password}"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
