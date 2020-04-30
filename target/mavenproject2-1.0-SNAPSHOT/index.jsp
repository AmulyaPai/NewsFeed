<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.sun.syndication.io.FeedException"%>
<%@page import="com.sun.syndication.fetcher.FetcherException"%>
<%@page import="com.sun.syndication.feed.synd.SyndEntry"%>
<%@page import="java.net.URL"%>
<%@page import="com.sun.syndication.feed.synd.SyndFeed"%>
<%@page import="com.sun.syndication.fetcher.impl.HttpURLFeedFetcher"%>
<%@page import="com.sun.syndication.fetcher.FeedFetcher"%>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
         <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <title>skyNews</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/versions.css">
        <link rel="stylesheet" href="css/responsive.css">
        <link rel="stylesheet" href="css/custom.css">
        
        <style>
            #edu{
                height:650px;
                margin-bottom: 20px;
                
            }
        </style>
    
    </head>
    
    <body class="politics_version">
        <!-- LOADER -->
        <div id="preloader">
            <div id="main-ld">
                <div id="loader"></div>
            </div>
        </div>
        <!--World News -->
        <%
            FeedFetcher ff = new HttpURLFeedFetcher();
            SyndFeed feed;
            String titl[]=new String[30];
            String des[]=new String[30];
            //String aut[]=new String[20];
            Date dat[]=new Date[30];
            String links[]=new String[30];
            String img[]=new String[30];
            int i = 0;
            
           
            feed = (SyndFeed) ff.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/296589292.cms"));
            Iterator it = feed.getEntries().iterator();
             while(it.hasNext())
                {
                    SyndEntry e = (SyndEntry) it.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String link=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titl[i] = Title;
                    links[i]=link;
                    dat[i]=pubDate;
                    des[i]=cleanDesc;
                    img[i]=cleanurl;
                    i = i+1;  
            }
            %>
            
            
        <div class="topbar text-center hidden-xs">
        <p><a href="#"><marquee>Stay tuned for news updates</marquee></a></p>
        </div>
        
        <header class="header header_style_01">
        <nav class="megamenu navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="images/logos/logo1.png" alt="image"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a data-scroll-nav="0" href="#main-banner" class="active">Home</a></li>
                        <li><a data-scroll-nav="1" href="#world">World</a></li>
                        <li><a data-scroll-nav="2" href="#issue">India</a></li>
                        <li><a data-scroll-nav="3" href="#events">Sports</a></li>
                        <li><a data-scroll-nav="4" href="#business">Business</a></li>
                        <li><a data-scroll-nav="5" href="#entertainment">Entertainment</a></li>
                        <li><a data-scroll-nav="6" href="#sports">Environment</a></li>
                        <li><a data-scroll-nav="7" href="#education">Education</a></li>
			

                        
                    </ul>
                </div>
            </div>
        </nav>
        </header>
        
        <div id="main-banner" class="banner-one" data-scroll-index="0">
		<div data-src="uploads/economy.jpg">
			<div class="camera_caption">
				<div class="container">
					<h1 class="wow fadeInUp animated">Stay Updated with #SkyNews</h1>
					<p class="wow fadeInUp animated" data-wow-delay="0.2s"></p>
					<!--<a data-scroll href="#" class="btn btn-light btn-radius btn-brd grd1">DONATE</a>-->
				</div> <!-- /.container -->
			</div> <!-- /.camera_caption -->
		</div>
		<div data-src="uploads/sports.jpg">
			<div class="camera_caption">
				<div class="container">
					<h1 class="wow fadeInUp animated">Stay Updated with #SkyNews</h1>
					<p class="wow fadeInUp animated" data-wow-delay="0.2s"></p>
					<!--<a data-scroll href="#" class="btn btn-light btn-radius btn-brd grd1"></a>-->
				</div> <!-- /.container -->
			</div> <!-- /.camera_caption -->
		</div>
		<div data-src="uploads/slide3.jpg">
			<div class="camera_caption">
				<div class="container">
					<h1 class="wow fadeInUp animated">Stay Updated with #SkyNews</h1>
					<p class="wow fadeInUp animated" data-wow-delay="0.2s"></p>
					<!--<a data-scroll href="#" class="btn btn-light btn-radius btn-brd grd1"></a>-->
				</div> <!-- /.container -->
			</div> <!-- /.camera_caption -->
		</div>
	</div> <!-- /#theme-main-banner -->
        
        <div id="about" data-scroll-index="1" class="section wb">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="message-box">
                        <h4><%=titl[0] %></h4>
                        <blockquote class="lead"><%= des[0] %></blockquote>

                        <p> <%= dat[0] %> </p>

                        <a href="/mavenproject2/World" data-scroll class="btn btn-light btn-radius btn-brd grd1">More World News</a>
                    </div><!-- end messagebox -->
                </div><!-- end col -->

                <div class="col-md-6">
                    <div class="post-media wow fadeIn">
                        <img src="<%= img[0] %>" alt="" class="img-responsive img-rounded">
                        <a href=""></a>
                    </div><!-- end media -->
                </div><!-- end col -->
            </div><!-- end row -->
            <hr class="hr1"> 

            <div class="row text-center">
                <div class="col-md-6 col-sm-6 col-xs-12">
                   <div class="service-widget">
                        <div class="post-media_pp wow fadeIn">
                            <a href="<%=links[1]%>" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                            <img src="<%= img[1] %>" alt="" height="400px" width="700px">
							<div class="hover-up">
								<h3><%=titl[1]%></h3>
								<p><%= des[1] %></p>
							</div>
                        </div>
                    </div><!-- end service -->
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="service-widget">
                        <div class="post-media_pp wow fadeIn">
                            <a href="<%=links[5]%>" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                            <img src="<%= img[5] %>" alt="" height="400px" width="700px">
							<div class="hover-up">
								<h3><%=titl[5]%></h3>
								<p><%= des[5] %> </p>
							</div>
                        </div>
                        
                    </div><!-- end service -->
                </div>

                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="service-widget">
                        <div class="post-media_pp wow fadeIn">
                            <a href="<%=links[3]%>" class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                            <img src="<%= img[3] %>" alt="" height="400px" width="700px">
							<div class="hover-up">
								<h3><%= titl[3] %></h3>
								<p><%= des[3] %></p>
							</div>
                        </div>
                        
                    </div><!-- end service -->
                </div>
				
		<div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="service-widget">
                        <div class="post-media_pp wow fadeIn">
                            <a href="<%=links[4]%>"  class="hoverbutton global-radius"><i class="flaticon-unlink"></i></a>
                            <img src="<%= img[4]%>" alt="" height="400px" width="700px">
							<div class="hover-up">
								<h3><%= titl[4] %></h3>
								<p><%= des[4] %></p>
							</div>
                        </div>
                    </div><!-- end service -->
                </div>
            </div><!-- end row -->
        </div><!-- end container -->
        </div>
        
                                                        <!-- India -->
            <%
            FeedFetcher india = new HttpURLFeedFetcher();
            SyndFeed infeed;
            String titlin[]=new String[20];
            String desin[]=new String[20];
            //String aut[]=new String[20];
            Date datin[]=new Date[20];
            String imgin[]=new String[20];
            String linksin[]=new String[20];
            int j = 0;
            
           
            infeed = (SyndFeed) india.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms"));
            Iterator ittech = infeed.getEntries().iterator();
             while(ittech.hasNext())
                {
                    SyndEntry e = (SyndEntry) ittech.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linkin=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titlin[j] = Title;
                    datin[j]=pubDate;
                    linksin[j]=linkin;
                    desin[j]=cleanDesc;
                    imgin[j]=cleanurl;
                    j = j+1;  
            }
             %>
             
        <div class="section nopad">
        <img src="uploads/" alt="" class="img-responsive">
        </div>

        <div id="issues" data-scroll-index="2" class="section lb">
        <div class="container">
            <div class="section-title text-left">
                <h3>India</h3>
                <p class="lead"></p>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-5">
                    <div class="issuse-wrap2 clearfix">
                        <img src="<%=imgin[0]%>" alt="" class="img-responsive img-rounded">
                        <a href="<%=linksin[0]%>"><h4><%=titlin[0]%></h4></a>
                        <p><%=desin[0]%></p>
                        <p><%=datin[0]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
                <div class="col-md-7">
                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgin[1]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linksin[1]%>"><h4><%=titlin[1]%></h4></a>
                        <!--<p><%=desin[1]%></p>-->
                        <p><%=datin[1]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgin[2]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linksin[2]%>"><h4><%=titlin[2]%></h4></a>
                        <!--<p><%=desin[2]%></p>-->
                        <p><%=datin[2]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgin[3]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linksin[3]%>"><h4><%=titlin[3]%></h4></a>
                        <!--<p><%=desin[3]%></p>-->
                        <p><%=datin[3]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap lastchild clearfix">
                        <img src="<%=imgin[4]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linksin[4]%>"><h4><%=titlin[4]%></h4></a>
                        <p><%=datin[4]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
            </div><!-- end row -->
          <a href="/mavenproject2/India" data-scroll class="btn btn-light btn-radius btn-brd grd1">Latest India</a>
        </div><!-- end container -->
    </div><!-- end section -->
    
          <%
            FeedFetcher sport = new HttpURLFeedFetcher();
            SyndFeed spfeed;
            String titlsp[]=new String[20];
            String dessp[]=new String[20];
            //String aut[]=new String[20];
            Date datsp[]=new Date[20];
            String imgsp[]=new String[20];
            String linksp[]=new String[20];
            int k = 0;
            
           
            spfeed = (SyndFeed) sport.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/4719148.cms"));
            Iterator spit = spfeed.getEntries().iterator();
             while(spit.hasNext())
                {
                    SyndEntry e = (SyndEntry) spit.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linksport=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titlsp[k] = Title;
                    
                    datsp[k]=pubDate;
                    dessp[k]=cleanDesc;
                    imgsp[k]=cleanurl;
                    linksp[k]=linksport;
                    k = k+1;  
            }
            %>
           
        <div id="event" data-scroll-index="3" class="section wb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Sports</h3>
                <p class="lead"> "an activity involving physical exertion and skill in which an individual or a team competes against another or others for entertainment"</p>
            </div><!-- end title -->

            <div class="row">
                <div class="col-md-4">
                    <div class="participate-wrap">
                        <small></small>
						<figure>
							<img src="<%=imgsp[0]%>" alt="" class="img-responsive">
							<figcaption><a href="<%=linksp[0]%>" class="global-radius"> <i class="flaticon-unlink"></i> </a></figcaption>
						</figure>
						<div class="event_dit">
							<h4><%=titlsp[0]%></h4>
							<ul>
								<li> <a href="#"> <i class="fa fa-calendar"></i> <%=datsp[0]%> </a> </li>
								<!--<li> <a href="#"> <i class="fa fa-clock-o"></i> 7:00 PM to 9:00 PM </a>  </li>-->
								<li> <a href="#"> <i class="fa fa-map-marker"></i> India</a> </li>
							</ul>
							<p><%=dessp[0]%></p>
							
						</div>
                    </div><!-- end participate -->
                </div><!-- end col -->

                <div class="col-md-4">
                    <div class="participate-wrap">
                        <small></small>
						<figure>
							<img src="<%=imgsp[1]%>" alt="" class="img-responsive">
                                                        <figcaption><a href="<%=linksp[1]%>" class="global-radius"> <i class="flaticon-unlink"></i> </a></figcaption>
						</figure>
						<div class="event_dit">
							<h4><%=titlsp[1]%></h4>
							<ul>
								<li> <a href="#"> <i class="fa fa-calendar"></i><%=datsp[1]%></a> </li>
								<!--<li> <a href="#"> <i class="fa fa-clock-o"></i> 6:00 PM to 7:00 PM </a>  </li>-->
								<li> <a href="#"> <i class="fa fa-map-marker"></i> India </a> </li>
							</ul>
							<p><%=dessp[1]%></p>
							
						</div>
                    </div><!-- end participate -->
                </div><!-- end col -->

                <div class="col-md-4">
                    <div class="participate-wrap">
                        <small></small>
                        <figure>
							<img src="<%=imgsp[2]%>" alt="" class="img-responsive">
							<figcaption><a href="<%=linksp[2]%>" class="global-radius"> <i class="flaticon-unlink"></i> </a></figcaption>
						</figure>
                        <div class="event_dit">
							<h4><%=titlsp[2]%></h4>
							<ul>
								<li> <a href="#"> <i class="fa fa-calendar"></i><%=datsp[2]%></a> </li>
								<!--<li> <a href="#"> <i class="fa fa-clock-o"></i> 5:00 PM to 6:00 PM </a>  </li>-->
								<li> <a href="#"> <i class="fa fa-map-marker"></i> India </a> </li>
							</ul>
							<p><%=dessp[2]%></p>
							
						</div>
                    </div><!-- end participate -->
                </div><!-- end col -->
            </div><!-- end row -->
            <a href="/mavenproject2/Sports" class="btn btn-light btn-radius btn-brd grd1 center-block">More Sports</a>
        </div><!-- end container -->
    </div><!-- end section -->
    
    <%
            FeedFetcher buss = new HttpURLFeedFetcher();
            SyndFeed bsfeed;
            String titlbs[]=new String[20];
            String desbs[]=new String[20];
            //String aut[]=new String[20];
            Date datbs[]=new Date[20];
            String imgbs[]=new String[20];
            String linkbus[]=new String[20];
            int n = 0;
            
           
            bsfeed = (SyndFeed) buss.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/1898055.cms"));
            Iterator bsit = bsfeed.getEntries().iterator();
             while(bsit.hasNext())
                {
                    SyndEntry e = (SyndEntry) bsit.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linksbus=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titlbs[n] = Title;
                    
                    datbs[n]=pubDate;
                    desbs[n]=cleanDesc;
                    imgbs[n]=cleanurl;
                    linkbus[n]=linksbus;
                    n= n+1;  
            }
            %>
    
     <div class="section nopad">
        <img src="uploads/" alt="" class="img-responsive">
        </div>

        <div id="business" data-scroll-index="4" class="section lb">
        <div class="container">
            <div class="section-title text-left">
                <h3>Business</h3>
                <p class="lead"></p>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-5">
                    <div class="issuse-wrap2 clearfix">
                        <img src="<%=imgbs[0]%>" alt="" class="img-responsive img-rounded">
                        <a href="<%=linkbus[0]%>"><h4><%=titlbs[0]%></h4></a>
                        <p><%=desbs[0]%></p>
                        <p><%=datbs[0]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
                <div class="col-md-7">
                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgbs[1]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linkbus[1]%>"><h4><%=titlbs[1]%></h4></a>
                        <!--<p><%=desbs[1]%></p>-->
                        <p><%=datbs[1]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgbs[2]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linkbus[2]%>"><h4><%=titlbs[2]%></h4></a>
                        <!--<p><%=desbs[2]%></p>-->
                        <p><%=datbs[2]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgbs[3]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linkbus[3]%>"><h4><%=titlbs[3]%></h4></a>
                        <!--<p><%=desbs[3]%></p>-->
                        <p><%=datbs[3]%></p>
                    </div><!-- end issue -->

                    <div class="issuse-wrap lastchild clearfix">
                        <img src="<%=imgbs[4]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linkbus[4]%>"><h4><%=titlbs[4]%></h4></a>
                        <p><%=datbs[4]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
            </div><!-- end row -->
          <a href="/mavenproject2/Business" data-scroll class="btn btn-light btn-radius btn-brd grd1">Latest Business</a>
        </div><!-- end container -->
    </div><!-- end section -->
    
    <%
            FeedFetcher ent = new HttpURLFeedFetcher();
            SyndFeed enfeed;
            String titlen[]=new String[20];
            String desen[]=new String[20];
            //String aut[]=new String[20];
            Date daten[]=new Date[20];
            String imgen[]=new String[20];
            String linkent[]=new String[20];
            int l = 0;
            
           
            enfeed = (SyndFeed) ent.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/1081479906.cms"));
            Iterator enit = enfeed.getEntries().iterator();
             while(enit.hasNext())
                {
                    SyndEntry e = (SyndEntry) enit.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linksent=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titlen[l] = Title;
                    
                    daten[l]=pubDate;
                    desen[l]=cleanDesc;
                    imgen[l]=cleanurl;
                    linkent[l]=linksent;
                    l = l+1;  
            }
            %>
    
    <div id="media" data-scroll-index="5" class="section wb">
        <div class="container">
            <div class="section-title text-center">
                <h3>Entertainment</h3>
                <p class="lead">What the mass media offers is not popular art, but entertainment which is intended to be consumed like food, forgotten, and replaced by a new dish.</p>
            </div><!-- end title -->

            <div class="row">
                <% for(int a=0; a<3;a++){%>
                <div class="col-md-4">
                    <div class="issuse-wrap2 clearfix">
                        <div class="post-media wow fadeIn">
                            <a href="<%=linkent[a]%>"> <img src="<%=imgen[a]%>" alt="" class="img-responsive img-rounded"></a>
                          
                            <a href="somelink" data-rel="prettyPhoto[gal]"></a>
                        </div><!-- end media -->
                        <h4><%=titlen[a]%></h4>
                        <p><%=desen[a]%></p>
                        <p><%=daten[a]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
                <%}%>
            </div><!-- end row -->
          <a href="/mavenproject2/Entertainment" class="btn btn-light btn-radius btn-brd grd1 center-block">More Entertainment</a>

        </div><!-- end container -->
    </div><!-- end section -->
    
     <%
            FeedFetcher env = new HttpURLFeedFetcher();
            SyndFeed envfeed;
            String titlenv[]=new String[20];
            String desenv[]=new String[20];
            //String aut[]=new String[20];
            Date datenv[]=new Date[20];
            String imgenv[]=new String[20];
            String linkenv[]=new String[20];
            int o = 0;
            
           
            envfeed = (SyndFeed) env.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/2647163.cms"));
            Iterator envit = envfeed.getEntries().iterator();
             while(envit.hasNext())
                {
                    SyndEntry e = (SyndEntry) envit.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linksenv=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titlenv[o] = Title;
                    datenv[o]=pubDate;
                    desenv[o]=cleanDesc;
                    imgenv[o]=cleanurl;
                    linkenv[o]=linksenv;
                    o= o+1;  
            }
            %>
    
     <div class="section nopad">
        <img src="uploads/" alt="" class="img-responsive">
        </div>

        <div id="enviornment" data-scroll-index="6" class="section lb">
        <div class="container">
            <div class="section-title text-left">
                <h3>Enviornment</h3>
                <p class="lead"></p>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-5">
                    <div class="issuse-wrap2 clearfix">
                        <img src="<%=imgenv[0]%>" alt="" class="img-responsive img-rounded">
                        <h4><%=titlenv[0]%></h4>
                        <p><%=desenv[0]%></p>
                        <p><%=datenv[0]%></p>
                    </div><!-- end issue -->
                </div><!-- end col -->
                <div class="col-md-7">
                    <%for(int b=1;b<5; b++){%>
                    <div class="issuse-wrap clearfix">
                        <img src="<%=imgenv[b]%>" alt="" class="img-responsive img-rounded alignleft">
                        <a href="<%=linkenv[b]%>"><h4><%=titlenv[b]%></h4></a>
                        <!--<p><%=desenv[b]%></p>-->
                        <p><%=datenv[b]%></p>
                    </div><!-- end issue -->
                    <%}%>

                </div><!-- end col -->
            </div><!-- end row -->
          <a href="/mavenproject2/Environment" data-scroll class="btn btn-light btn-radius btn-brd grd1">Latest Environment</a>
        </div><!-- end container -->
    </div><!-- end section -->
    
     <%
            FeedFetcher edu = new HttpURLFeedFetcher();
            SyndFeed edfeed;
            String titled[]=new String[20];
            String desed[]=new String[20];
            //String aut[]=new String[20];
            Date dated[]=new Date[20];
            String imged[]=new String[20];
            String linked[]=new String[20];
            int m = 0;
            
           
            edfeed = (SyndFeed) edu.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/913168846.cms"));
            Iterator edit = edfeed.getEntries().iterator();
             while(edit.hasNext())
                {
                    SyndEntry e = (SyndEntry) edit.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String linksed=e.getLink();
                    //String Author = e.getAuthor();
                    String cleanDesc ="";
                    if(desc.startsWith("<a")){
                        cleanDesc = desc.substring(desc.indexOf("/a>")+3);
                       // System.out.println("Desc: "+cleanDesc);
                    }
                    String cleanurl="";
                    String imgtemp = e.getDescription().getValue();
                    if(imgtemp.startsWith("<a")){
                    cleanurl = imgtemp.substring(imgtemp.indexOf("src=")+5, imgtemp.indexOf("/>") - 2);
                    //System.out.println("Image: "+cleanurl);
                    }
                    
                    titled[m] = Title;
                    
                    dated[m]=pubDate;
                    desed[m]=cleanDesc;
                    imged[m]=cleanurl;
                    linked[m]=linksed;
                    m = m+1;  
            }
            %>
	
	<div id="blog" data-scroll-index="7" class="section lb">
		<div class="container">
			<div class="section-title text-center">
				<span></span>
                <h3>Education</h3>
                <p class="lead">Education is the passport to the future, for tomorrow belongs to those who prepare for it today.</p>
            </div><!-- end title -->
			
			<div class="row">
                                <%for(int c=0;c<3;c++){%>
				<div class="col-md-4 col-sm-6 col-lg-4" >
                                    <a href="<%=linked[c]%>">
					<div class="post-box" id="edu">
						<div class="post-thumb">
							<img src="<%=imged[c]%>" class="img-responsive" alt="post-img" />
							<div class="date">
								<span><%=dated[c]%></span>
								
							</div>
						</div>
						<div class="post-info">
							<h4><%=titled[c]%></h4>
							
							<p><%=desed[c]%></p>
						</div>
					</div>
                                    </a>
				</div>
                                                <%}%>
				
			</div> 
			            <a href="/mavenproject2/Education" class="btn btn-light btn-radius btn-brd grd1 center-block">More About Education</a>

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