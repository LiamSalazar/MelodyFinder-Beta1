<%@page import="java.sql.*"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String correo = request.getParameter("email");
    String password = request.getParameter("password");

    
%>

<%

// Realizar la búsqueda en la base de datos
// (Aquí asumimos que se está utilizando JDBC para conectarse a la base de datos)

// Configurar la conexión a la base de datos
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/melodyfinder";
String usuario = "root";
String contraseña = "n0m3l0";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    // Cargar el driver de la base de datos
    Class.forName(driver);
    
    // Establecer la conexión
    conn = DriverManager.getConnection(url, usuario, contraseña);

    // Verificar si el correo electrónico existe en la tabla "Artista"
    String queryArtista = "SELECT * FROM Artista WHERE Correo_electronico_artista = ?";
    stmt = conn.prepareStatement(queryArtista);
    stmt.setString(1, correo);
    rs = stmt.executeQuery();

    if (rs.next()) {
        // El correo electrónico ya existe en la tabla "Artista"
        
        response.sendRedirect("Crear_Cuenta.jsp");
        out.println("<script>alert('Correo en uso, intente con otro.');</script>");
    } else {
        // Verificar si el correo electrónico existe en la tabla "Cliente"
        String queryCliente = "SELECT * FROM Cliente WHERE Correo_electronico_cliente = ?";
        stmt = conn.prepareStatement(queryCliente);
        stmt.setString(1, correo);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // El correo electrónico ya existe en la tabla "Cliente"
            
            response.sendRedirect("Crear_Cuenta.jsp");
            out.println("<script>alert('Correo en uso, intente con otro.');</script>");
        } else {
            // El correo electrónico no se encuentra en ninguna de las tablas
            //Generar Id_cliente automático
            int id_cliente = 0;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
                PreparedStatement ps = con.prepareStatement("SELECT MAX(Id_cliente) FROM Cliente");
                rs = ps.executeQuery();
                if(rs.next()){
                    id_cliente = rs.getInt(1) + 1;
                }else{
                    id_cliente = 1;
                }
            }catch(Exception e){
                out.println(e);
            }
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
                PreparedStatement ps = con.prepareStatement("INSERT INTO Cliente(Id_cliente, Nombre_cliente, Apellido_cliente, Correo_electronico_cliente, Pass_cliente) VALUES(?,?,?,?,?)");
                ps.setInt(1, id_cliente);
                ps.setString(2, nombre);
                ps.setString(3, apellido);
                ps.setString(4, correo);
                ps.setString(5, password);
                ps.executeUpdate();
                response.sendRedirect("Sesion.jsp");
            }catch(Exception e){
                out.println(e);
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Cerrar las conexiones y liberar los recursos
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (stmt != null) {
        try {
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
