<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {font-family: Arial, Helvetica, sans-serif;}
        /* Full-width input fields */
        input[type=text], input[type=password], input[type=tel] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Set a style for all buttons */
        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        /* Extra styles for the cancel button */
        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        /* Center the image and position the close button */
        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            padding-top: 60px;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button (x) */
        .close {
            position: absolute;
            right: 25px;
            top: 0;
            color: #000;
            font-size: 35px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: red;
            cursor: pointer;
        }

        /* Add Zoom Animation */
        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s
        }

        @-webkit-keyframes animatezoom {
            from {-webkit-transform: scale(0)}
            to {-webkit-transform: scale(1)}
        }

        @keyframes animatezoom {
            from {transform: scale(0)}
            to {transform: scale(1)}
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<security:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
    <h1>Shop</h1>
</security:authorize>
<button onclick="document.getElementById('idin').style.display='block'" style="width:auto;">Login</button>
<button onclick="document.getElementById('idup').style.display='block'" style="width:auto;">Sign Up</button>

<div id="idin" class="modal">

    <form class="modal-content animate" action="/login" method="post" id="formin">
        <div class="imgcontainer">
            <span onclick="document.getElementById('idin').style.display='none', document.getElementById('formin').reset()" class="close" title="Close Modal">&times;</span>
        </div>

        <div class="container">
            <h1>Log In</h1>

            <label for="emailIn"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="emailIn" required>

            <label for="passwordIn"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="passwordIn" required>

            <button type="submit">Login</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('idin').style.display='none', document.getElementById('formin').reset()" class="cancelbtn">Cancel</button>
        </div>
    </form>
</div>

<div id="idup" class="modal">

    <form class="modal-content animate" action="/signup" method="post" id="formup">
        <div class="imgcontainer">
            <span onclick="document.getElementById('idup').style.display='none', document.getElementById('formup').reset()" class="close" title="Close Modal">&times;</span>
        </div>

        <div class="container">
            <h1>Sign Up</h1>
            <p>Please fill in this form to create an account.</p>

            <label for="firstName"><b>First Name</b></label>
            <input type="text" placeholder="Enter First Name" name="firstName" required>

            <label for="lastName"><b>Last Name</b></label>
            <input type="text" placeholder="Enter Last Name" name="lastName" required>

            <label for="mobileNumber"><b>Mobile Number</b></label>
            <input type="tel" placeholder="+380..." name="mobileNumber" pattern="\+380\d{9}" required>

            <label for="emailUp"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="emailUp" required>

            <label for="passwordUp"><b>Password</b></label>
            <input type="password" id="psw" placeholder="Enter Password" name="passwordUp" required>

            <label for="psw-repeat"><b>Repeat Password</b></label>
            <input type="password" id="repsw" placeholder="Repeat Password" name="passwordRepeat" required onkeyup="checkPass(); return false;">

            <button type="submit">Sign Up</button>
            <label>
                <input type="checkbox" checked="checked" name="remember"> Remember me
            </label>

            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
        </div>

        <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('idup').style.display='none', document.getElementById('formup').reset()" class="cancelbtn">Cancel</button>
        </div>
    </form>
</div>


<script type="text/javascript">
    var pass1 = document.getElementById('psw');
    var pass2 = document.getElementById('repsw');

    var goodColor = "#c2eac2";
    var badColor = "#ffb5b5";

    var modalin = document.getElementById('idin');
    var modalup = document.getElementById('idup');

    window.onclick = function(event) {


        if (event.target == modalin) {

            modalin.style.display = "none";
            document.getElementById("formin").reset();
        }

        if (event.target == modalup) {
            modalup.style.display = "none";
            document.getElementById("formup").reset();
            pass2.style.backgroundColor = "#FFFFFF";
        }
    }

    function checkPass()
    {
        if(pass1.value == pass2.value){
            pass2.style.backgroundColor = goodColor;
        }else{
            pass2.style.backgroundColor = badColor;
        }
    }
</script>

</body>
</html>
