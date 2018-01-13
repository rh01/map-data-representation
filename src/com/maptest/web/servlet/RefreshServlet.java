package com.maptest.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import com.maptest.domain.refresh;
import com.maptest.service.refreshService;
import com.maptest.service.impl.refreshServiceImpl;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;


import java.text.SimpleDateFormat;

public class RefreshServlet extends HttpServlet {

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		doPost(request, response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.print(request);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
//		鑾峰彇琛ㄥ崟鏁版嵁
		refresh time=new refresh();
		try {
			/*ConvertUtils.register(new Converter(){
				public Object convertf(Class type,Object value){
					Date date1=null;
					if(value instanceof String){
						String date=(String)value;	
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
						try{
							date1=sdf.parse(value);
						}catch(ParseException e){
							e.printStackTrace();
						}	
				       }
					return date1;
				}
				}
			},Date.class);*/
			ConvertUtils.register(new DateLocaleConverter(),Date.class);//鏃堕棿杞崲鍣�
			BeanUtils.populate(time, request.getParameterMap());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
//		System.out.print(time.getNyr());
		
//		璋冪敤涓氬姟閫昏緫
		refreshService ts=new refreshServiceImpl();
		List<refresh> t = null;
		try {
//			鏍规嵁琛ㄥ崟time鑾峰彇鏌ヨ瀵硅薄 缁撴灉
			t = ts.showrefresh(time);
			//鍒嗗彂杞悜
			if(t!=null){//濡傛灉鍙栧緱锛屽氨鎶妕瀵硅薄鏀惧埌session瀵硅薄 涓�
				request.setAttribute("t",t);
				request.getRequestDispatcher("/testrefresh.jsp").forward(request, response);
			    /*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			    String s = sdf.format(sdf.parse("20170701 000002000"));*/
				/*request.setAttribute("t","hello");
				request.setAttribute("t","\'2017\'");*/
				//request.getRequestDispatcher("/map.jsp").forward(request, response);
				//request.getRequestDispatcher("/index.jsp").forward(request, response);
				//request.getRequestDispatcher("/HL.jsp").forward(request, response);	
				//request.getRequestDispatcher("/area_hl.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/refresh.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}       
//        String nyr=request.getParameter("nyr");
////        System.out.print(lattitude);
//        String longitude=request.getParameter("longitude");
////        System.out.print(longitude);
//        request.setAttribute("value1", lattitude);
//        request.setAttribute("value2", longitude);
	}

}
