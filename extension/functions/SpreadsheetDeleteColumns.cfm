<cfscript>
void function SpreadsheetDeleteColumns(
	required any spreadsheet,
  required string range
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteColumns( arguments.spreadsheet, arguments.range )
}
</cfscript>