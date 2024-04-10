<!--
    This source is the fifth File of Hi-lo game
    In this part, all of cookie which can disturb for the next game will be deleted in server side
    the alert of win will come out in client side.
    and also if user press 'Play Again' button, it will go to Hilo_Input_Number.asp page
-->
<%
dim inputName
dim randomNumber
dim guessMin
dim guessMax

inputNum = Request.Cookies("InputNum")
inputName = Request.Cookies("InputName")
randomNumber = Request.Cookies("RandomNumber")
guessMin = Request.Cookies("guessMin")
guessMax = Request.Cookies("guessMax")
inputGuessNum = Request.Cookies("InputGuessNum")
constMin = 1
constMax = Request.Cookies("inputNum")

'delete all cookies which have possibility to distrub to next game
Response.Cookies("InputGuessNum") = ""
Response.Cookies("InputGuessNum").Expires = DateAdd("d", -7, Now)
Response.Cookies("guessMin") = ""
Response.Cookies("guessMin").Expires = DateAdd("d", -7, Now)
Response.Cookies("guessMax") = ""
Response.Cookies("guessMax").Expires = DateAdd("d", -7, Now)
Response.Cookies("InputNum") = ""
Response.Cookies("InputNum").Expires = DateAdd("d", -7, Now)
Response.Cookies("constMin") = ""
Response.Cookies("constMin").Expires = DateAdd("d", -7, Now)
Response.Cookies("constMax") = ""
Response.Cookies("constMax").Expires = DateAdd("d", -7, Now)

%>



<!DOCTYPE html>
<html>
<head>
    <title>WDD A03 assignment.</title>

    <script type = "text/JavaScript">

        // ------- Function Comment -------
        // Name     : playAgain
        // Purpose  : if user want, play again this game and go to Hilo_Input_Number.asp page
        // Input    : None
        // Output   : None
        // Returns  : None
        function playAgain(){
            document.Hilo_Win_Form.submit();
        }
    </script>
    <style>
        body{background-color: rgb(176, 248, 235);}
        h1{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(34, 23, 184);
        }
        h2{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(75, 36, 201);
        }
        form{
            
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
        }
        p{
            color:rgb(227, 64, 64);
            font-size: 20px;
            font-style :inherit;
        }
        .input_centerAlign{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            
        }
    </style>
</head>

<body>
    <form name = "Hilo_Win_Form" action="Hilo_Input_Number.asp" method="post">
    <div>
        <h1>You Won!</h1>
        <h1>You guessed the number!!</h1>
        <br>
        <h2>Nice! <%=inputName%> </h2>
        <div class="input_centerAlign">
            <p> your Number is <i><%=randomNumber%></i>!!!</p>
            <input id = "PlayAgainButton" type = "button" value = "Play Again" onclick="playAgain();">
        </div>
    </div>
    </form>
</body>
</html>