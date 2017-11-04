<cfparam name="URL.playerID" default=""/>
<cfparam name="URL.teamID" default=""/>
<cfparam name="URL.action" default=""/>
<cfset oLoadPlayer = new cfc.Player()/>

<cfif StructKeyExists(form, "playerName")>
    <cfset sportID = oLoadPlayer.save(val(form.playerID), form.playerName, val(form.sportID), val(form.teamID))/>
    <cflocation url="PlayersPage.cfm?sportID=#sportID#">
</cfif>

<cfif StructKeyExists(URL, "action") and URL.action == "assignPlayer">
    <cfset teamID = oLoadPlayer.assignPlayer(val(url.playerID), val(url.teamID))/>
    <cflocation url="ManageTeam.cfm?id=#teamID#">
</cfif>

<cfif StructKeyExists(URL, "action") and URL.action == "releasePlayer">
    <cfset oLoadPlayer.releasePlayer(val(url.playerID))/>
    <cflocation url="ManageTeam.cfm?id=#url.teamid#">
</cfif> 