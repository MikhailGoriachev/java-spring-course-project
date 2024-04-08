<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">

<!-- Заголовки -->
<c:set var="title" value="Главная" scope="request"/>
<c:import url="layout/head.jsp"/>

<body>

<!-- Навигация -->
<c:set var="indexActive" value="active" scope="request"/>
<c:import url="layout/navigation.jsp"/>

<!-- Контент -->
<section class="mx-5 my-4 bg-light shadow-sm border rounded-3 min-vh-100 p-3">
    <div>
        <button class="btn btn-outline-primary my-2" data-bs-toggle="collapse" href="#collapsePart1" role="button"
                aria-expanded="false"
                aria-controls="collapsePart1">
            <span class="h5">Задание на курсовое проектирование по Java</span>
        </button>
        <div class="collapse show" id="collapsePart1">
            <p>
                Разработайте с использованием <b>Spring Web MVC</b>, контейнера сервлетов <b>Apache Tomcat</b>, СУБД <b>MySQL</b>
                базу данных, контроллеры с необходимыми действиями и набор представлений (JSP-страниц) для решения
                задачи – веб-приложения для реализации некоторых аспектов работы магазина часов.
            </p>

            <h6 class="text-primary">Магазин часов.</h6>
            <p>
                В базе данных хранится информация о часах, продающихся в магазине. Для работы с базой данных примените
                <b>ORM Hibernate</b>.
            </p>

            <h6 class="text-primary">Для часов необходимо хранить:</h6>
            
            <ul>
                <li>марку</li>
                <li>тип (кварцевые, механические)</li>
                <li>цену</li>
                <li>реквизиты производителя</li>
            </ul>

            <p>
                А также представление <b class="text-primary">«Часы на складе»</b>, в котором храним все поля таблицы
                часов и количество часов этого типа в наличии. Количество часов в наличии определять из таблиц закупок и
                продаж.
            </p>
            
            <h6 class="text-primary">Для производителей необходимо хранить реквизиты:</h6>
            
            <ul>
                <li>название</li>
                <li>страна</li>
            </ul>

            <h6 class="text-primary">Должны хранится также сведения о продавцах, поставках и продажах:</h6>
            
            <ul>
                <li>Сведения о продавцах – фамилия, имя, отчество, паспорт, процент от продажи</li>
                <li>Сведения о поставках – дата, поставленные часы, входная цена, количество</li>
                <li>Сведения о продажах – дата, продавец, проданные часы, цена продажи и количество проданных часов</li>
            </ul>
        </div>
    </div>

    <div>
        <button class="btn btn-outline-primary my-2" data-bs-toggle="collapse" href="#collapsePart2" role="button"
                aria-expanded="false"
                aria-controls="collapsePart2">
            <span class="h5">Разрабатываемые страницы</span>
        </button>
        <div class="collapse show" id="collapsePart2">
            <ul>
                <li>Главная страница с информацией о магазине (можете вывести это задание)</li>
                <li>Страница со сведениями о разработчике</li>
                <li>Страница/страницы для операций с таблицей часов: вывод, добавление, изменение</li>
                <li>Страница/страницы для операций с таблицей производителей: вывод, добавление, изменение</li>
                <li>Страница/страницы для операций с таблицей сведений о поставках: вывод, добавление, изменение</li>
                <li>Страница/страницы для операций с таблицей сведений о продажах (при выполнении продаж проверяйте наличие достаточного количества часов): вывод, добавление, изменение, удаление</li>
                <li>Страница/страницы для вывода отчетов – разрабатываемых запросов к базе данных</li>
            </ul>
        </div>
    </div>

    <div>
        <button class="btn btn-outline-primary my-2" data-bs-toggle="collapse" href="#collapsePart3" role="button"
                aria-expanded="false"
                aria-controls="collapsePart3">
            <span class="h5">Разрабатываемые запросы к базе данных</span>
        </button>
        <div class="collapse show" id="collapsePart3">
            <ol>
                <li>Вывести информацию о часах заданного типа (механические часы, смарт-часы, …)</li>
                <li>Вывести информацию о часах заданного типа, цена на которые в заданном диапазоне значений</li>
                <li>Вывести информацию о часах, произведенных в заданной стране</li>
                <li>Вывести продажи в магазине за указанный период</li>
                <li>Вывести поставки в магазине за указанный период</li>
                <li>Вывести остатки часов в магазине на текущую дату</li>
            </ol>
        </div>
    </div>
    
    <div>
        <button class="btn btn-outline-primary my-2" data-bs-toggle="collapse" href="#collapsePart4" role="button"
                aria-expanded="false"
                aria-controls="collapsePart4">
            <span class="h5">Количество записей в таблицах</span>
        </button>
        <div class="collapse show" id="collapsePart4">
            <ol>
                <li>Часы - не менее 25 записей</li>
                <li>Продавцы - не менее 10 записей</li>
                <li>Поставки – не менее 12 записей за два месяца</li>
                <li>Продажи - не менее 45 записей за два месяца</li>
                <li>Производители - не менее 15 записей</li>
            </ol>
        </div>
    </div>
    
    <h6 class="text-primary">Срок выполнения задания – до 29.04.2023.</h6>
</section>

<!-- Подвал -->
<c:import url="layout/footer.jsp"/>

</body>
</html>