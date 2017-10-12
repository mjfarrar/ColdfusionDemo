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

    <cffunction name="save">
        <cfargument name="teamID" type="number" required="true">
        <cfargument name="sportID" type="number" required="true">
        <cfargument name="teamName" type="string" required="true">
        <cfargument name="teamCity" type="string" required="true">
        <cfargument name="teamState" type="string" required="true">

        <cfset var dbTeam = get(teamID)/>

        <cfset dbTeam.name = arguments.teamName />
        <cfset dbTeam.city = arguments.teamCity />
        <cfset dbTeam.state = arguments.teamState />
        <cfset dbTeam.sport = arguments.sportID />

        <cfset EntitySave(dbTeam)/>

        <cfreturn dbTeam.id/>

    </cffunction>

</cfcomponent>