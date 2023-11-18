<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar serviço</title>
</head>
<body>
	<p>Cadastrar serviço</p>
	<form action="registerService" method="post">
		<label for="name">Nome:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="breed">Valor:</label>
        <input type="text" id="price" name="price" required><br>
        
        <input type="submit" value="Cadastrar">
	</form>
</body>
</html>