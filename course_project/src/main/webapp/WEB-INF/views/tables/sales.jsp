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
<c:set var="salesActive" value="active" scope="request"/>
<c:import url="../layout/navigation.jsp"/>

<!-- Контент -->
<section class="mx-5 my-4 bg-light shadow-sm border rounded-3 min-vh-100 p-3">
    <h4 class="text-center">${title}</h4>

    <div class="row">

        <!-- Фильтр по периоду даты продажи -->
        <div class="col-auto mt-2">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dateRangeModal">
                Период даты продажи
            </button>
        </div>
        
        <!-- Фильтр по часам заданного типа, цена продажи на которые в заданном диапазоне значений -->
        <div class="col-auto mt-2">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#watchTypeAndPriceBetweenModal">
                Тип и диапазон цены
            </button>
        </div>

        <!-- Сброс фильтра -->
        <div class="col-auto mt-2">
            <a class="btn btn-secondary w-8rem" href="${pageContext.request.contextPath}/sales">Сброс</a>
        </div>

    </div>

    <table class="table table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>Дата продажи</th>
            <th>Продавец</th>
            <th>Название</th>
            <th>Производитель</th>
            <th>Тип часов</th>
            <th>Цена продажи (&#8381;)</th>
            <th>Количество</th>
            <th>
                <a href="${pageContext.request.contextPath}/sales/store" class="btn btn-success">Добавить</a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${items}">
            <tr class="align-middle">
                <td>${item.id}</td>
                <td>${Utils.dateToFormat(item.date)}</td>
                <td>${item.seller.surname} ${item.seller.name.charAt(0)}. ${item.seller.patronymic.charAt(0)}.</td>
                <td>${item.watch.name}</td>
                <td>${item.watch.manufacture.name}</td>
                <td>${item.watch.watchType.name}</td>
                <td>${item.price}</td>
                <td>${item.amount}</td>
                <td>
                    <!-- Изменение -->
                    <a href="${pageContext.request.contextPath}/sales/update/${item.id}" class="btn btn-warning">
                        <i class="bi bi-pencil-square"></i>
                    </a>

                    <!-- Удаление -->
                    <a href="${pageContext.request.contextPath}/sales/delete/${item.id}" class="btn btn-danger">
                        <i class="bi bi-trash3-fill"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</section>

<!-- Подвал -->
<c:import url="../layout/footer.jsp"/>


<!-- Фильтр по периоду даты продажи -->
<div class="modal fade" id="dateRangeModal" tabindex="-1"
     aria-labelledby="dateRangeLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form action='${pageContext.request.contextPath}/sales/by-date-between'
                       mode="post"
                       modelAttribute="filter">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="dateRangeLabel">
                        Фильтр по периоду даты продажи
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

<!-- Фильтр по часам заданного типа, цена продажи на которые в заданном диапазоне значений -->
<div class="modal fade" id="watchTypeAndPriceBetweenModal" tabindex="-1"
     aria-labelledby="watchTypeAndPriceBetweenLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form action='${pageContext.request.contextPath}/sales/by-watch-type-and-price-between'
                       mode="post"
                       modelAttribute="filter">

                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="watchTypeAndPriceBetweenLabel">
                        Фильтр по часам заданного типа, цена на которые в заданном диапазоне значений
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

                    <!-- Диапазон цены продажи -->
                    <div class="row">
                        <div class="col-auto">
                            <div class="form-floating">
                                <form:input path="minPrice" type="number" cssClass="form-control w-10rem"
                                            required="required" placeholder="_"/>
                                <form:label path="minPrice" cssClass="form-label">Мин. цена (&#8381;)</form:label>
                            </div>
                        </div>

                        <div class="col-auto">
                            <div class="form-floating">
                                <form:input path="maxPrice" type="number" cssClass="form-control w-10rem"
                                            required="required" placeholder="_"/>
                                <form:label path="maxPrice" cssClass="form-label">Макс. цена (&#8381;)</form:label>
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
