<cfparam name="URL.ID" default=""/>
<!--- <cfset oLoadTeam =  createObject("component", "cfc.loadTeam")/> --->
<cfset oLoadTeam = new cfc.Team()/>
<cfset team = oLoadTeam.get(URL.ID)/>
<cfset teamList = oLoadTeam.list()/>

<table>
    <thead>
        <tr>
            <th>Team Name</th>
            <th>Team City</th>
            <th>Team State</th>
            <th>Edit Team</th>
        </tr>
    </thead>

    <tbody>
        <cfoutput>
            <cfloop array="#teamList#" index="idx">
                <tr>
                    <td>#idx.name#</td>
                    <td>#idx.city#</td>
                    <td>#idx.state#</td>
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
    <form name="teamForm">
        <cfoutput>
            <div>
                <input type="hidden" name="teamID" value="#team.id#"/>
                <input type="hidden" name="sportID" value="#team.sport#"/>
                Team Name: <input type="text" name="teamName" value="#team.name#"/>
                Team City: <input type="text" name="teamCity" value="#team.city#"/>
                Team State: <input type="text" name="teamState" value="#team.state#"/>
            </div>
        </cfoutput>
        <div>
            <input type="submit" value="Save Team Information"/>
        </div>
    </form>
</cfif>