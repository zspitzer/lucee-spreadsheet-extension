<cfscript>
void function SpreadsheetDeleteRow(
	required any spreadsheet,
  required numeric row
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteRow( arguments.spreadsheet, arguments.row )
}
</cfscript>