package DAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet(name = "uploadManyImages", urlPatterns = {"/uploadManyImages"})

@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadManyImages extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("file-upload");
        String id = request.getParameter("id");

        int Id_Fotos_Artista = 0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/melodyfinder", "root", "n0m3l0");
            PreparedStatement ps = con.prepareStatement("SELECT COALESCE(MAX(Id_Fotos_Artista), 0) FROM Fotos_Artista");
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Id_Fotos_Artista = rs.getInt(1) + 1;
            }else{
                Id_Fotos_Artista = 1;
            }
        }catch(ClassNotFoundException | SQLException e){
            out.println(e);
        }

        if (part != null) {
            try {
                Connection con = DB.getConnection();
                PreparedStatement ps1 = con.prepareStatement("INSERT INTO Fotos_Artista (Id_Fotos_Artista, Id_artista) VALUES (?,?)");
                ps1.setInt(1, Id_Fotos_Artista);
                ps1.setString(2, id);
                result = ps1.executeUpdate();
                if (result > 0) {
                    PreparedStatement ps2 = con.prepareStatement("INSERT INTO Fotos_Muestra (Id_Fotos_Artista, Fotos_muestra) VALUES (?,?)");
                    InputStream is = part.getInputStream();
                    ps2.setInt(1, Id_Fotos_Artista);
                    ps2.setBlob(2, is);
                    result = ps2.executeUpdate();
                    if (result > 0) {
                        response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id);
                    } else {
                        response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id);
                    }
                } else {
                    response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id);
                }
            } catch (IOException | SQLException e) {
                out.println(e);
            }
        }
    }
}