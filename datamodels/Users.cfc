component persistent = "true"{
    property name="id" column="ID" fieldtype="id" generator="increment";
    property name="username" column="UserName" ormtype="text";
    property name="email" column="Email" ormtype="text";
    property name="password" column="Password" ormtype="text";
    property name="salt" column="Salt" ormtype="text";
    property name="authorization" column="Authorization" ormtype="number";
}