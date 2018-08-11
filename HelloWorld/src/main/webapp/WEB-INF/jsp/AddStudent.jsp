<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="css/addStudent.css" type="text/css" />

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	
<title>Add Student</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var hobbies = $("#hobbies").val().split(",");
			var $checkboxes = $("input[type=checkbox]");
			$checkboxes.each(function(idx, element) {
				if (hobbies.indexOf(element.value) != -1) {
					element.setAttribute("checked", "checked");
					$("#hobbies").val("");
				} else {
					element.removeAttribute("checked");
				}
			});
		});
		
		function uploadFormData(){
		    $('#result').html('');
		  $.ajax({
		    url: 'uploadFile',
		    data: new FormData(document.getElementById("fileForm")),
		    processData: false,
		    contentType: false,
		    type: 'POST',
		    enctype: 'multipart/form-data',
		  }).done(function(data){
			      $('#result').append(data);
			      $('#message').html("<span style='color:green'>File uploaded successfully!</span>");
			    });
		}
	</script>
<style>

form_main {
    width: 60%;
}
.form_main h4 {
    font-family: roboto;
    font-size: 20px;
    font-weight: 300;
    margin-bottom: 15px;
    margin-top: 20px;
    text-transform: uppercase;
}
.heading {
    border-bottom: 1px solid #fcab0e;
    padding-bottom: 9px;
    position: relative;
}
.heading span {
    background: #9e6600 none repeat scroll 0 0;
    bottom: -2px;
    height: 3px;
    left: 0;
    position: absolute;
    width: 75px;
}   
.form {
    border-radius: 7px;
    padding: 6px;
}
.txt[type="text"] {
    border: 1px solid #ccc;
    margin: 10px 0;
    padding: 10px 0 10px 5px;
    width: 100%;
}
.txt_3[type="text"] {
    margin: 10px 0 0;
    padding: 10px 0 10px 5px;
    width: 100%;
}
.txt2[type="submit"] {
    background: #242424 none repeat scroll 0 0;
    border: 1px solid #4f5c04;
    border-radius: 25px;
    color: #fff;
    font-size: 16px;
    font-style: normal;
    line-height: 35px;
    margin: 10px 0;
    padding: 0;
    text-transform: uppercase;
    width: 30%;
}
.txt2[type="reset"] {
    background: #242424 none repeat scroll 0 0;
    border: 1px solid #4f5c04;
    border-radius: 25px;
    color: #fff;
    font-size: 16px;
    font-style: normal;
    line-height: 35px;
    margin: 10px 0;
    padding: 0;
    text-transform: uppercase;
    width: 30%;
}
.txt2:hover {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    color: #5793ef;
    transition: all 0.5s ease 0s;
}


</style>
	
	
</head>
<body>
<div class="container">
	<div class="row">
    <div class="col-md-4">
		<div class="form_main">
                <h4 class="heading"><strong>Provide </strong>Student Information  <span></span></h4>
                <div class="form">
                <form:form action="saveProcess" modelAttribute="student">
                	<form:hidden path="id" />
					<form:hidden path="" value="${student.hobbies}" id="hobbies" />
                    <form:input path="name" required="" placeholder="Full Name" value="" name="name" class="txt"/>
                    <form:input path="email" required="" placeholder="Please input your Email" value="" name="email" class="txt"/>
                    <form:radiobutton path="gender" value="Male" class="txt2"/>Male
                    <form:radiobutton path="gender" value="Female" class="txt2"/>Female
                    <p><strong>Hobbies</strong></p>
                    <form:checkbox path="hobbies" value="Cricket" class="txt2"/>Cricket <form:checkbox
						path="hobbies" value="Football" class="txt2"/>Football <form:checkbox
						path="hobbies" value="Volleyball" class="txt2"/>Volleyball <form:checkbox
						path="hobbies" value="Hockey" class="txt2"/>Hockey
					 <p><strong>City</strong></p>
					 <form:select path="city" class="txt2">
						<form:option value="0">--Select--</form:option>
						<form:option value="Banglore">Banglore</form:option>
						<form:option value="Kolkata">Kolkata</form:option>
						<form:option value="Mumbai">Mumbai</form:option>
						<form:option value="Chennai">Chennai</form:option>
						<form:option value="Pune">Pune</form:option>
						<form:option value="Delhi">Delhi</form:option>
					</form:select>
                	 <form:textarea path="address" placeholder="Address" name="mess" type="text" class="txt_3"/>
                     <input type="submit" value="Save" class="txt2"/> 
                     <input type="reset" value="Reset" class="txt2" />
                </form:form>
                <hr />
				<a href="list">Back to List</a>
            </div>
            </div>
            
            </div>
            
            <div class="col-md-4">
			<div class="form_main">
	                <h4 class="heading"><strong>Upload </strong>Image<span></span></h4>
	                <div class="form">
	                 <div id="message"></div>
	                <form id="fileForm">
	                	File to upload: <input name="file2" id="file2" type="file" /><br /> <br /> 
						<button id="btnUpload" type="button" onclick="uploadFormData()">Upload file</button> Press here to upload the file!
	                </form>
	                <div id="result"></div>
	            </div>
	            </div>
            
            </div>
	</div>
</div>


	
</body>
</html>