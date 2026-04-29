<cfscript>
/**
* Tests whether a file is a valid spreadsheet.
* @path The file path to test
*/
boolean function IsSpreadsheetFile( required string path ){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	return spreadsheetCFML.isSpreadsheetFile( arguments.path )
}
</cfscript>
