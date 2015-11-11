<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>User Page</title>
    <style type="text/css">

        .paging-nav {
            text-align: right;
            padding-top: 2px;
        }

        .paging-nav a {
            margin: auto 1px;
            text-decoration: none;
            display: inline-block;
            padding: 1px 7px;
            background: #91b9e6;
            color: white;
            border-radius: 3px;
        }

        .paging-nav .selected-page {
            background: #187ed5;
            font-weight: bold;
            margin-left: 10px;
        }

        .paging-nav,
        #tableData {
            width: 400px;
            margin: 10px;
            font-family: Arial, sans-serif;
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            margin-left: 20px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<h1>
    Add a User
</h1>

<c:url var="addAction" value="/user/add"></c:url>

<form:form action="${addAction}" commandName="user">
    <table>
        <c:if test="${!empty user.name}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>
            <td>
                <form:input path="age"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="admin">
                    <spring:message text="Admin"/>
                </form:label>
            </td>
            <td>
                <form:checkbox path="admin"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Edit User"/>"/>
                </c:if>
                <c:if test="${empty user.name}">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
<br>

<form action="/users">
    Search By Name: <input type="text" name="nameFilter">
    <input type="submit" value="Search">
</form>
<form action="/users">
    <input type="submit" value="Show All">
</form>
<h3>Users List</h3>
<c:if test="${!empty listUsers}">
    <table class="tg" id="tableData" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th width="80">User ID</th>
            <th width="120">User Name</th>
            <th width="60">User Age</th>
            <th width="60">Is Admin?</th>
            <th width="60">Created date</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUsers}" var="user">
            <c:if test="${(user.name == param.nameFilter) or (param.nameFilter == null) }">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td>${user.admin}</td>
                    <td>${user.createddate}</td>
                    <td><a href="<c:url value='/edit/${user.id}' />">Edit</a></td>
                    <td><a href="<c:url value='/remove/${user.id}' />">Delete</a></td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resources/js/paging.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tableData').paging({limit: 5});
        });
    </script>
</c:if>
</body>
</html>
