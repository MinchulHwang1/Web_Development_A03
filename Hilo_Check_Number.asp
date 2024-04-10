<!--
    This source is the third File of Hi-lo game
    In this part, the user name and input number are get in the server part, 
    and check the number is 0 and 1. 
    the number is checked in client part also to check guess number which is get from user as guess number
    and in this page, the numbers are checked just the number is validate.
-->

<%
dim inputName
dim inputNum

inputName = Request.Cookies("InputName")
inputNum = request.Cookies("InputNum")

dim Messages
Messages = "Please enter a number greater than 1"

'the function which can figure the inputNum is 0 or 1
function checkOne()

    if inputNum = "0" then
        Response.write(Messages)
    else if inputNum = "1" then
        Response.write(Messages)

        end if
        
    end if
end function
%>

<!DOCTYPE html>
<html>

<head>
    <title>Read input number</title>
    <script type = "text/JavaScript">

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
        // Returns  : submit            send the result whether submit or not. if it is submitted, page will go to Hilo_Guess_Number.asp
        function validNum(which) {
            var submit = false;
            document.getElementById("NumError").innerHTML = "";

            var maxNum = document.getElementById("Num").value;
            var numValue = parseInt(maxNum, 10);

            if (!IsInt(maxNum)) {
                document.getElementById("NumError").innerHTML = "Error : Please Enter an integer Number";
                        
                } 
                else {
                submit = true;
                setCookie("InputNum", numValue, 1);
                location.reload();                                                  // update the page when the button is put
                }   
            return submit;
        }

        // ------- Function Comment -------
        // Name     : validGuessNum
        // Purpose  : this function is for the submit button called 'submit', and it can action each situation wheh user put numbers
        // Input    : which             a button variable
        // Output   : Messages that fit on each situation
        // Returns  : submit            send the result whether submit or not. if it is submitted, page will go to Hilo_Guess_Number.asp
        function validGuessNum(which){
            var submit = false;
            document.getElementById("GuessError").innerHTML = "";

            var maxNum = document.getElementById("guessNum").value;
            var numValue = parseInt(maxNum, 10);
            if (!IsInt(maxNum) || (maxNum == 0)) {
                document.getElementById("GuessError").innerHTML = "Error : Please Enter an integer Number";
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
        body{background-color: rgb(137, 222, 45);}
        h1{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(221, 63, 187);
        }
        h2{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(231, 102, 203);
        }
        h3{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(231, 102, 203);
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
    inputNum = Request.Cookies("InputNum")
    if inputNum = 1 then %>
    <form name = "Hilo_Check_Number_Form" action="Hilo_Guess_Number.asp" method="post" onsubmit="return validNum('Num')">
        
        <div id = "PageInputMaxNum">
            <h1>OK <%=inputName%></h1>
            <p style="color: blueviolet;">Insert the Maxmum number you want : </p>
            <div calss = "input_centerAlign">
                <input id = "Num" type = "text" name = "InputNum">
                <br>
                <input id = "SubmitNum" type = "button" value = "submit" onclick = "validNum('Num')">
                <br>
            </div>
            <div id = "NumError" style = "color: red;"></div>
                
            <div style="color: tomato; font-style: italic;"><%= checkOne()%></div>
        </div>
           
    </form>
    <% else%>

    <form name = "Hilo_Guess_Number_Form" action="Hilo_Guess_Number.asp" method="post" onsubmit="return validGuessNum('Num')">
        <% 
            dim randomNumber 

            randomNumber = Int(((inputNum-1) * Rnd) +1)

            Response.Cookies("RandomNumber") = randomNumber
            Response.Cookies("RandomNumber").Expires = DateAdd("d", 1, Now)
        %>
        
        <div id = "PageInputMaxNum">
            <h1>OK <%=inputName%></h1>
            <h2> Let's guess Number</h2>
            <p>Your allowable guessing range is any value bewteen 1 and <%=inputNum%></p>
            <div class="input_centerAlign">
                <p style="color: blueviolet;">Guess the number :</p>
                <input id = "guessNum" type = "text" name = "InputGuessNum">
                <br>
                <input id = "submitGuessNum" type = "submit" value = "Make this Guess" onclick="validGuessNum('guessNum')">
                <br>
            </div>
            <div id = "GuessError" style = "color: red;"></div>
        </div>
        
    </form>
    <% end if%>    
    </body>
</html>