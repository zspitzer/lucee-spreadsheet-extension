<cfscript>
void function SpreadsheetSetActiveSheet(
	required any spreadsheet,
  required string sheetName
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setActiveSheet( arguments.spreadsheet, arguments.sheetName )
}
</cfscript>