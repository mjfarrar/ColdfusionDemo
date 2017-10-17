<cfcomponent>
    <cffunction name = "get">
        <cfargument name="ID" type="string" required="true" default="0">

        <cfif arguments.ID eq 0>
            <cfreturn EntityNew("Players")/>
        </cfif>
        
        <cfreturn EntityLoad("Players", val(arguments.ID), true)/>

    </cffunction>

    <cffunction name = "list">

        <cfreturn EntityLoad("Players")/>

    </cffunction>

    <cffunction name = "listByTeam">
        <cfargument name="teamID" type="string" required="true">

        <cfset query = ormExecuteQuery( "FROM Players WHERE team = ?", [teamID] )/>

        <cfreturn query/>

    </cffunction>

    <cffunction name = "listBySport">
        <cfargument name="sportID" type="number" required="true" default="0">

        <cfif arguments.sportID eq 0>
            <cfreturn EntityLoad("Players")/>
        </cfif>

        <cfset query = ormExecuteQuery( "FROM Players WHERE sport = ?", [sportID] )/>

        <cfreturn query/>

    </cffunction>

    <cffunction name = "listFreeAgents">
        <cfargument name="sportID" type="string" required="true">

        <cfset query = ormExecuteQuery( "FROM Players WHERE sport = ? and (team is null or team = 0)", [sportID] )/>

        <cfreturn query/>

    </cffunction>

    <cffunction name="save">
        <cfargument name="playerID" type="number" required="true" default="0"/>
        <cfargument name="playerName" type="string" required="true"/>
        <cfargument name="playerSport" type="string" required="true"/>
        <cfargument name="playerTeam" type="string" required="false"/>

        <cfset var dbPlayer = get(playerID)/>

        <cfset dbPlayer.setName(arguments.playerName)/>
        <cfset dbPlayer.setSport(arguments.playerSport)/>
        <cfset dbPlayer.setTeam(arguments.playerTeam)/>

        <cfset EntitySave(dbPlayer)/>

        <cfset ormFlush() />

        <cfreturn dbPlayer.sport/>

    </cffunction>

    <cffunction name="assignPlayer">
        <cfargument name="playerID" type="number" required="true"/>
        <cfargument name="playerTeam" type="string" required="true"/>

        <cfset var dbPlayer = get(playerID)/>
        <cfset dbPlayer.setTeam(arguments.playerTeam)/>

        <cfset EntitySave(dbPlayer)/>

        <cfset ormFlush() />

        <cfreturn dbPlayer.team/>

    </cffunction>

    <cffunction name="releasePlayer">
        <cfargument name="playerID" type="number" required="true"/>

        <cfset var dbPlayer = get(playerID)/>
        <cfset dbPlayer.setTeam("")/>

        <cfset EntitySave(dbPlayer)/>

        <cfset ormFlush() />

    </cffunction>

</cfcomponent>