<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.courseproject.app.utils.Utils" %>
<!DOCTYPE html>
<html lang="ru">

<!-- Заголовки -->
<c:import url="../layout/head.jsp"/>

<body>

<!-- Навигация -->
<c:set var="watchesActive" value="active" scope="request"/>
<c:import url="../layout/navigation.jsp"/>

<!-- Контент -->
<section class="mx-5 my-4 bg-light shadow-sm border rounded-3 min-vh-100 p-3">
    <h4 class="text-center">${title}</h4>
    
    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Название</th>
            <th>Производитель</th>
            <th>Тип часов</th>
            <th>В наличии (шт.)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr class="align-middle">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.manufacture.name}</td>
                <td>${item.watchType.name}</td>
                <td>${item.amount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    
    <!-- Управление -->
    <div class="mt-5 text-center">
        <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/watches">Назад</a>
    </div>
</section>

<!-- Подвал -->
<c:import url="../layout/footer.jsp"/>

</body>
</html>