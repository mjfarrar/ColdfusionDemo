<cfcomponent>
    <cffunction name = "get">
        <cfargument name="ID" type="string" required="true" default="0">

        <cfif arguments.ID eq 0>
            <cfreturn EntityNew("Teams")/>
        </cfif>
        
        <cfreturn EntityLoad("Teams", val(arguments.ID), true)/>

    </cffunction>

    <cffunction name = "list">

        <cfreturn EntityLoad("Teams")/>

    </cffunction>

    <cffunction name="save">
        <cfargument name="teamID" type="number" required="true"/>
        <cfargument name="teamName" type="string" required="true"/>
        <cfargument name="teamCity" type="string" required="true"/>
        <cfargument name="teamState" type="string" required="true"/>
        <cfargument name="teamSport" type="number" required="true"/>

        <cfset var dbTeam = get(teamID)/>

        <cfset dbTeam.setName(arguments.teamName)/>
        <cfset dbTeam.setCity(arguments.teamCity)/>
        <cfset dbTeam.setState(arguments.teamState)/>
        <cfset dbTeam.setSportid(arguments.teamSport)/>

        <cfset EntitySave(dbTeam)/>

        <cfset ormFlush() />

        <cfreturn dbTeam.id/>

    </cffunction>

</cfcomponent>