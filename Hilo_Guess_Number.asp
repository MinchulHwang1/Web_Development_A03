<!--
    This source is the fourth File of Hi-lo game
    In this part, the game logics are in the server part(follow Hi-lo roles)
    the number is checked in client part which is validate or not
-->
<%
dim inputName
dim inputNum
dim inputGuessNum
dim randomNumber
dim guessCount
dim max
dim min
dim guessNumberPlus
dim guessNumberMinus
dim count
dim guessMin
dim guessMax


inputNum = CDbl(Request.Cookies("InputNum"))                    'to get as long style
inputName = Request.Cookies("InputName")
inputGuessNum = CDbl(Request.Cookies("InputGuessNum"))          'to get as long style
randomNumber = CDbl(Request.Cookies("RandomNumber"))            'to get as long style
constMin = 1
constMax = Request.Cookies("inputNum")


min = 1
max = Request.Cookies("inputNum")
Response.Cookies("min") = min
Response.Cookies("max") = max

'to set min and max value for user play hi-lo game first getTime
'and after first number input, it will be proper as appriciate number from user input
if Request.Cookies("guessMin") = "" Then
    guessMin = Request.Cookies("min")
    Response.Cookies("guessMin") = guessMin
else
    guessMin = Request.Cookies("guessMin")
end if

if Request.Cookies("guessMax") = "" Then
    guessMax = Request.Cookies("InputNum")
    Response.Cookies("guessMax") = guessMax
else
    guessMax = Request.Cookies("guessMax")
end if

%>

<% 
'the game logic
    if inputGuessNum >= constMin and inputGuessNum <= inputNum then
        if inputGuessNum = randomNumber then
            Response.redirect("Hilo_Win.asp")
        elseif inputGuessNum > randomNumber then
            guessMax = inputGuessNum - 1
        else
            guessMin = inputGuessNum + 1
        end if
    else
        Messages = "Guess number is out of range"
        Response.write(Messages)
    end if

        Response.Cookies("guessMin") = guessMin
        Response.Cookies("guessMin").Expires = DateAdd("d", 1, Now)
        Response.Cookies("guessMax") = guessMax    
        Response.Cookies("guessMax").Expires = DateAdd("d", 1, Now)
         
%>



<!DOCTYPE html>
<html>

<head>
    <title>Make Random Number & Guess Number</title>
    <script>
        
        // ------- Function Comment -------
        // Name     : SetCookie
        // Purpose  : Set Value as Cookie.
        // Input    : cookieName        the name which is set as cookie
        //            cookieValue       the value which is in cookie
        //            numDays           the set date wthen the cookie is made
        // Output   : None
        // Returns  : None
        function setCookie(cookieName, cookieValue, numDays) 
        {
		    var d = new Date();
		    d.setTime(d.getTime() + (numDays * 24 * 60 * 60 * 1000));
		    var expires = "expires="+d.toUTCString();
		    document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
        }
        
        // ------- Function Comment -------
        // Name     : IsNum
        // Purpose  : this function can check whether number or not
        // Input    : number        the variable needed to be checked number or not
        // Output   : None
        // Returns  : checkNumber   bool type of variable. if the number is integer return true, or false.
        function IsInt(number) {
            var intValid = /^\d+$/;
            return intValid.test(number);
        }

        // ------- Function Comment -------
        // Name     : validNum
        // Purpose  : this function is for the submit button called 'submit', and it can action each situation wheh user put numbers
        // Input    : which             a button variable
        // Output   : Messages that fit on each situation
        // Returns  : submit            send the result whether submit or not. if it is submitted, page will go to Hilo_Win.asp
        function validNum(which) {
            var submit = false;
            document.getElementById("RangeError").innerHTML = "";

            var maxNum = document.getElementById("guessNum").value;
            var numValue = parseInt(maxNum, 10);
                   
            if (!IsInt(maxNum)) {
                document.getElementById("RangeError").innerHTML = "Error : Please Enter an integer Number";
            } 
            else {
                submit = true;
                setCookie("InputGuessNum", numValue, 1);
                location.reload();
                }   
            return submit;
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
    <% 
    inputGuessNum = Request.Cookies("InputGuessNum")
    if inputGuessNum >= 1 Or inputGuessNum <= randomNumber then %>
    <form name = "Hilo_Guess_Number_Form">
    <div id = "pageUserGuessNum">
        <h1>OK <%=inputName%></h1>
        <h2> Let's guess Number</h2>
        <p>Your allowable guessing range is any value bewteen <%=guessMin%> and <%=guessMax%></p>
        <div class = "input_centerAlign">
            Guess the number : 

            <input id = "guessNum" type = "text" name = "InputGuessNum">
            <br>
            <input id = "submitGuessNum" type = "button" value = "Make this Guess" onclick="validNum('guessNum')">
            <div id = "RangeError" style = "color: red;"></div>
        </div>   
            
    </div>
        
    </form>
    <% end if %>
</body>          
          
</html>