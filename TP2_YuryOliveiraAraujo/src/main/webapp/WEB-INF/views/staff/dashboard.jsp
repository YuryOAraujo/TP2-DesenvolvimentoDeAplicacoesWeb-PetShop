<%@page import="yoa.daw.model.Service"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Petshop Cão Q-Late - Funcionário</title>
    <jsp:include page="navbar.jsp"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".price-mask").mask("R$00.00", { reverse: true });
        });
    </script>
</head>
<body>
    <div class="container table-container">
        <h2 class="py-3">Serviços cadastrados</h2>
        <div id="success-message" class="mt-2">
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">${success}</div>
            </c:if>
        </div>

        <c:choose>
            <c:when test="${empty services}">
                <div class="empty-list">
                    <i class="bi bi-exclamation-triangle-fill text-muted"></i>
                    <p class="text-muted">Oops! Parece que ainda não temos serviços cadastrados. <a href="<c:url value='/registerServicePage'/>">Que tal adicionar um agora?</a></p>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="service" items="${services}">
                            <tr>
                                <td>${service.name}</td>
                                <td class="price-mask">R$ ${service.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
