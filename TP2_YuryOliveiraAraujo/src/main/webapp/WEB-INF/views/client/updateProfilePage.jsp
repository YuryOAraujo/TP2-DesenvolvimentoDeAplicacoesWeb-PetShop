<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Atualizar perfil</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#phone").mask("(00) 00000-0000");

            function validateForm() {
                var phone = $("#phone").val();
                var password = $("#password").val();
                var confirmPassword = $("#confirmPassword").val();
                var errorElement = $("#error-message");

                if (phone === "") {
                    errorElement.html('<div class="alert alert-danger" role="alert">Por favor, insira o telefone.</div>');
                    return false;
                }

                if (password === "") {
                    errorElement.html('<div class="alert alert-danger" role="alert">Por favor, insira a senha.</div>');
                    return false;
                }

                if (confirmPassword === "") {
                    errorElement.html('<div class="alert alert-danger" role="alert">Por favor, confirme a senha.</div>');
                    return false;
                }

                if (password !== confirmPassword) {
                    errorElement.html('<div class="alert alert-danger" role="alert">As senhas não coincidem.</div>');
                    return false;
                }

                errorElement.text("");
                return true;
            }

            $("form").submit(function () {
                return validateForm();
            });
        });
    </script>
</head>
<body>

    <div class="container">
        <h2 class="py-3">Atualizar perfil</h2>
        <form action="updateProfile">
        	 <div id="error-message" class="text-danger my-2"></div>
        
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

            <div class="form-group">
                <label for="confirmPassword">Confirmar Senha:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control">
            </div>
          
            <div class="text-center my-3">
                <input type="submit" value="Atualizar" class="btn btn-info">
            </div>
        </form>
    </div>

</body>
</html>
