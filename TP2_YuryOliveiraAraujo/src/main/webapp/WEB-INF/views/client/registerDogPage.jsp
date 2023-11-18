<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar cão</title>
</head>
<body>
	<p>Cadastrar cão</p>
	<form action="registerDog" method="post">
	 	<label for="name">Nome do cão:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="breed">Raça:</label>
        <input type="text" id="breed" name="breed" required><br>

        <label for="size">Tamanho:</label>
        <select id="size" name="size" required>
            <option value="SMALL">Pequeno</option>
            <option value="MEDIUM">Médio</option>
            <option value="LARGE">Grande</option>
        </select><br>

        <input type="submit" value="Cadastrar">
	</form>
</body>
</html>