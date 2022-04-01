<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Insert title here</title>
    </head>
    <body>
        <form action="ClassroomControllerServlet" method="GET">
            <input type="hidden" name="command" value="UPDATE" />
            <c:set var="st" scope="session" value="${THE_CLASSROOM}" />
            <input type="hidden" name="classroomId" value="${st.id }" />

            <label>Class Name</label>
            <input
                type="text"
                name="className"
                value="${st.className }"
            /><br />

            <label>Address</label>
            <input
                type="text"
                name="classAddress"
                value="${st.classAddress }"
            />
            <br />

            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
