<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<!-- Заголовки -->
<c:set var="title" value="О разработчике" scope="request"/>
<c:import url="layout/head.jsp"/>

<body>

<!-- Навигация -->
<c:set var="aboutActive" value="active" scope="request"/>
<c:import url="layout/navigation.jsp"/>

<!-- Контент -->
<div class="min-vh-100">
    <section class="w-50 mx-auto my-4 bg-light shadow-sm border rounded-3 p-3">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="border rounded bg-white shadow-sm">
                        <img class="w-100" src="${pageContext.request.contextPath}/resources/images/icon.svg" alt="">
                    </div>
                </div>
                <div class="col-auto">
                    <ul class="list-group shadow-sm">
                        <li class="list-group-item">
                            Разработчик:
                            <a href="https://github.com/MikhailGoriachev" target="_bank">
                                <b>Горячев Михаил</b>
                            </a>
                        </li>
                        <li class="list-group-item">
                            Группа: <b>ПД011</b>
                        </li>
                        <li class="list-group-item">
                            Город: <b>Донецк</b>
                        </li>
                        <li class="list-group-item">
                            Год создания: <b>2022</b>
                        </li>
                        <li class="list-group-item">
                            Поддержка:
                            <a href="mailto:goriachevmichael@gmail.com">
                                <b>goriachevmichael@gmail.com</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Подвал -->
<c:import url="layout/footer.jsp"/>

</body>
</html>