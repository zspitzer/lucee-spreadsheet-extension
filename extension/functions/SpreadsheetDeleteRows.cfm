<cfscript>
void function SpreadsheetDeleteRows(
	required any spreadsheet,
  required string range
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteRows( arguments.spreadsheet, arguments.range )
}
</cfscript>