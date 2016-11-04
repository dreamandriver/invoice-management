<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>

<html> 
<head>
    <title>一个frameset的例子</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
</head>
<frameset rows="56,*,29" frameborder="yes"  framespacing="0">
  <frame src="top.jsp" name="topFrame"  noresize="noresize" id="topFrame" title="topFrame" scrolling="no">
  <frame src="body.jsp" name="bodyFrame" id="bodyFrame" title="bodyFrame">
  <frame src="bottom.jsp" name="bottomFrame" noresize="noresize" id="bottomFrame" title="bottomFrame">
</frameset>
<noframes>
</noframes>
<body>
</body>
</html>