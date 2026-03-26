<cfscript>
boolean function IsSpreadsheetObject( required any testObject ){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	return spreadsheetCFML.isSpreadsheetObject( arguments.testObject )
}
</cfscript>