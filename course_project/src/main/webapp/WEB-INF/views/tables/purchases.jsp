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
<c:set var="purchasesActive" value="active" scope="request"/>
<c:import url="../layout/navigation.jsp"/>

<!-- Контент -->
<section class="mx-5 my-4 bg-light shadow-sm border rounded-3 min-vh-100 p-3">
    <h4 class="text-center">${title}</h4>

    <div class="row">

        <!-- Фильтр по периоду даты закупки -->
        <div class="col-auto mt-2">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dateRangeModal">
                Период даты закупки
            </button>
        </div>

        <!-- Сброс фильтра -->
        <div class="col-auto mt-2">
            <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/purchases">Сброс</a>
        </div>

    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Дата закупки</th>
            <th>Название</th>
            <th>Производитель</th>
            <th>Тип часов</th>
            <th>Цена закупки (&#8381;)</th>
            <th>Количество</th>
            <th>
                <a href="${pageContext.request.contextPath}/purchases/store" class="btn btn-success">Добавить</a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr class="align-middle">
                <td>${item.id}</td>
                <td>${Utils.dateToFormat(item.date)}</td>
                <td>${item.watch.name}</td>
                <td>${item.watch.manufacture.name}</td>
                <td>${item.watch.watchType.name}</td>
                <td>${item.price}</td>
                <td>${item.amount}</td>
                <td>
                    <!-- Изменение -->
                    <a href="${pageContext.request.contextPath}/purchases/update/${item.id}" class="btn btn-warning">
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


<!-- Фильтр по периоду даты закупки -->
<div class="modal fade" id="dateRangeModal" tabindex="-1"
     aria-labelledby="dateRangeLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form action='${pageContext.request.contextPath}/purchases/by-date-between'
                       mode="post"
                       modelAttribute="filter">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="dateRangeLabel">
                        Фильтр по периоду даты закупки
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-auto">
                            <div class="form-floating">
                                <form:input path="minDate" type="date" cssClass="form-control w-10rem"
                                            required="required" placeholder="_"/>
                                <form:label path="minDate" cssClass="form-label">Начальная дата</form:label>
                            </div>
                        </div>

                        <div class="col-auto">
                            <div class="form-floating">
                                <form:input path="maxDate" type="date" cssClass="form-control w-10rem"
                                            required="required" placeholder="_"/>
                                <form:label path="maxDate" cssClass="form-label">Конечная дата</form:label>
                            </div>
                        </div>
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