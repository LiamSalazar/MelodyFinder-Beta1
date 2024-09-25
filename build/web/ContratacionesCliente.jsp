<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    String Id_cliente = request.getParameter("id");
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
        String url = "jdbc:mysql://localhost:3306/melodyfinder";
        String user = "root";
        String password = "n0m3l0";
        conn = DriverManager.getConnection(url, user, password);
        stmt = conn.createStatement();

        // Realiza la consulta utilizando INNER JOIN para obtener los eventos relacionados con el ID del cliente
        String query = "SELECT e.Id_Eventos, e.Id_artista, a.Nombre_artistico, e1.Fecha, e1.Hora_inicio, e1.Hora_final, e1.Estado " +
                       "FROM Eventos e " +
                       "INNER JOIN Artista a ON e.Id_artista = a.Id_artista " +
                       "INNER JOIN Eventos_1 e1 ON e.Id_Eventos = e1.Id_Eventos " +
                       "WHERE e.Id_cliente = " + Id_cliente+
                        " ORDER BY e.Id_Eventos DESC";

        rs = stmt.executeQuery(query);
%>

<html>
    <head>
        <title>MelodyFinder</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Styles/ContratacionesCliente.css">
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
        
            int idEvento = rs.getInt("Id_Eventos");
            int idArtista = rs.getInt("Id_artista");
            String nombreArtista = rs.getString("Nombre_artistico");
            Date fecha = rs.getDate("Fecha");
            Time horaInicio = rs.getTime("Hora_inicio");
            Time horaFinal = rs.getTime("Hora_final");
            String estado = rs.getString("Estado");
            String img = arrayCadenas[contador];
%>
                <div class="col" ontouchstart="this.classList.toggle('hover');">
                    <div class="container">
                        <div class="front" style="background-image: url(<%= img %>)">
                            <div class="inner">
                                <p><%= nombreArtista %></p>
                                <span><%= fecha %></span>
                            </div>
                        </div>
                        <div class="back">
                            <div style="display: flex; justify-content: flex-end; margin-top: 20px;">
                                    <% if (!estado.equals("Terminó el Artista") && !estado.equals("Terminó el Cliente") && !estado.equals("Terminado")) { %>
                                        <a href="EliminarEvento.jsp?idEvento=<%= idEvento %>&idCliente=<%= Id_cliente %>" style="margin-right: 5px;">
                                            <img src="Tache.png" alt="Tache" width="20px" height="20px">
                                        </a>
                                    <% } %>
                                    <% if (estado.equals("Esperando al cliente")) { %>
                                        <a href="FinalizarEvento.jsp?idEvento=<%= idEvento %>&idCliente=<%= Id_cliente %>&idArtista=<%= idArtista %>">

                                            <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                        </a>
                                    <% } %>
                                    <% if (estado.equals("Activo")) { %>
                                        <a href="CambioFinalizandoCliente.jsp?idEvento=<%= idEvento %>&idCliente=<%= Id_cliente %>&idArtista=<%= idArtista %>">

                                            <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                        </a>
                                    <% } %>
                                    <% if (estado.equals("Finalizado")) { %>
                                        <a href="CuestionarioEvaluarArtista.jsp?idEvento=<%= idEvento %>&idCliente=<%= Id_cliente %>&idArtista=<%= idArtista %>">
                                            <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                        </a>
                                    <% } %>
                                    <% if (estado.equals("Terminó el Artista")) { %>
                                        <a href="CuestionarioEvaluarArtista.jsp?idEvento=<%= idEvento %>&idCliente=<%= Id_cliente %>&idArtista=<%= idArtista %>">
                                            <img src="Paloma.png" alt="Paloma" width="15px" height="18px" style="margin-right: 10px;">
                                        </a>
                                    <% } %>
                            </div>
                            <div class="inner">
                                <% SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); %>
                                <p><%= sdf.format(horaInicio) %> - <%= sdf.format(horaFinal) %></p><br>
                                <p><%= estado %></p>
                                <input type="hidden" name="idEvento" value="<%= idEvento %>">
                                <input type="hidden" name="idArtista" value="<%= idArtista %>">
                                <input type="hidden" name="idCliente" value="<%= Id_cliente %>">
                                
                            </div>
                        </div>
                    </div>
                </div>
<%
        contador++;
        }
        // Cierra los recursos utilizados
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
