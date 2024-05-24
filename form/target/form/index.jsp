<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.util.Map" %>
        <% Map<String, String> errores = (Map<String, String>)request.getAttribute("errores");%>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                        crossorigin="anonymous">
                    <title>Formulario</title>
                </head>

                <body>
                    <form action="/form/registro" method="post">
                        <label for="username">Usuario</label>
                        <input type="text" name="username" placeholder="Ingrese usuario" >
                        <% if (errores !=null && errores.containsKey("username")) { out.println("<div> Error usuario: "
                            + errores.get("username") + "</div>");
                            }%>
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" placeholder="Ingrese password">
                            <% if (errores!=null && errores.containsKey("password")) { out.println("<div>Error password"
                                + errores.get("password")+"</div>");
                                }%>
                                <label for="e-mail">Email</label>
                                <input type="text" name="email" id="email" placeholder="Ingrese email">
                                <% if (errores!=null && errores.containsKey("email")) { out.println("<div>Error email" +
                                    errores.get("email")+"</div>");
                                    }%>
                                    <label for="pais">Pais</label>
                                    <select name="pais" id="pais">
                                        <option value="">Seleccionar</option>
                                        <option value="BR">Brasil</option>
                                        <option value="CL">Chile</option>
                                        <option value="CO">Colombia</option>
                                        <option value="EC">Ecuador</option>
                                        <option value="PE">Peru</option>
                                        <option value="UR">Uruguay</option>
                                    </select>
                                    <% if (errores!=null && errores.containsKey("pais")) { out.println("<div>Error pais"
                                        + errores.get("pais")+"</div>");
                                        }%>

                                        <input type="submit" value="Enviar">
                    </form>
                </body>

                </html>