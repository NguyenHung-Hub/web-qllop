<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Insert title here</title>
        <link rel="stylesheet" href="base.css" />

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
                    value="Add student"
                    onclick="window.location.href='form.jsp'; return false;"
                    class="add-student-btn"
                />
                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>

                    <c:forEach var="tempStudent" items="${STUDENT_LIST}">
                        <c:url var="tempLink" value="StudentControllerServlet">
                            <c:param name="command" value="LOAD" />
                            <c:param
                                name="studentId"
                                value="${tempStudent.id }"
                            />
                        </c:url>

                        <c:url
                            var="deleteLink"
                            value="StudentControllerServlet"
                        >
                            <c:param name="command" value="DELETE" />
                            <c:param
                                name="studentId"
                                value="${tempStudent.id }"
                            />
                        </c:url>

                        <tr>
                            <td>${tempStudent.firstName }</td>
                            <td>${tempStudent.lastName }</td>
                            <td>${tempStudent.email}</td>
                            <td>
                                <a class="action" href="${tempLink }">Update</a>
                                <a
                                    class="action"
                                    href="${deleteLink}"
                                    onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false"
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
