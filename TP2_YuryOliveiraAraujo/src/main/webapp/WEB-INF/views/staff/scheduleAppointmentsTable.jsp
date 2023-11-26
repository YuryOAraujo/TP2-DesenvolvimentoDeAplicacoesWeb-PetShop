<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.lang.String" %>

<c:choose>
    <c:when test="${empty appointments}">
        <div class="empty-list">
            <i class="bi bi-exclamation-triangle-fill text-muted"></i>
            <p class="text-muted">Oops! Parece que nenhum serviço foi encontrado.</p>
        </div>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>Data</th>
                <th>Cão</th>
                <th>Serviços</th>
                <c:if test="${not empty total}">
                	<th>Valor</th>
                </c:if>
            </tr>

            <c:forEach var="appointment" items="${appointments}">
                <tr>
                    <td>${appointment.formattedScheduleDate}</td>
                    <td>${appointment.dog.name}</td>
                    <td>
                        <select>
                            <c:forEach var="service" items="${appointment.serviceList}">
                                <option>${service.name} - R$ ${service.price}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <c:if test="${not empty total}">
                    	<td class="price-mask">R$ ${String.format("%.2f", appointment.total)}</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        
        <div class="my-5">
        	<c:if test="${not empty total}">
                <tr>
                    <td colspan="3" class="bg-info text-white font-weight-bold">Total:</td>
                     <td class="bg-info text-white font-weight-bold price-mask">
			            R$ ${String.format("%.2f", total)}
			        </td>
                </tr>
            </c:if>
        </div>
    </c:otherwise>
</c:choose>
