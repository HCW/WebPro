<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.dec{
	width:500px;
	height:100px;
}
</style>
</head>
<body>
<br>
<br>
<br>
<div align="left">
<form action="" method="post">
<table>
<tr align="left">商品编号：<input type="text" name=pid size=10></tr>
<tr align="left">&nbsp; 商品名称：<input type="text" name=pname></tr><br>
<tr align="left">商品描述：<input type="text" class="dec" name=pdec></tr><br>
<tr>商品价格：<input type="text" name=pprice size=5></tr><br>
<tr>商品数量：<input type="text" name=pcount size=5></tr><br>
<tr><input type="submit" value="添加"> &nbsp;&nbsp;<input type="reset" value="重置"></tr>
</table>
</form>
</div>
</body>
</html>