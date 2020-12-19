<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URL,java.net.URLConnection,java.io.InputStream,java.io.BufferedReader,java.io.InputStreamReader" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>疫情地图</title>
<script type="text/javascript">
		<%
				//1. 创建一个url对象。u1
				URL u1 = new URL("https://zaixianke.com/yq/all");
				//2、（建立连接），通过网址u1,打开网络连接，并得到连接对象conn
				URLConnection conn = u1.openConnection();
				//3、(获取数据传输的流),通过连接对象conn，获取输入流is
				InputStream is = conn.getInputStream();
				//4、将输入流is，装饰为一次能读取一行的  缓冲字符输入流
				BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
				//5、读取内容
				String text1 = br.readLine();
				System.out.println(text1);
				//6、关闭流
				br.close();
		%>



    		var data = <%=text1 %>
    		</script>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.7.0/echarts.min.js"></script> 
<script src="http://cdn.zaixianke.com/china.js"></script>
<script src="http://cdn.zaixianke.com/world.js"></script>
</head>
<body>
<div id="main" style="width: 100%;height:600px;"></div> <br>
<div style="text-align:center">
		<a style="color:#333" class="control" align="center" href="javascript:updateMap(0)">国内累计</a>
		<a style="color:#333" class="control" align="center" href="javascript:updateMap(1)">国内新增</a>
		<a style="color:#333" class="control" align="center" href="javascript:updateMap(2)">全球累计</a>
		<a style="color:#333" class="control" align="center" href="javascript:updateMap(3)">全球新增</a>
</div>
<script src="control.js"></script>
</body>
</html>