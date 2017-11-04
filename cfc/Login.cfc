<cfcomponent>

    <cffunction name="login">
        <cfargument name="username" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        <cfset user = EntityLoad("Users", {username = "arguments.username"}, true)/>
        
        <cfif user == null>
            <cfreturn false />
        </cfif>

        <cfset hashedPassword = getHashedPassword(arguments.password, user.salt)/>

        <cfif hashedPassword == user.password>
            <cfreturn true/>
        </cfif>

        <cfreturn false/>
    </cffunction>

    <cffunction name="hashPassword">
        <cfargument name="password" type="string" required="true">

        <cfset variables.salt = Hash(GenerateSecretKey("AES"), "SHA-512") />

        <cfset variables.hashedPassword = Hash(arguments.password & variables.salt, "SHA-512") />

        <cfreturn variables />
    </cffunction>

    <cffunction name="getHashedPassword">
        <cfargument name="password" type="string" required="true">
        <cfargument name="salt" type="string" required="true">

        <cfset hashedPassword = Hash(arguments.password & arguments.salt, "SHA-512") />

        <cfreturn hashedPassword />
    </cffunction>

    <cffunction name="createUser">
        <cfargument name="form" type="struct" required="true"/>

        <cfset passwordSalt = hashPassword(arguments.form.password)/>

        <cfset user = EntityNew("Users")/>
        <cfset user.username = arguments.form.username/>
        <cfset user.password = passwordSalt.hashedPassword/>
        <cfset user.salt = passwordSalt.salt/>

        <cfset EntitySave(user)/>

        <cfset ormFlush()/>

        <cfreturn user.id/>
    </cffunction>

</cfcomponent>