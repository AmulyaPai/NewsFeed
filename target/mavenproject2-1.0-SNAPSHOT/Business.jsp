<%-- 
    Document   : Business
    Created on : 15 Oct, 2019, 2:01:30 PM
    Author     : adity
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Business</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/versions.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/custom.css">
        <style>
             p{
                margin-left: 200px;
                margin-right: 200px;
            }
        </style>
       
    </head>
    <body>    
        <header class="header header_style_01">
        <nav class="megamenu navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="images/logos/logo1.png" alt="image"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a  href="index.jsp" >Home</a></li>
                        <li><a  href="World" >World</a></li>
                        <li><a  href="India">India</a></li>
                         <li><a  href="Sports">Sports</a></li>
                        <li><a  href="Business" class="active">Business</a></li>
                        <li><a  href="Entertainment">Entertainment</a></li>
                        <li><a  href="Environment">Environment</a></li>
                        <li><a  href="Education">Education</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
        String[] Business;
        String[] Desc;
        String[] Image;
        Date[] pubDate;
         String[] Link;

        
            Business = new String[((String[])request.getAttribute("BusinessTitle")).length];
            Business= ((String[])request.getAttribute("BusinessTitle"));
            
            Desc = new String[((String[])request.getAttribute("BusinessDesc")).length];
            Desc = ((String[])request.getAttribute("BusinessDesc"));
            
            Image = new String[((String[])request.getAttribute("Businessimg")).length];
            Image = ((String[])request.getAttribute("Businessimg"));
            
            pubDate = new Date[((Date[])request.getAttribute("Businessdate")).length];
            pubDate = ((Date[])request.getAttribute("Businessdate"));
            
            Link = new String[((String[])request.getAttribute("WorldLink")).length];
            Link = ((String[])request.getAttribute("WorldLink"));
         %>
         <div align="center">
             
         <div class=" section lb container center-block aligncenter">
             <div class="issuse-wrap2 clearfix aligncenter">
                 <h1 class="header_style_01 h1">Business</h1>
        <% for(int i = 0 ; i<Business.length ;i++){%>
        <a href="<%=Link[i]%>"><div>
                        <img src="<%=Image[i]%>" alt="" class="img-rounded" height="500px" width="600px">
                        <h2><%=Business[i]%></h2>
                        <p ><%=Desc[i]%></p>
                        <p><%=pubDate[i]%></p>
                        <hr >
        </div>  </a>
        <%}%>
        </div><!-- end issue -->
         </div>
        </div>
        
        <div align="center">
           <footer>
                <p>Posted by: SkyNews</p>
                <p>Contact information: <a href="mailto:skynews@rediff.com">
                skynews@rediffmail.com</a>.</p>
            </footer>
        </div>
        
        <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>
   
        <script src="js/all.js"></script>
	<!-- Camera Slider -->
	<script src="js/jquery.mobile.customized.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script> 
	<script src="js/camera.min.js"></script>
	<script src="js/scrollIt.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/custom.js"></script>
        <script src="js/jquery.vide.js"></script>
    </body>
</html>
