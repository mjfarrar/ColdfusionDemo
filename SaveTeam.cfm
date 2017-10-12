<cfset oLoadTeam = new cfc.Team()/>

<cfset teamID = oLoadTeam.save(val(form.teamID), val(form.sportID), form.teamName, form.teamCity, form.teamState)/>

<cflocation url="TeamPage.cfm?id=#teamID#">