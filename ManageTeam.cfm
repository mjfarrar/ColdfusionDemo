<cfparam name="URL.ID" default=""/>
<cfset oLoadTeam = new cfc.Team()/>
<cfset oLoadSport = new cfc.Sport()/>
<cfset oLoadPlayer = new cfc.Player()/>
<cfset team = oLoadTeam.get(URL.ID)/>
<cfset teamSport = oLoadSport.get(team.sportid)/>
<cfset teamPlayers = team.getPlayers()/>
<cfset freeAgents = oLoadPlayer.listFreeAgents(teamsport.id)/>

<cfoutput>
<div>
<h3>Team: #team.city# #team.name#</h3>
</div>

<span><b>Team Players:</b></span>
<table>
    <tr>
        <th>Player Name</th>
        <th>Release</th>
    </tr>
    <cfloop array="#teamPlayers#" index=idx>
        <tr>
            <td>#idx.name#</td>
            <td><a href="SavePlayer.cfm?playerID=#idx.id#&teamID=#URL.ID#&action=releasePlayer"><b>-</b></a></td>
        </tr>
    </cfloop>
<table>
<br/>
<span><b>Free Agents:</b></span>
<table>
    <tr>
        <th>Player Name</th>
        <th>Sign</th>
    </tr>
    <cfloop array="#freeAgents#" index=idx>
        <tr>
            <td>#idx.name#</td>
            <td><a href="SavePlayer.cfm?playerID=#idx.id#&teamID=#URL.ID#&action=assignPlayer"><b>+</b></a></td>
        </tr>
    </cfloop>
<table>
</cfoutput>