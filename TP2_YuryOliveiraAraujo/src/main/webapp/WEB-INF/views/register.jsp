<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cadastro Petshop Cão Q-Late</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#cpf").mask("000.000.000-00");
            $("#phone").mask("(00) 00000-0000");

            function validateForm() {
                var cpf = $("#cpf").val();
                var name = $("#name").val();
                var birthDate = new Date($("#birthDate").val());
                var email = $("#email").val();
                var password = $("#password").val();
                var confirmPassword = $("#confirmPassword").val();
                var phone = $("#phone").val();
                var errorElement = $("#error-message");

                var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                var today = new Date();

                if (cpf === "") {
                    showError("Por favor, insira o CPF.");
                    return false;
                }

                if (name === "") {
                    showError("Por favor, insira o nome.");
                    return false;
                }

                if (birthDate === "Invalid Date" || birthDate >= today) {
                    showError("Por favor, insira uma data de nascimento válida e anterior à data atual.");
                    return false;
                }

                if (email === "" || !emailRegex.test(email)) {
                    showError("Por favor, insira um endereço de e-mail válido.");
                    return false;
                }

                if (password === "") {
                    showError("Por favor, insira a senha.");
                    return false;
                }

                if (confirmPassword !== password) {
                    showError("As senhas não coincidem. Por favor, verifique suas senhas.");
                    return false;
                }

                if (phone === "") {
                    showError("Por favor, insira o telefone.");
                    return false;
                }

                errorElement.text("");
                return true;
            }

            function showError(message) {
                var errorElement = $("#error-message");
                errorElement.html('<div class="alert alert-danger" role="alert">' + message + '</div>');
            }

            $("#registerForm").submit(function () {
                return validateForm();
            });
        });
    </script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h2 class="text-center">Cadastro</h2>
                    </div>
                    <div class="card-body">
                        <div id="error-message" class="mt-2"></div>
                        <form action="registerForm" method="post" id="registerForm">
                            <div class="form-group">
                                <label for="cpf">CPF:</label>
                                <input type="text" name="cpf" id="cpf" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="name">Nome:</label>
                                <input type="text" name="name" id="name" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="birthDate">Data de Nascimento:</label>
                                <input type="date" name="birthDate" id="birthDate" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" name="email" id="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password">Senha:</label>
                                <input type="password" name="password" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password">Confirmar Senha:</label>
                                <input type="password" id="confirmPassword" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="phone">Telefone:</label>
                                <input type="text" name="phone" id="phone" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-info btn-block" name="register">Cadastrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
