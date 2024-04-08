<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<!-- Заголовки -->
<c:set var="title" value='${isAdd ? "Добавление" : "Редактирование"} продажи' scope="request"/>
<c:import url="../layout/head.jsp"/>

<body>

<!-- Навигация -->
<c:set var="salesActive" value="active" scope="request"/>
<c:import url="../layout/navigation.jsp"/>

<!-- Контент -->
<div class="min-vh-100">
    <section class="w-25 mx-auto my-4 bg-light shadow-sm border rounded-3 p-3">
        <h4 class="text-center mb-4">${isAdd ? "Добавление" : "Редактирование"} продажи</h4>

        <form:form action='${pageContext.request.contextPath}/sales/${isAdd ? "store" : "update"}'
                   mode="post"
                   modelAttribute="item">

            <!-- id -->
            <form:input path="id" type="hidden"/>
            
            <!-- Дата продажи -->
            <div class="form-floating my-3">
                <form:input path="date" type="date" cssClass="form-control" required="required"
                            placeholder="_" disabled="${isAdd}" />
                <form:label path="date" cssClass="form-label">Дата продажи</form:label>
            </div>
            
            <!-- Продавец -->
            <div class="form-floating my-3">
                <form:select path="sellerId" items="${sellerList}" itemValue="id" itemLabel="infoString"
                             cssClass="form-select" required="required" placeholder="_"/>
                <form:label path="sellerId" cssClass="form-label">Продавец</form:label>
            </div>
            
            <!-- Часы -->
            <div class="form-floating my-3">
                <form:select path="watchId" items="${watchList}" itemValue="id" itemLabel="infoString"
                             cssClass="form-select" required="required" placeholder="_"/>
                <form:label path="watchId" cssClass="form-label">Часы</form:label>
            </div>

            <!-- Цена продажи -->
            <div class="form-floating my-3">
                <form:input path="price" type="number" min="1" cssClass="form-control" required="required"
                            placeholder="_"/>
                <form:label path="price" cssClass="form-label">Цена продажи (&#8381;)</form:label>
            </div>
            
            <!-- Количество -->
            <div class="form-floating my-3">
                <form:input path="amount" type="number" min="1" cssClass="form-control" required="required"
                            placeholder="_"/>
                <form:label path="amount" cssClass="form-label">Количество</form:label>
            </div>

            <!-- Сообщение об ошибки -->
            <c:if test="${errorMessage.length() > 0}">
                <p class="text-danger">${errorMessage}</p>
            </c:if>
            
            <!-- Управление -->
            <div class="mt-5 text-center">
                <input class="btn btn-primary w-8rem me-2" type="submit"
                       value='${isAdd ? "Добавить" : "Сохранить"}'>
                <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/sales">Назад</a>
            </div>
        </form:form>
    </section>
</div>

<!-- Подвал -->
<c:import url="../layout/footer.jsp"/>

</body>
</html>