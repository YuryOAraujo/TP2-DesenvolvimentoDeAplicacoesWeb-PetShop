<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Petshop Cão Q-Late - Cliente</title>
    <jsp:include page="navbar.jsp"/>
</head>
<body>
    <div class="container table-container">
        <h2 class="py-3">Meus Cães</h2>

        <c:choose>
            <c:when test="${empty dogs}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que ainda não temos informações sobre os seus cãezinhos. <a href="<c:url value='/registerDogPage'/>">Que tal adicionar um agora?</a></p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Raça</th>
                            <th>Tamanho</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dog" items="${dogs}">
                            <tr>
                                <td>${dog.name}</td>
                                <td>${dog.breed}</td>
                                <td>${dog.size.size}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
