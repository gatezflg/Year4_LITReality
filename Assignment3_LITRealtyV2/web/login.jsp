<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
<body>
  <div class="login-page">
    <shiro:guest>
        <h2>Login</h2>
        <c:if test="${shiroLoginFailure != null}">
              Username or password incorrect
        </c:if>
    <form name="loginform" method="post" action="LoginServlet">
        <table border="0" cellspacing="2" cellpadding="2">
            <tbody>
                <tr>
                    <td> <label for="username">Username:</label></td>
                    <td><input type="text" id="username" name="username" /></td>
                </tr>
                <tr>
                    <td> <label for="password">Password:</label></td>
                    <td> <input type="password" id="password" name="password" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Login" /></td>
                    <td><input type="reset" value="Reset" /></td>
                </tr>
            </tbody>
        </table>
        <br/>
        <label for="rememberMe">Remember me:</label>
        <input type="checkbox" id="rememberMe" name="rememberMe" value="true" />
        <br/>
    </shiro:guest>

        <br/>
        <shiro:user>

            You are already authenticated with the application
            <br>
             <a href="LoginServlet">Go to dashboard</a>
        </shiro:user>
    </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<!--    <script src="js/index.js"></script>-->
    <script src="../../../assets/js/input_index.js" type="text/javascript"></script>
</body>
</html>
