<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Atualizar perfil</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
</head>
<body>

    <div class="container">
        <h2 class="py-3">Atualizar perfil</h2>
        <form action="updateProfile">
            <input type="hidden" name="id" value="${user.id}">
            <input type="hidden" name="permission" value="${user.permission}">
            <input type="hidden" name="confirmed" value="${user.confirmed}">
            <input type="hidden" name="confirmationToken" value="${user.confirmationToken}">
            
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" value="${user.name}" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" value="${user.cpf}" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="birthDate">Data de nascimento:</label>
                <input type="text" id="birthDate" name="birthDate" value="${user.birthDate.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="${user.email}" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="phone">Telefone:</label>
                <input type="text" id="phone" name="phone" value="${user.phone}" class="form-control">
            </div>

            <div class="form-group">
                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" value="${user.password}" class="form-control">
            </div>

            <div class="text-center my-3">
                <input type="submit" value="Atualizar" class="btn btn-info">
            </div>
        </form>
    </div>

</body>
</html>
