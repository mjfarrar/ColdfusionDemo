<cfcomponent>
    <cffunction name = "get">
        <cfargument name="ID" type="string" required="true" default="0">

        <cfif arguments.ID eq 0>
            <cfreturn EntityNew("Sports")/>
        </cfif>
        
        <cfreturn EntityLoad("Sports", val(arguments.ID), true)/>

    </cffunction>

    <cffunction name = "list">

        <cfreturn EntityLoad("Sports")/>

    </cffunction>

</cfcomponent>