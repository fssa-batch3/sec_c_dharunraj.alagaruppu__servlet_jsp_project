<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Registration</title>
        <link rel="stylesheet" href="./assets/css/registration.css">
    </head>

    <body>
        <div class="main">
            <div class="welcome">
                <img src="https://iili.io/Hy2UOlV.png" alt="NETBLIZ">
                <h1>Welcome!!</h1>
                <h3>After fill all correct data once you click a register button
                    it's take some time to verify your details.</h3>
                <a id="welcome_button" href="login.jsp"><button class="welcome_button">Login</button></a> <a
                    id="welcome_button" href="./index.jsp">Need more clarity ?</a>
            </div>
            <div class="sign_up">
                <h1>Register here !!</h1>
                <form action="./Registration" method="post">
                    <label for="fname"></label>
                    <input type="text" name="fname" pattern="[a-zA-Z]+" id="fname" placeholder="First Name *"
                        title="Your pattern minimum length of 3 characters a_z or A_Z only" autofocus required>
                    <label for="lname"></label>
                    <input type="text" name="lname" id="lname" placeholder="Last Name *" pattern="[a-zA-Z]+"
                        title="Your pattern is minium 1 to 20 character a_z or A_Z only" required>
                    <label for="email"></label>
                    <input type="email" name="email" id="email" placeholder="Email.Id *"
                        title="Check your email format or valid email contains '@' , '.' "
                        pattern="/^(?=.{1,40}$)[A-Za-z0-9._%+-]+@[A-Za-z.-]+\.[A-Za-z]{2,}$/" required>
                    <label for="phone"></label>
                    <input type="tel" name="phone" id="phone" placeholder="Phone number *"
                        title="Your number should be 10 numbers START WITH 6,7,8,9" required maxlength=10
                        pattern="^[6-9]{1}[0-9]{9}$">
                    <label for="pass"></label>
                    <input type="password" name="pass" id="new_pass" placeholder="Create password *"
                        title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                        required>
                    <label for="confirm"></label>
                    <input type="password" name="confirm" id="confirm" placeholder="Confirm password *"
                        title="Must be Confirm password and New password should be equal" required>
                    <div class="btm_btn">
                        <input id="register" class="bottom_button" type="submit" value="Register">
                    </div>
                </form>
            </div>
        </div>
        <jsp:include page="./successOrErrorMsg.jsp"></jsp:include>
    </body>

    </html>