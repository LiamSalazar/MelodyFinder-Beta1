<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
try {
    String id_Usuario = request.getParameter("idUsuario");
    String id_Cliente = request.getParameter("idCliente");

    // Verificar si los parámetros son null o están vacíos
    if (id_Usuario != null && id_Cliente != null && !id_Usuario.isEmpty() && !id_Cliente.isEmpty()) {
        int idUsuario = Integer.parseInt(id_Usuario);
        int idCliente = Integer.parseInt(id_Cliente);

        String url = "jdbc:mysql://localhost:3306/melodyfinder";
        String username = "root";
        String password = "n0m3l0";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, username, password);

        String query = "INSERT INTO Enlista (Id_artista, Id_cliente) VALUES (?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, idUsuario);
        statement.setInt(2, idCliente);

        int rowsInserted = statement.executeUpdate();

        if (rowsInserted > 0) {
            out.println("¡Alta exitosa en la tabla Enlista!");

            // Redireccionar a index_cliente.jsp después de la operación exitosa
            String irl = "Cuenta_ArtistaBD.jsp?id=" + idUsuario + "&id_cliente=" + idCliente;

	   // Redireccionar a la página Cuenta_ArtistaBD.jsp con los parámetros
       	   response.sendRedirect(irl);
        } else {
            out.println("Error al realizar el alta.");
        }

        statement.close();
        connection.close();
    } else {
        out.println("Los parámetros idUsuario o idCliente son inválidos.");
    }
} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
    out.println("Excepción: " + e.getMessage());
}
%>
