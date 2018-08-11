<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Students</title>
</head>
<body>
<h1 align="center">All Students</h1>
	<button
		onclick="window.location.href = 'showFormForAdd'; return false;">Add
		Student</button>
 
	<hr />
 
	
		<table border="1">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Hobbies</th>
				<th>City</th>
				<th>Address</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${studentsList}" var="s">
				
				<tr>
					<td><c:out value="${s.name}"/></td>
					<td><c:out value="${s.email}"/></td>
					<td><c:out value="${s.gender}"/></td>
					<td><c:out value="${s.hobbies}"/></td>
					<td><c:out value="${s.city}"/></td>
					<td><c:out value="${s.address}"/></td>
					<td><a href="displayUpdateForm?studentId=<c:out value='${s.id}'/>">Update</a> | <a
						href="displayDeleteForm?studentId=<c:out value='${s.id}'/>"
						onclick="if(!(confirm('Are you sure want to delete this Student permanently?'))) return false">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	
</body>
</html>