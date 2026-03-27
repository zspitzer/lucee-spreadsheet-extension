component {

	function init( required struct vars ){
		var spreadsheetCFMLPath = server.system.environment.SPREADSHEET_CFML_PATH ?: "com/github/cfsimplicity/"
		arguments.vars.s = New "#spreadsheetCFMLPath#Spreadsheet"()
		arguments.vars.tempDir = GetTempDirectory( true )
		arguments.vars.tempXlsPath = arguments.vars.tempDir & "temp.xls"
		arguments.vars.tempXlsxPath = arguments.vars.tempDir & "temp.xlsx"
		arguments.vars.spreadsheetTypes = [ "xls", "xlsx" ]
	}

	function getTestFilePath( required string filename ){
		return GetDirectoryFromPath( GetCurrentTemplatePath() ) & "../test/files/" & arguments.filename
	}

}
