
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
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sports extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        
        FeedFetcher ff = new HttpURLFeedFetcher();
        SyndFeed feed;
        PrintWriter pw = response.getWriter();
        int i = 0;
        try {
            feed = (SyndFeed) ff.retrieveFeed(new URL("https://timesofindia.indiatimes.com/rssfeeds/4719148.cms"));
            Iterator it = feed.getEntries().iterator();
            String titl[]=new String[20];
            String des[]=new String[20];
             String links[] = new String[20];
            //String aut[]=new String[20];
            Date dat[]=new Date[20];
            String img[]=new String[20];

            while(it.hasNext())
                {
                    SyndEntry e = (SyndEntry) it.next();
                    String Title= e.getTitle();
                    String desc = e.getDescription().getValue();
                    Date pubDate = e.getPublishedDate();
                    String link = e.getLink();
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
                      links[i] = link;
                    i = i+1;
                    
            }
            
            request.setAttribute("SportTitle", titl);
            request.setAttribute("SportsDesc", des);
            request.setAttribute("Sportimg", img);
              request.setAttribute("WorldLink", links);
            request.setAttribute("Sportdate", dat);
                   
            
            request.getRequestDispatcher("/Sport.jsp").forward(request, response);

    }       
         catch (IllegalArgumentException | FeedException | FetcherException ex) {
            Logger.getLogger(NewsFetch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
