
component {
	this.name='sportsdatabase';
	this.datasource='sportsdatabase';
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);
    this.ormEnabled = true;
    this.ormSettings = {
        logsql = true,
        dbcreate = "update",
        cfclocation = "datamodels"
    };
    this.invokeImplicitAccessor = true;

    function onApplicationStart(){
		return true;
	}

    function onRequestStart(string targetPage){
        if(structKeyExists(url,'reload')){
            onApplicationStart();
            ormReload();
        }
    }
}