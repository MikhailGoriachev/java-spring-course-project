<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<!-- Заголовки -->
<c:set var="title" value='${isAdd ? "Добавление" : "Редактирование"} часов' scope="request"/>
<c:import url="../layout/head.jsp"/>

<body>

<!-- Навигация -->
<c:set var="watchesActive" value="active" scope="request"/>
<c:import url="../layout/navigation.jsp"/>

<!-- Контент -->
<div class="min-vh-100">
    <section class="w-25 mx-auto my-4 bg-light shadow-sm border rounded-3 p-3">
        <h4 class="text-center mb-4">${isAdd ? "Добавление" : "Редактирование"} часов</h4>

        <form:form action='${pageContext.request.contextPath}/watches/${isAdd ? "store" : "update"}'
                   mode="post"
                   modelAttribute="item">

            <!-- id -->
            <form:input path="id" type="hidden"/>

            <!-- Название -->
            <div class="form-floating my-3">
                <form:input path="name" cssClass="form-control" required="required"
                            placeholder="_"/>
                <form:label path="name" cssClass="form-label">Название (&#8381;)</form:label>
            </div>
            
            <!-- Производитель -->
            <div class="form-floating my-3">
                <form:select path="manufactureId" items="${manufactureList}" itemValue="id" itemLabel="infoString"
                             cssClass="form-select" required="required" placeholder="_"/>
                <form:label path="manufactureId" cssClass="form-label">Производитель</form:label>
            </div>
            
            <!-- Тип часов -->
            <div class="form-floating my-3">
                <form:select path="watchTypeId" items="${watchTypeList}" itemValue="id" itemLabel="name"
                             cssClass="form-select" required="required" placeholder="_"/>
                <form:label path="watchTypeId" cssClass="form-label">Тип часов</form:label>
            </div>
            
            <!-- Управление -->
            <div class="mt-5 text-center">
                <input class="btn btn-primary w-8rem me-2" type="submit"
                       value='${isAdd ? "Добавить" : "Сохранить"}'>
                <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/watches">Назад</a>
            </div>
        </form:form>
    </section>
</div>

<!-- Подвал -->
<c:import url="../layout/footer.jsp"/>

</body>
</html>