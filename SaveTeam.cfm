<cfset oLoadTeam = new cfc.Team()/>

<cfset teamID = oLoadTeam.save(val(form.teamID), form.teamName, form.teamCity, form.teamState, val(form.sportID))/>

<cflocation url="TeamsPage.cfm?id=#teamID#">