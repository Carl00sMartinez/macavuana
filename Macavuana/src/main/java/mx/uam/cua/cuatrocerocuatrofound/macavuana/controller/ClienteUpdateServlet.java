package mx.uam.cua.cuatrocerocuatrofound.macavuana.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

import jdk.internal.net.http.hpack.Huffman.Writer;

import java.io.PrintWriter;//<-

/*
 * <%-- 
  404 Found       "¿Error 404? ¡Solución encontrada!"
    
    Italia Zoé Barrón Reyes
    2223028502
    italia.barron@cua.uam.mx
    
    Carlos Alberto Martínez Arévalo
    2223028351
    carlos.martinez@cua.uam.mx
    
    Desarrollo de aplicaciones web - Hugo Pablo Leyva
    27/09/2026
--%>
 */
/**
 * Servlet implementation class ClienteUpdateServlet
 */
/**
 * @author grfft
 * Equipo 404 Found
 *
 */
@WebServlet(name = "ClienteUpdate", urlPatterns = { "/ClienteUpdate" })
public class ClienteUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log("Actualizando Cliente");
		
		response.setContentType( "text/html" );
		
		//Writer writer = response.getWriter();
		PrintWriter writer = response.getWriter();
		
		writer.write( "<html><body><p>¿ Como taz ?</p></body></html> " );
		
	}

}
