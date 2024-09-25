<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    String Id_artista = request.getParameter("id_usuario");
%>

<%
    // Establecer la conexión con la base de datos
    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String pass = "n0m3l0";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String[] arrayCadenas = new String[8];
    arrayCadenas[0] = "Evento2.jpg";
    arrayCadenas[1] = "Evento3.jpg";
    arrayCadenas[2] = "Evento4.jpg";
    arrayCadenas[3] = "Evento5.jpg";
    arrayCadenas[4] = "Evento6.jpg";
    arrayCadenas[5] = "Evento7.jpg";
    arrayCadenas[6] = "Evento8.jpg";
    arrayCadenas[7] = "Evento9.jpg";
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
        stmt = conn.createStatement();
        
        // Consulta para obtener los datos de los eventos del artista
        String query = "SELECT e.Id_Eventos, e.Id_cliente, c.Nombre_cliente, c.Apellido_cliente, DATE_FORMAT(e1.Fecha, '%d-%m-%Y') AS Fecha, e1.Hora_inicio, e1.Hora_final, e1.Estado, c.Promedio_numerico_cliente " +
                       "FROM Eventos AS e " +
                       "INNER JOIN Eventos_1 AS e1 ON e.Id_Eventos = e1.Id_Eventos " +
                       "INNER JOIN Cliente AS c ON e.Id_cliente = c.Id_cliente " +
                       "WHERE e.Id_artista = " + Id_artista+
                        " ORDER BY e.Id_Eventos DESC";
        rs = stmt.executeQuery(query);
%>
               
<html>
    <head>
        <title>MelodyFinder</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Styles/ContratacionesArtista.css">
    </head>

    <body style="background-color: #121212">
        <div class="wrapper">
            <h1>Contrataciones</h1>
            <br><br>
            <div class="cols">

                <% 
                    
                    int contador = 0;
                    while (rs.next()) { 
                        if (contador == 8){
                            contador = 0;
                        }
                        String img = arrayCadenas[contador];
                        int idCliente = rs.getInt("e.Id_cliente");
                        String Seguridad = "";
                        String Actitud = "";
                        String Organizacion = "";
                        String Experiencia = "";
                        String Cumplimiento = "";

                        
                        String sql = "SELECT Seguridad, Actitud, Organización, Experiencia, Cumplimiento FROM Cliente WHERE Id_cliente = ?";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setInt(1, idCliente);

                        ResultSet rs2 = statement.executeQuery();

                        if (rs2.next()) {
                            Seguridad = rs2.getString("Seguridad");
                            Actitud = rs2.getString("Actitud");
                            Organizacion = rs2.getString("Organización");
                            Experiencia = rs2.getString("Experiencia");
                            Cumplimiento = rs2.getString("Cumplimiento");

                         }
                %>
                    <div class="col" ontouchstart="this.classList.toggle('hover');">
                        <div class="container">
                            <input type="hidden" value="<%= idCliente %>">
                            <div class="front" style="background-image: url(<%= img %>)">
                                <div class="inner">
                                    <p><%= rs.getString("Nombre_cliente") %> <%= rs.getString("Apellido_cliente") %></p>
                                    <span><%= rs.getString("Fecha") %></span>
                                </div>
                            </div>
                            <div class="back">
                                <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
                                        <% if (!rs.getString("Estado").equals("Terminó el Artista") && !rs.getString("Estado").equals("Terminó el Cliente") && !rs.getString("Estado").equals("Terminado")) { %>
                                            <a href="EliminarEventoArtista.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idUsuario=<%= Id_artista %>" style="margin-right: 5px;">
                                                <img src="Tache.png" alt="Tache" width="20px" height="20px">
                                            </a>
                                        <% } %>
                                        <% if (rs.getString("Estado").equals("Esperando al artista")) { %>
                                            <% int idEvento = rs.getInt("Id_Eventos");%>
                                            <a href="FinalizarEventoArtista.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idArtista=<%= Id_artista %>">
                                                <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                            </a>
                                        <% } %>
                                        <% if (rs.getString("Estado").equals("Activo")) { %>
                                            <% int idEvento = rs.getInt("Id_Eventos");%>
                                            <a href="CambioFinalizandoArtista.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idUsuario=<%= Id_artista %>">
                                                <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                            </a>
                                        <% } %>
                                        <% if (rs.getString("Estado").equals("Finalizado")) { %>
                                            <% int idEvento = rs.getInt("Id_Eventos");%>
                                            <a href="CuestionarioEvaluarCliente.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idUsuario=<%= Id_artista %>">
                                                <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                            </a>
                                        <% } %>
                                        <% if (rs.getString("Estado").equals("Terminó el Cliente")) { %>
                                            <% int idEvento = rs.getInt("Id_Eventos");%>
                                            <a href="CuestionarioEvaluarCliente.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idUsuario=<%= Id_artista %>">
                                                <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                            </a>
                                        <% } %>
                                        
                                </div>
                                <div class="inner">
                                    <% SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); %>
                                    
                                    <p><%= sdf.format(rs.getTime("Hora_inicio")) %> - <%= sdf.format(rs.getTime("Hora_final")) %></p><br>
                                    
                                    <% int idEvento = rs.getInt("Id_Eventos");%>
                                    <a href="ActualizarEstado.jsp?idEvento=<%= rs.getInt("Id_Eventos") %>&idUsuario=<%= Id_artista %>" style="text-decoration:none">
                                        <p class="no-link-style"><%= rs.getString("Estado") %></p>
                                    </a>



                                    <p><%= rs.getFloat("Promedio_numerico_cliente") %></p>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                <% contador++; } %>
            </div>
        </div>
    </body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Cerrar los objetos de conexión
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
