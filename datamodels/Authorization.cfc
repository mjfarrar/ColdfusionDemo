component persistent = "true"{
    property name="id" column="ID" fieldtype="id" generator="increment";
    property name="name" column="Name" ormType="text";
}