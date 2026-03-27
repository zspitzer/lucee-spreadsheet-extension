component extends="org.lucee.cfml.test.LuceeTestCase" {

	function beforeAll(){
		var spreadsheetCFMLPath = server.system.environment.SPREADSHEET_CFML_PATH ?: "com/github/cfsimplicity/"
		variables.spreadsheetCFML = New "#spreadsheetCFMLPath#Spreadsheet"()
		variables.s = spreadsheetCFML
		variables.tempDir = GetTempDirectory( true )
		variables.tempXlsPath = variables.tempDir & "temp.xls"
		variables.tempXlsxPath = variables.tempDir & "temp.xlsx"
		variables.spreadsheetTypes = [ "xls", "xlsx" ]
	}

	function getTestFilePath( required string filename ){
		return GetDirectoryFromPath( GetCurrentTemplatePath() ) & "../test/files/" & arguments.filename
	}

}
