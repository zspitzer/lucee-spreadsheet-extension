<cfscript>
void function SpreadsheetRemoveSheet(
	required any spreadsheet,
  required string sheetName
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.removeSheet( arguments.spreadsheet, arguments.sheetName )
}
</cfscript>