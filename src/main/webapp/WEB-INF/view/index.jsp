<!DOCTYPE html>
<%@ page contentType = "text/html; charset=utf-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Melon::음악이 필요한 순간, 멜론</title>
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/Img/favicon.ico" id="favicon"/>
    <link href="./css/main.css" rel="stylesheet">
    <link href="./css/reset.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/248df2c230.js" crossorigin="anonymous"></script>
</head>
<style>
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, canvas, details, embed,
    figure, figcaption, footer, header, hgroup,
    menu, nav, output, ruby, section, summary,
    time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }
    /* HTML5 display-role reset for older browsers */
    article, aside, details, figcaption, figure,
    footer, header, hgroup, menu, nav, section {
        display: block;
    }
    body {
        line-height: 1;
    }
    ol, ul, li {
        list-style: none;
    }
    blockquote, q {
        quotes: none;
    }
    blockquote:before, blockquote:after,
    q:before, q:after {
        content: '';
        content: none;
    }
    table {
        border-collapse: collapse;
        border-spacing: 0;
    }
 
    @font-face {
        font-family: 'KCC-Ganpan';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCC-Ganpan.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    input:focus,textarea:focus,select:focus{outline:none; border:none;}
    a,a:active,a:visited,a:hover{text-decoration: none;}
    body{background-color: #2a2a2a;}
    input[type="checkbox"]:hover{cursor: pointer;}

    .header{position: relative; display: flex; height: 65px;}
    .header>.header_left>a{font-size: 1.2rem; color:#04E632; margin: 20px; font-family: 'KCC-Ganpan'; height: 23px; line-height: 23px;}
    .header_left{position: relative; display: flex; width: 50%;}
    .header_left input{margin: 20px; background-color: #3b3b3b; border-radius: 16px; width: 150px; height: 23px; border:none; padding: 0 10px 0 30px; color: #fff; font-size: 0.8rem;}
    .header_left form{position: relative;}
    .header_left_read{position: absolute; top: 25px; left: 28px; color: #aaa; font-size: 0.9rem; line-height: 0;}

    .header_right{position:  relative; display: flex; width: 50%; justify-content: flex-end;}
    .header_right button{width: 75px; height: 28px; margin: 20px; border-radius: 11px; background-color: #2a2a2a; color: #ababab; border: 2px solid #4c4c4c; position: relative; z-index: 2;}
    .header_right button::before{content: '';position: absolute;top: 0; left: 0; width: 0%; height: 100%; background-color: #444; z-index: -1; transition: all 0.2s; border-radius: 9px;}
    .header_right button:hover::before{width: 100%;}
    .header_right button:hover{color: #bbb;}
    .header_right button:first-child{margin: 20px 5px 20px 10px;}
    .header_right button:last-child{margin: 20px 20px 20px 5px;}

    .aside{position: relative; width: 350px; min-width: 350px; height: 1000px; display: flex; flex-wrap: wrap; align-items: flex-start; text-align: center; background: #333; color: #fff; z-index: 2;}
    .playsong_info{display: flex; flex-wrap: wrap; justify-content: center; margin: 0 auto; align-items: flex-start; height: 350px;}
    .playsong_info img{width: 150px; height: 150px; margin: 50px 0 20px 0; border-radius: 6px;}
    .playsong_info p{width: 100%; height: 20px; font-size: 0.8rem; font-weight: 600;}
    .playsong_info span{color:#04E632}

    .playsong_info_ck{position: relative; height: 35px; display: flex;}
    .playsong_info_ck input[type="checkbox"]{width: 13px; height: 13px; appearance: none; border:1px solid #aaa; border-radius: 4px; margin: 11px 11px 0;}
    .playsong_info_ck input[type="checkbox"]:checked::before{content: '\f00c'; font-family:"Font Awesome 5 free"; font-weight:900; font-size: 0.8rem; vertical-align: super; line-height: -1px;color: #04E632; }
    .playsong_info_ck p{font-size: 0.7rem; line-height: 35px;}
    .playsong_info_ck p:last-child{width: 250px; text-align: right}
    .playsong_info_ck p a{text-align: right; color: #fff;}
    .playsong_oper{position: relative; width: 100%;}
    .play_ong_oper p{width: 100%; text-align: center;}
    .playsong_oper_wrap{position: relative; display: flex; justify-content: space-evenly; align-items: center; height: 50px;}
    .playsong_oper_wrap a{color: #fff; font-size: 1.4rem;}
    .playsong_oper_wrap a:hover{color: #04E632;}
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");
    .playsong_list::-webkit-scrollbar{display: none;}
    .playsong_list{width: 100%; height: 530px; overflow: scroll;}

    .playsong_list_wrap{display: flex; width: 100%; justify-content: flex-start; margin: 0 0 10px 0; text-align: left;}
    .playsong_list_wrap input[type="checkbox"]{width: 13px; height: 13px; appearance: none; border:1px solid #aaa; border-radius: 4px; margin: 11px 11px 0;}
    .playsong_list_wrap input[type="checkbox"]:checked::before{content: '\f00c'; font-family:"Font Awesome 5 free"; font-weight:900; font-size: 0.8rem; vertical-align: super; line-height: -1px;color: #04E632; }
    .playsong_list_wrap img{width: 35px; float: left; border-radius: 5px;}
    .playsong_list_wrap_div{display: flex; flex-wrap: wrap; align-content: space-between; margin: 0 0 0 13px;}
    .playsong_list_wrap_div p { font-size: 0.8rem; width: 100%;}
    .playsong_list_wrap_box{width: 4px; height: 4px;}

    .sec1{position: relative; display: flex;}

    /*  사이드 네비게이션 */
    .nav{position: relative; width: 117px;}
    .nav img{ width: 40px; margin: 20px;}
    .nav li a{font-size: 0.9rem; line-height: 2.3rem; color:#999; font-weight: 600; margin: 0 0 0 20px; transition: all 0.2s;}
    .nav li a:hover{color: #04E632;}
    .nav>ul>li>ul>li>a{font-size: 0.8rem; line-height: 1.7rem; margin: 0 0 0 32px;}

    /* 본문 */
    .wrap{ min-height: 935px; width: calc(100% - 467px); word-break: break-all; position: relative; z-index: 1;}
</style>
<body>
<%@ include file="/WEB-INF/view/common/header.jsp" %>
<section class="sec1">
    <%@ include file="/WEB-INF/view/common/aside.jsp" %>
    <div class="wrap">
        <!-- ❤️여기서 만들자❤️️ -->
    </div>
</section>
</body>
<script>

</script>
</html>
