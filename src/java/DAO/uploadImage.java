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
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

    PrintWriter out;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("file-upload");
        String id = request.getParameter("id");
        if (part != null) {
            try {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement("UPDATE Artista SET Foto_perfil_artista=? WHERE Id_artista=?");
                InputStream is = part.getInputStream();
                ps.setBlob(1, is);
                ps.setString(2, id);
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id);

                } else {
                    response.sendRedirect("Mi_Cuenta_ArtistaBD.jsp?id=" + id);

                }
            } catch (IOException | SQLException e) {
                out.println(e);
            }
        }
    }
}