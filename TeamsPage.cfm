<cfparam name="URL.ID" default=""/>
<!--- <cfset oLoadTeam =  createObject("component", "cfc.loadTeam")/> --->
<cfset oLoadTeam = new cfc.Team()/>
<cfset oLoadSport = new cfc.Sport()/>
<cfset team = oLoadTeam.get(URL.ID)/>
<cfset teamSport = oLoadSport.get(team.sportid)/>
<cfset teamList = oLoadTeam.list()/>
<cfset sportList = oLoadSport.list()/>

<table>
    <thead>
        <tr>
            <th>Team Name</th>
            <th>Team City</th>
            <th>Team State</th>
            <th>Team Sport</th>
            <th>Edit Team</th>
        </tr>
    </thead>

    <tbody>
        <cfoutput>
            <cfloop array="#teamList#" index="idx">
            <cfset sport = oLoadSport.get(idx.sportid)/>
                <tr>
                    <td>#idx.name#</td>
                    <td>#idx.city#</td>
                    <td>#idx.state#</td>
                    <td>#sport.name#</td>
                    <td><a href="?id=#idx.id#">Edit</a></td>
                </tr>
            </cfloop>
        </cfoutput>
    </tbody>
</table>

<br/>
<a href="?id=0">Add New Team</a>
<br/>

<cfif StructKeyExists(variables, "team")>
    <div><b>Team Information</b></div>
    <form name="teamForm" method="post" action="SaveTeam.cfm">
        <cfoutput>
            <div>
                <input type="hidden" name="teamID" value="#team.id#"/>
                Team Name: <input type="text" name="teamName" value="#team.name#"/>
                Team City: <input type="text" name="teamCity" value="#team.city#"/>
                Team State: <input type="text" name="teamState" value="#team.state#"/>
                Team Sport: 
                <select name="sportID">
                    <cfloop array="#sportList#" index="idx">
                        <option value="#idx.id#" selected="#isDefined("teamSport") && idx.id == teamSport.id#">#idx.name#</option>
                    </cfloop>
                </select>
            </div>
        </cfoutput>
        <div>
            <input type="submit" value="Save Team Information"/>
        </div>
    </form>
</cfif>