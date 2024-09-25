<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String idUsuario = request.getParameter("id_usuario");

    String url = "jdbc:mysql://localhost:3306/melodyfinder";
    String user = "root";
    String password = "n0m3l0";
    
    String query = "SELECT Dias_Ocupados FROM Dias_Ocupados " +
                   "INNER JOIN Dias ON Dias_Ocupados.Id_Dias = Dias.Id_Dias " +
                   "WHERE Dias.Id_artista = ?";

    // Declarar la variable fechas antes del bloque try-catch
    ArrayList<Date> fechas = new ArrayList<>();

    try (Connection conn = DriverManager.getConnection(url, user, password);
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setInt(1, Integer.parseInt(idUsuario)); // Convertir idUsuario a entero
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Date fecha = rs.getDate("Dias_Ocupados");
            fechas.add(fecha);
        }
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Dynamic Calendar JavaScript | CodingNepal</title>
    <link rel="stylesheet" href="Styles/Calendario.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    
  </head>
  <body>

    <div class="wrapper">
      <header>
        <p class="current-date"></p>
        <div class="icons">
          <span id="prev" class="material-symbols-rounded">chevron_left</span>
          <span id="next" class="material-symbols-rounded">chevron_right</span>
        </div>
      </header>
      <div class="calendar">
        <ul class="weeks">
          <li>S</li>
          <li>L</li>
          <li>M</li>
          <li>M</li>
          <li>J</li>
          <li>V</li>
          <li>S</li>
        </ul>
        <ul class="days"></ul>
      </div>
    </div>
    
    <script>
    // Convertir el ArrayList de fechas a un array de JavaScript
    var fechas = [
      <% for (int i = 0; i < fechas.size(); i++) {
            Date fecha = fechas.get(i);
            int year = fecha.getYear() + 1900;
            int month = fecha.getMonth();
            int day = fecha.getDate();
            
            // Generar la representación de fecha en JavaScript
            out.println("new Date(" + year + ", " + month + ", " + day + ")");
            
            if (i != fechas.size() - 1) {
                out.println(",");
            }
        } %>
    ];

    // Realizar operaciones con el array de fechas aquí
    console.log(fechas);
    </script>
    
    <script src="scripts/Calendario.js" defer></script>
    
  </body>
</html>
