<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
try {
    // Parámetros recibidos desde el cliente
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    int idCliente = Integer.parseInt(request.getParameter("idCliente"));

    // Datos de conexión a la base de datos
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String username = "root";
    String password = "n0m3l0";

    // Establecer la conexión a la base de datos
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection connection = DriverManager.getConnection(url, username, password);

    // Consulta SQL para eliminar el registro donde coinciden los Id_artista y Id_cliente
    String query = "DELETE FROM Enlista WHERE Id_artista = ? AND Id_cliente = ?";
    PreparedStatement statement = connection.prepareStatement(query);
    statement.setInt(1, idUsuario);
    statement.setInt(2, idCliente);

    // Ejecutar la consulta de eliminación
    int rowsDeleted = statement.executeUpdate();

    if (rowsDeleted > 0) {
        out.println("¡Baja exitosa en la tabla Enlista!");

        // Redireccionar a index_cliente.jsp después de la operación exitosa
        String irl = "Cuenta_ArtistaBD.jsp?id=" + idUsuario + "&id_cliente=" + idCliente;

	// Redireccionar a la página Cuenta_ArtistaBD.jsp con los parámetros
	response.sendRedirect(irl);
    } else {
        out.println("No se encontró el registro para eliminar.");
    }

    // Cerrar conexión y liberar recursos
    statement.close();
    connection.close();
} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
    out.println("Excepción: " + e.getMessage());
}
%>
