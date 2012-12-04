<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="./src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="./src/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./src/schulverwaltung.js"></script>
<style type="text/css">
	.slide{
		width:40%%;
	}
	label{
		width:10%;
	}
	input[type=text]{
		width:70%;
	}
	html{
		height:500px;
	}
	.fachCount{
  	  width:35px;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<label for="exelfile">Excel hochladen: </label><input type="file" name="exelfile" id="exelfile"/>
	<br/>
	<input type="submit" value="absenden"/>
</body>
</html>