<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        <title>Add classroom</title>
    </head>
    <body>
        <form action="ClassroomControllerServlet" method="GET">
            <input type="hidden" name="command" value="ADD" />

            <label>Class Name</label>
            <input type="text" name="className" /> <br />

            <label>Address</label>
            <input type="text" name="classAddress" /><br />
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>
