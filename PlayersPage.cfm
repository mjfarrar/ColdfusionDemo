<cfparam name="URL.SportID" default=""/>
<cfset oLoadSport = new cfc.Sport()/>
<cfset oLoadPlayer = new cfc.Player()/>
<cfset sportList = oLoadSport.list()/>
<cfset playerList = oLoadPlayer.listBySport(val(URL.SportID))/>

<script>
function filterBySport(selectObject) {
    window.location.href="?sportID="+selectObject.value;
}
</script>

<cfoutput>
<span><b>Filter Players By Sport</b></span>
<select name="sportFilter" onchange="filterBySport(this)">
    <option val="">All Sports</option>
    <cfloop array="#sportList#" index="idx">
        <option value="#idx.id#" #isDefined("URL.SportID") && idx.id == URL.SportID ? 'selected="selected"':''#>#idx.name#</option>
    </cfloop>
</select>

<div><b>Players</b></div>
<table>
    <thead>
        <tr>
            <th>Player Name</th>
            <th>Sport</th>
        </tr>
    </thead>

    <tbody>
        <cfloop array="#playerList#" index="idx">
        <cfset sport = oLoadSport.get(idx.sport)/>
            <tr>
                <td>#idx.name#</td>
                <td>#sport.name#</td>
            </tr>
        </cfloop>
    </tbody>
</table>
<br/>
<div><b>Create New Player</b></div>
<form name="newPlayerForm" method="post" action="SavePlayer.cfm">
    <input type="hidden" name="playerID" value=""/>
    <input type="hidden" name="teamID" value=""/>
    <div>
        Player Name: <input type="text" name="playerName"/>
        <select name="sportID">
            <cfloop array="#sportList#" index="idx">
                <option value="#idx.id#" #isDefined("URL.SportID") && idx.id == URL.SportID ? 'selected="selected"':''#>#idx.name#</option>
            </cfloop>
        </select>
    </div>
    <div>
        <input type="submit" value="Create Player"/>
    </div>
</form>
</cfoutput>