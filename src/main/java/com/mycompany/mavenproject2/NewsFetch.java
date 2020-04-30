
package com.mycompany.mavenproject2;

import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.fetcher.FeedFetcher;
import com.sun.syndication.fetcher.FetcherException;
import com.sun.syndication.fetcher.impl.HttpURLFeedFetcher;
import com.sun.syndication.io.FeedException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewsFetch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        
        FeedFetcher ff = new HttpURLFeedFetcher();
        SyndFeed feed;
        PrintWriter pw = response.getWriter();
        int i = 0;
        try {
            feed = (SyndFeed) ff.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/-2128936835.cms"));
            Iterator it = feed.getEntries().iterator();
            String titl[]=new String[20];
            String des[]=new String[20];
            //String aut[]=new String[20];
            Date dat[]=new Date[20];
            String img[]=new String[20];
            

            while(it.hasNext())
                {
                    SyndEntry e = (SyndEntry) it.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
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
                    
                    dat[i]=pubDate;
                    des[i]=cleanDesc;
                    img[i]=cleanurl;
                    i = i+1;
                    
//                    pw.write("<html>");
//                    pw.write("<body>");
//                    pw.write("<h1>"+Title+"</h1><br>");
//                    pw.write("<img src="+cleanurl+" height = 10 width = 10/><br>");
//                    pw.write("<p>"+desc+"</p><br>");
//                    pw.write("<p>"+pubDate+"</p><br>");
//                    pw.write("</body>");
//                    pw.write("</html>"); 
            }
            for(int j = 0 ;j<titl.length;j++){
                pw.write("Title:"+titl[j]);
                pw.write("<br>");
                pw.write("Desc:"+des[j]);
                pw.write("<br>");
                pw.write("Image:"+img[j]);
                pw.write("<br>");
                pw.write("Date:"+dat[j]);
                pw.write("<br>");
                pw.write("<br><br><br>");
                
            }
//            request.setAttribute("Title", titl[0]);
//            request.setAttribute("Desc", des);
//            request.setAttribute("Img", img);
//            request.setAttribute("Date", dat);
//        
//            RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
//        
//            rd.forward(request, response);
    }       
         catch (IllegalArgumentException | FeedException | FetcherException ex) {
            Logger.getLogger(NewsFetch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
