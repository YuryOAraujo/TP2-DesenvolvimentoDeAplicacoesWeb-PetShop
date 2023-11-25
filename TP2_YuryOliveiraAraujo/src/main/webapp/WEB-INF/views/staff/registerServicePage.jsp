<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar serviço</title>
<jsp:include page="navbar.jsp"/>
</head>
<body>
	<div class="container">
        <h2 class="mb-4 py-3">Cadastrar serviço</h2>
        <form action="registerService" method="post">
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="price">Valor:</label>
                <input type="text" id="price" name="price" class="form-control" required>
            </div>
            
            <div class="text-center">
                <input type="submit" value="Cadastrar" class="btn btn-info my-3">
            </div>
        </form>
    </div>
</body>
</html>