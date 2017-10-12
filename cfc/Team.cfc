<cfcomponent>
    <cffunction name = "get">
        <cfargument name="ID" type="string" required="true">

        <cfif arguments.ID eq 0>
            <cfreturn EntityNew("Teams")/>
        </cfif>
        
        <cfreturn EntityLoad("Teams", val(arguments.ID), true)/>

    </cffunction>

    <cffunction name = "list">

        <cfreturn EntityLoad("Teams")/>

    </cffunction>
</cfcomponent>