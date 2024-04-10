<!--
    This source is the second File of Hi-lo game
    In this part, the user name is get in the server part,
    the number is checked in client part.
    and in this page, the number is checked just the number is validate.
-->

<%
dim inputName                                   
inputName = Request.Cookies("InputName")            'Get name from cookie
%>
<!DOCTYPE html>
<html>
<head>
    <title>Hilo_Input_Number.asp - WDD A03</title>

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
        // Name     : validNum(
        // Purpose  : this function is for the submit button called 'submit', and it can action each situation wheh user put numbers
        // Input    : which             a button variable
        // Output   : Messages that fit on each situation
        // Returns  : submit            send the result whether submit or not. if it is submitted, page will go to Hilo_Check_Number.asp
        function validNum(which) {
            var maxNum = document.getElementById("Num").value;
            var submit = false;
            document.getElementById("NumError").innerHTML = "";
            var numValue = parseInt(maxNum, 10);

            if ((!IsInt(maxNum)) || maxNum == 0) {
                document.getElementById("NumError").innerHTML = "Error : Please Enter an integer Number";
            } 
            else {
                    setCookie("InputNum", numValue, 1);                         // Set the num in the cookie
                    submit = true;
            }
            return submit;
        }
    </script>
    <style>
        body{background-color: rgb(222, 166, 45);}
        h1{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-style :oblique;
            color: rgb(163, 127, 255);

        }
        form{
            
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh;
        }
        p{
            color:blueviolet;
            font-size: 30px;
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
    <form name = "Hilo_Form" action="Hilo_Check_Number.asp" method="post" onsubmit="return validNum('Num')">
        <div id = "PageInputMaxNum">
        <h1>OK <%=inputName%></h1>
        <br>
        <br>
        <p>Insert the Maxmum number you want : </p>
        <div class="input_centerAlign">
            <input id = "Num" type = "text" name = "InputNum">
            <br>
            <input id = "SubmitNum" type = "submit" value = "submit" onclick="validNum('Num');">
        </div>
        <br>
        <div id = "NumError" style = "color: red;"></div>
            
        </div>

    </form>
    
</body>
</html>