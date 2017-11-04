<cfset login = new cfc.Login()/>


<cfoutput>
<form id="loginForm">

    Username: <input type="text" name="username"/><br/>
    Password: <input type="text" name="password"/><br/>

    <input type="button" value="Login" id="loginButton"/>

</form>
</cfoutput>