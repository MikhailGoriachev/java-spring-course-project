<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top shadow">
    <div class="container-fluid justify-content-center">

        <!-- Логотип -->
        <a class="navbar-brand mx-2" href="${pageContext.request.contextPath}/">
            <img class="logo" src="<c:url value="/resources/images/icon.svg"/>" alt="logo">
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav">

                <!-- Главная -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${indexActive}' href="${pageContext.request.contextPath}/">
                        Главная
                    </a>
                </li>

                <!-- Часы -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${watchesActive}' href="${pageContext.request.contextPath}/watches">
                        Часы
                    </a>
                </li>

                <!-- Закупки -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${purchasesActive}' href="${pageContext.request.contextPath}/purchases">
                        Закупки
                    </a>
                </li>
                
                <!-- Продажи -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${salesActive}' href="${pageContext.request.contextPath}/sales">
                        Продажи
                    </a>
                </li>

                <!-- Производители -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${manufacturesActive}' href="${pageContext.request.contextPath}/manufactures">
                        Производители
                    </a>
                </li>

                <!-- О разработчике -->
                <li class="nav-item">
                    <a class='nav-link mx-3 ${aboutActive}' href="${pageContext.request.contextPath}/about">
                        О разработчике
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>