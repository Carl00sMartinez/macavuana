package mx.uam.cua.cuatrocerocuatrofound.macavuana.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
/**
 * Servlet implementation class ClienteUpdateServlet
 */
/**
 * @author Carlos
 * Equipo 404 Found
 *
 */

/*
 * <%-- 
  404 Found       "¿Error 404? ¡Solución encontrada!"
    
    Italia Zoé Barrón Reyes
    2223028502
    italia.barron@cua.uam.mx
    
    Carlos Alberto Martínez Arévalo
    2223028351
    carlos.martinez@cua.uam.mx
    
    Brandon Alexis Efren Duran Zambrano
    2173075068
    al2173075068@azc.uam.mx

    
    Desarrollo de aplicaciones web - Hugo Pablo Leyva
    27/09/2026
--%>
 */

@WebServlet(name = "ClienteUpdate", urlPatterns = { "/ClienteUpdate" })
public class ClienteUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost
	  (HttpServletRequest request, HttpServletResponse response) 
	      throws ServletException, IOException 
	{
		log("Actualizando infoormacion del Cliente");
		
		String base = request.getContextPath();
		response.sendRedirect( base + "/cliente_update_form.jsp" );
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher    
		//    ( "/cliente_update_form.jsp" );
		//dispatcher.forward( request,response);
		
		//response.setContentType( "text/html" );
		//Writer writer = response.getWriter();
		//PrintWriter writer = response.getWriter();
		//writer.write( "<html><body><p>¿ Como taz ?</p></body></html> " );
		
	}

}
