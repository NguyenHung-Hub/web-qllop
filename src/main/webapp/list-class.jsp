<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Insert title here</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            table {
                font-family: Arial, Helvetica, sans-serif;
                border-spacing: 0;
                color: rgb(2, 2, 2);
            }

            th {
                text-align: left;
                font-size: 18px;
            }

            th,
            td {
                padding: 2px 8px;
                border: 1px solid #ccc;
            }

            tr:nth-child(even) {
                background: rgb(236, 236, 236);
            }

            tr:hover {
                background: rgb(154, 235, 255);
            }

            .action {
                display: inline-block;

                padding: 8px 16px;
                margin: 0 16px;
                background: rgb(0, 98, 190);

                text-decoration: none;
                color: rgb(255, 255, 255);

                border: 1px solid #ccc;
                border-radius: 8px;
            }

            .action:hover {
                background: rgb(94, 255, 80);
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="header">
                <h2>University</h2>
            </div>
        </div>

        <div class="container">
            <div class="content">
                <input
                    type="button"
                    value="Add "
                    onclick="window.location.href='add-class-form.jsp'; return false;"
                    class="add-btn"
                />
                <table>
                    <tr>
                        <th>Class Name</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>

                    <c:forEach var="tempClass" items="${CLASSROOM_LIST}">
                        <c:url
                            var="seeDetail"
                            value="StudentControllerServlet"
                        >
                            <c:param name="command" value="SHOWDETAIL" />
                            <c:param
                                name="classroomId"
                                value="${tempClass.id }"
                            />
                        </c:url>

                        <c:url
                            var="tempLink"
                            value="ClassroomControllerServlet"
                        >
                            <c:param name="command" value="LOAD" />
                            <c:param
                                name="classroomId"
                                value="${tempClass.id }"
                            />
                        </c:url>

                        <c:url
                            var="deleteLink"
                            value="ClassroomControllerServlet"
                        >
                            <c:param name="command" value="DELETE" />
                            <c:param
                                name="classroomId"
                                value="${tempClass.id }"
                            />
                        </c:url>

                        <tr>
                            <td>${tempClass.className }</td>
                            <td>${tempClass.classAddress }</td>

                            <td>
                                <a class="action" href="${seeDetail }"
                                    >See detail</a
                                >
                           
                                <a class="action" href="${tempLink }">Update</a>
                            
                                <a
                                    class="action"
                                    href="${deleteLink}"
                                    onclick="if (!(confirm('Are you sure you want to delete this classroom?'))) return false"
                                    >Delete</a
                                >
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
</html>
