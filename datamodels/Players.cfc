component persistent="true" {
    property name="id" column="ID" fieldtype="id" generator="increment";
    property name="name" column="PlayerName" ormtype="text";
    property name="sport" column="Sport" ormtype="number";
    property name="team" column="Team" ormtype="number";
}