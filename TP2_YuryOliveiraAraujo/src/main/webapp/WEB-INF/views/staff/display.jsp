<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar serviço - ${service.id}</title>
    <jsp:include page="navbar.jsp"/>
    <link rel="stylesheet" type="text/css" href="resources/css/styles.css">
</head>
<body>

<div class="container mt-4">
    <h3 class="text-info text-center">Atualizar serviço - ${service.id}</h3>
    
    <form action="updateService" method="post">
        <input type="hidden" name="id" value="${service.id}">
        
        <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" value="${service.name}" class="form-control" readonly>
        </div>
        
        <div class="form-group">
            <label for="price">Preço:</label>
            <input type="text" id="price" name="price" value="${service.price}" class="form-control">
        </div>

        <div class="text-center my-3">
            <input type="submit" value="Atualizar" class="btn btn-info">
        </div>
    </form>
</div>

</body>
</html>