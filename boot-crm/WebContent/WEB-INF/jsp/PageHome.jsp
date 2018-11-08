<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ONE PIECE</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
	<link type="text/css" href="<%=basePath%>css/css.css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.js"></script>	
</head>
<body>
	    <div class="history">
        <div class="start-history">
            <p class="cc_history">发展简史</p>
            <p class="next_history">One Piece</p>
            <div class="history_left">
                <p class="history_L year2006">
                    <span class="history_2006_span">2009</span>
                    <b class="history_2006_b">
                        <span class="history_l_month">10<br/>月</span>
                        <span class="history_l_text">基于互联网的CRM管理系统<br/>One peice联盟正式公测</span>
                    </b>
                </p>
                <p class="history_L yearalmost">
                    <span class="history_2006_span">2011</span>
                    <b class="history_2006_b">
                        <span class="history_l_month">10<br/>月</span>
                        <span class="history_l_text">收购南苑<br/>旗下计算机工程系supper</span>
                    </b>
                </p>
                <p class="history_L year2009">
                    <span class="history_2006_span">2012</span>
                    <b class="history_2006_b">
                        <span class="history_l_month">04<br/>月</span>
                        <span class="history_l_text">推出CRM信息交流平台，<br/>对旗下后台系统进行整合营销</span>
                    </b>
                </p>
                <p class="history_L yearalmost">
                    <span class="history_2006_span blue">2013</span>
                    <b class="history_2006_b blue">
                        <span class="history_l_month">01<br/>月</span>
                        <span class="history_l_text">One peice获得广电总局颁发的<br/>软件开发许可证</span>
                    </b>
                </p>
                <p class="history_L yearalmost">
                    <span class="history_2006_span blue">2014</span>
                    <b class="history_2006_b blue">
                        <span class="history_l_month">08<br/>月</span>
                        <span class="history_l_text smalltext">One peice获得由迪士尼旗下思伟投资、IDG、江苏高科技投资集团的<br/>B轮融资2000万美元</span>
                    </b>
                </p>
                <p class="history_L year2011">
                    <span class="history_2006_span blue">2014</span>
                    <b class="history_2006_b blue">
                        <span class="history_l_month">09<br/>月</span>
                        <span class="history_l_text">One peice荣获“2011年<br/>中国云计算最佳应用实践奖”</span>
                    </b>
                </p>
                <p class="history_L year2011">
                    <span class="history_2006_span blue">2015</span>
                    <b class="history_2006_b blue">
                        <span class="history_l_month">03<br/>月</span>
                        <span class="history_l_text">One peice成功举办2012中国<br/>远程教育技术创新与应用论坛</span>
                    </b>
                </p>
                <p class="history_L year2011">
                    <span class="history_2006_span yellow">2015</span>
                    <b class="history_2006_b yellow">
                        <span class="history_l_month">09<br/>月</span>
                        <span class="history_l_text">One peice发布后台云<br/>开放战略及API2.0</span>
                    </b>
                </p>
                <p class="history_L year2013">
                    <span class="history_2006_span yellow">2016</span>
                    <b class="history_2006_b yellow">
                        <span class="history_l_month">04<br/>月</span>
                        <span class="history_l_text smalltxt">One peice成功举办2013（第二届）中国<br/>远程教育技术创新与应用论坛</span>
                    </b>
                </p>
                <p class="history_L yearalmost">
                    <span class="history_2006_span yellow">2018</span>
                    <b class="history_2006_b yellow">
                        <span class="history_l_month">01<br/>月</span>
                        <span class="history_l_text full">CRM系统发布</span>
                    </b>
                </p>
            </div>
            <div class="history-img">
                <img class="history_img" src="<%=basePath%>images/history.png" alt="">
            </div>
            <div class="history_right">
                <p class="history_R history_r_2005">
                    <span class="history_2005_span">2008</span>
                    <b class="history_2005_b">
                        <span class="history_r_month">04<br/>月</span>
                        <span class="history_r_text">One peice成立<br/>并入住湖南信息职业技术学院</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span">2010</span>
                    <b class="history_2005_b">
                        <span class="history_r_month">12<br/>月</span>
                        <span class="history_r_text">获得国际著名投资商<br/>信大投资 </span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span">2011</span>
                    <b class="history_2005_b">
                        <span class="history_r_month">01<br/>月</span>
                        <span class="history_r_text">整合supper和piece后<br/>推出CRM系统</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span">2011</span>
                    <b class="history_2005_b">
                        <span class="history_r_month">12<br/>月</span>
                        <span class="history_r_text">One peice成为Google在大陆地<br/>区第一家CRM合作伙伴</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span blue">2013</span>
                    <b class="history_2005_b blue_R">
                        <span class="history_r_month">10<br/>月</span>
                        <span class="history_r_text">One peice推出基于视频云计算的<br/>第三方服务平台</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span blue">2014</span>
                    <b class="history_2005_b blue_R">
                        <span class="history_r_month">08<br/>月</span>
                        <span class="history_r_text">One peice参展2011年（第十届）<br/>中国互联网大会</span>
                    </b>
                </p>
                <p class="history_R year211">
                    <span class="history_2005_span blue">2014</span>
                    <b class="history_2005_b blue_R">
                        <span class="history_r_month">11<br/>月</span>
                        <span class="history_r_text">One peice荣获<br/>“最佳云服务模式奖”</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span yellow">2015</span>
                    <b class="history_2005_b yellow_R">
                        <span class="history_r_month">04<br/>月</span>
                        <span class="history_r_text">One peice荣获<br/>“最佳后台服务提供商”</span>
                    </b>
                </p>
                <p class="history_R year211">
                    <span class="history_2005_span yellow">2015</span>
                    <b class="history_2005_b yellow_R">
                        <span class="history_r_month">10<br/>月</span>
                        <span class="history_r_text">One peice荣获“清科集团中国<br/>最具投资价值50强”荣誉</span>
                    </b>
                </p>
                <p class="history_R yearalmostr">
                    <span class="history_2005_span yellow">2017</span>
                    <b class="history_2005_b yellow_R">
                        <span class="history_r_month">10<br/>月</span>
                        <span class="history_r_text">One peice荣获<br/>“最佳教育技术提供商”荣誉</span>
                    </b>
                </p>
            </div>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
	<script type="text/javascript" src="<%=basePath%>js/new_file.js"></script>
<script type="text/javascript">
$(window).scroll(function(){
	var msg = $(".history-img");
	var item = $(".history_L");
	var items = $(".history_R");
	var windowHeight = $(window).height();
	var Scroll = $(document).scrollTop();
	if((msg.offset().top - Scroll -windowHeight)<=0){
		msg.fadeIn(1500);
	}
	for(var i=0;i<item.length;i++){
		if(($(item[i]).offset().top - Scroll - windowHeight)<= -100){
			$(item[i]).animate({marginRight:'0px'},'50','swing');
		}
	}
	for(var i=0;i<items.length;i++){
		if(($(items[i]).offset().top - Scroll - windowHeight)<= -100){
			$(items[i]).animate({marginLeft:'0px'},'50','swing');
		}
	}
});
</script>
</body>
</html>