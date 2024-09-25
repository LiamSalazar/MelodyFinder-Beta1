F?<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String password = "n0m3l0";
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection(url, user, password);
    
    // Obtener datos del formulario
    String correo = request.getParameter("correo");
    String contra = request.getParameter("contra");
    String tipo_cuenta = "Desconocido";
    
    // Buscar en la tabla Cliente
    String query = "SELECT * FROM Cliente WHERE Correo_electronico_cliente = ?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, correo);
    ResultSet rs = ps.executeQuery();
    boolean encontrado = false;
    int id = 0;
    String correo_bd = "", contra_bd = "";
    if (rs.next()) {
        encontrado = true;
        id = rs.getInt("Id_cliente");
        correo_bd = rs.getString("Correo_electronico_cliente");
        contra_bd = rs.getString("Pass_cliente");
        tipo_cuenta = "Cliente";
    }
    
    // Buscar en la tabla Artista si no se encontró en la tabla Cliente
    if (!encontrado) {
        query = "SELECT * FROM Artista WHERE Correo_electronico_artista = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, correo);
        rs = ps.executeQuery();
        if (rs.next()) {
            encontrado = true;
            id = rs.getInt("Id_artista");
            correo_bd = rs.getString("Correo_electronico_artista");
            contra_bd = rs.getString("Pass_artista");
            tipo_cuenta = "Artista";
        }
    }
    
    // Comprobar contraseña si se encontró el usuario
    if (encontrado && contra.equals(contra_bd) && tipo_cuenta.equals("Artista")) {
        // Escribir valores en hidden
        out.println("<form id='form' action='index_artista.jsp' method='post'>");
        out.println("<input type='hidden' name='id' value='" + id + "' />");
        out.println("<input type='hidden' name='correo' value='" + correo_bd + "' />");
        out.println("<input type='hidden' name='contra' value='" + contra_bd + "' />");
        out.println("</form>");
        out.println("<script type='text/javascript'>");
        out.println("document.getElementById('form').submit();");
        out.println("</script>");
    } 
    
    if (encontrado && contra.equals(contra_bd) && tipo_cuenta.equals("Cliente")) {
        // Escribir valores en hidden
        out.println("<form id='form' action='index_cliente.jsp' method='post'>");
        out.println("<input type='hidden' name='id' value='" + id + "' />");
        out.println("<input type='hidden' name='correo' value='" + correo_bd + "' />");
        out.println("<input type='hidden' name='contra' value='" + contra_bd + "' />");
        out.println("</form>");
        out.println("<script type='text/javascript'>");
        out.println("document.getElementById('form').submit();");
        out.println("</script>");
    }
    
    else {
        out.println("<script type='text/javascript'>");
        out.println("window.location.href='Sesion.jsp';");
        out.println("</script>");
    }

    
    // Cerrar conexión
    rs.close();
    ps.close();
    conn.close();
%>
