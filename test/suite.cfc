component extends="testbox.system.BaseSpec"{

	/* NOTE: The aim of these tests is mainly just to check that arguments are correctly passed to the underlying Spreadsheet CFML library, not to replicate the library's own extensive test suite */

	function beforeAll(){
		var spreadsheetCFMLPath = server.system.environment.SPREADSHEET_CFML_PATH?: "com/github/cfsimplicity/"
		variables.spreadsheetCFML = New "#spreadsheetCFMLPath#Spreadsheet"() //instance will be used by extension across request
		variables.s = spreadsheetCFML // alias for tests
		variables.tempXlsPath = GetTempDirectory() & "temp.xls"
		variables.tempXlsxPath = GetTempDirectory() & "temp.xlsx"
		variables.spreadsheetTypes = [ "xls", "xlsx" ]
	}

	function getTestFilePath( required string filename ){
		return ExpandPath( "/root/test/files/" ) & arguments.filename
	}

	function afterAll(){
		if( FileExists( variables.tempXlsPath ) )
			FileDelete( variables.tempXlsPath )
		if( FileExists( variables.tempXlsxPath ) )
			FileDelete( variables.tempXlsxPath )
	}

	function run( testResults, testBox ){

		var specs = DirectoryList( ExpandPath( "specs" ), false, "name", "*.cfm" )
		// run every file in the tests folder
		for( var file in specs ){
			include "specs/#file#"
		}

	}

}