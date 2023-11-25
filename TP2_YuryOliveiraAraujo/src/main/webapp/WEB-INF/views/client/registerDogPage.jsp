<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar cão</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
</head>
<body>

    <div class="container">
        <h2 class="py-3">Cadastrar cão</h2>
        <form action="registerDog" method="post">
            <div class="form-group">
                <label for="name">Nome do cão:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="breed">Raça:</label>
                <input type="text" id="breed" name="breed" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="size">Tamanho:</label>
                <select id="size" name="size" class="form-control" required>
                    <option value="SMALL">Pequeno</option>
                    <option value="MEDIUM">Médio</option>
                    <option value="LARGE">Grande</option>
                </select>
            </div>

			<div class="text-center my-3">
            	<button type="submit" class="btn btn-info">Cadastrar</button>
            </div>
        </form>
    </div>

</body>
</html>
