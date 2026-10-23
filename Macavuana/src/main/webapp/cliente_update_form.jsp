<%-- 
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=windows-1252">
    <meta name="GENERATOR" content="SeaMonkey/2.40 [en] (Windows; 10; Intel(R) Core(TM) i7-4500U CPU @ 1.80GHz 2.40 GHz) [Composer]">
    <meta name="Author" content="Equipo 404 Found">
    <title>Modificación de Datos</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  </head>
  <body>
    <table border="0" cellpadding="0" cellspacing="0" width="800">
      <tbody>
        <tr>
          <td width="25"> <br> </td>
          <td align="center" valign="top" width="625">
            <div class="section"> Aplicación para el Mantenimiento de Clientes </div>
            <hr>
            <div class="step"> Modificación de Datos </div>
            <div class="instructions"> Actualiza los Campos que se Requieran Modificar </div>
            <br>
            
            <c:set var="pattern" value="${ param.pattern }"/>
            <c:if test="${ param.pattern == null || param.pattern == '' }">
                <c:set var="pattern" value="%"/>
            </c:if>

            <form method="get">
                <table border="1" cellpadding="10">
                    <tr>
                        <td align="center">
                            <table>
                                <tr class="form">
                                    <td align="right">
                                        <div class="label">Patrón:</div>
                                    </td>
                                    <td><input name="pattern" size="10" value="${ pattern }"></td>
                                    <td><input value=" Buscar " type="submit"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
            <br>
            
            <sql:query var="resultados" dataSource="jdbc/TestDS">
                SELECT * FROM cliente WHERE nombre LIKE ?
                ORDER BY 3;
                
                <sql:param value="${ pattern }"/>
            </sql:query>
                
            <c:forEach var="fila" items="${ resultados.rows }">
                <form method="post" action="${ pageContext.request.contextPath }/ClienteUpdate">
                <table width="100%">
                    <tr class="form">
                        <td align="center">
                            <div class="label">Clave</div>
                        </td>
                        <td align="center">
                            <div class="label">Nombre</div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            ${ fila.id_cliente }
                            <input type="hidden" name="id" value="${ fila.id_cliente }">
                        </td>
                        <td align="center">
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        <input size="20" name="name_es" value="${ fila.nombre }">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="bottom">
                            <input type="submit" value=" Modificar">
                            <input type="submit" value="Borrar ">
                        </td>
                    </tr>
                </table>
                </form>
            </c:forEach>
            
            <form method="post" action="${ pageContext.request.contextPath }/ClienteUpdate">
                <br>
                <input type="button" value="  Regresar  " 
                       onclick="window.location='${ pageContext.request.contextPath }/cliente_search.jsp'">
            </form>
          </td>
        </tr>
      </tbody>
    </table>
  </body>
</html>