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

    <div class="row">

        <!-- Фильтр по типу часов -->
        <div class="col-auto mt-2">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#watchTypeModal">
                Тип часов
            </button>
        </div>
        
        <!-- Фильтр по стране производителя -->
        <div class="col-auto mt-2">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#manufactureCountryModal">
                Страна производителя
            </button>
        </div>
        
        <!-- Склад -->
        <div class="col-auto mt-2">
            <a class="btn btn-success w-8rem" href="${pageContext.request.contextPath}/watches/stock">Склад</a>
        </div>

        <!-- Сброс фильтра -->
        <div class="col-auto mt-2">
            <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/watches">Сброс</a>
        </div>

    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Название</th>
            <th>Производитель</th>
            <th>Тип часов</th>
            <th>
                <a href="${pageContext.request.contextPath}/watches/store" class="btn btn-success">Добавить</a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr class="align-middle">
                <td>${item.id}</td>
                <td>${item.name}</td>
                <td>${item.manufacture.name}</td>
                <td>${item.watchType.name}</td>
                <td>
                    <!-- Изменение -->
                    <a href="${pageContext.request.contextPath}/watches/update/${item.id}" class="btn btn-warning">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<!-- Подвал -->
<c:import url="../layout/footer.jsp"/>


<!-- Фильтр по типу часов -->
<div class="modal fade" id="watchTypeModal" tabindex="-1"
     aria-labelledby="watchTypeLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form action='${pageContext.request.contextPath}/watches/by-watch-type'
                       mode="post"
                       modelAttribute="filter">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="watchTypeLabel">
                        Фильтр по типу часов
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <!-- Тип часов -->
                    <div class="form-floating my-3">
                        <form:select path="watchTypeName" items="${watchTypeList}" itemValue="name" itemLabel="name"
                                     cssClass="form-select" required="required" placeholder="_"/>
                        <form:label path="watchTypeName" cssClass="form-label">Тип часов</form:label>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Назад</button>
                    <button type="submit" class="btn btn-primary">Выбрать</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Фильтр по стране производителя -->
<div class="modal fade" id="manufactureCountryModal" tabindex="-1"
     aria-labelledby="manufactureCountryLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form action='${pageContext.request.contextPath}/watches/by-manufacture-country'
                       mode="post"
                       modelAttribute="filter">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="manufactureCountryLabel">
                        Фильтр по стране производителя
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <!-- Страна производителя -->
                    <div class="form-floating my-3">
                        <form:select path="manufactureCountryName" items="${countryList}" itemValue="name" itemLabel="name"
                                     cssClass="form-select" required="required" placeholder="_"/>
                        <form:label path="manufactureCountryName" cssClass="form-label">Страна производителя</form:label>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Назад</button>
                    <button type="submit" class="btn btn-primary">Выбрать</button>
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>