<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Atualizar serviços</title>
<jsp:include page="navbar.jsp"/>
</head>
<body>
	<div class="container mt-4">
        <h2 class="my-3">Atualizar serviços</h2>
        
        <div id="success-message" class="mt-2">
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">${success}</div>
            </c:if>
        </div>
        
        <c:choose>
            <c:when test="${empty services}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que nenhum serviço foi encontrado. <a href="<c:url value='/scheduleServicePage'/>">Que tal cadastrar um agora?</a> </p>
                </div>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Preço</th>
                            <th>Atualizar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="service" items="${services}">
                            <tr>
                                <td>${service.name}</td>
                                <td class="price-mask">R$ ${service.price}</td>
                                <td>
                                    <a href="displayService?id=${service.id}" class="btn btn-info">Atualizar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>