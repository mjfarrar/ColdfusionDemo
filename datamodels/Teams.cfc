component persistent="true" {
    property name="id" column="ID" fieldtype="id" generator="increment";
    property name="name" column="TeamName" ormtype="text";
    property name="city" column="City" ormtype="text";
    property name="state" column="State" ormtype="text";
    property name="sportid" column="SportID" ormtype="number";
    
    property name="players" fieldtype="one-to-many" cfc="Players" fkcolumn="team"; 
}