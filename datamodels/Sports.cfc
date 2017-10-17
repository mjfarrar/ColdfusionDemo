component persistent="true" {
    property name="id" column="ID" fieldtype="id" generator="increment";
    property name="name" column="SportName" ormtype="string";
    
    property name="players" fieldtype="one-to-many" cfc="Players" fkcolumn="sport"; 
}