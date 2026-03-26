<cfscript>
void function SpreadsheetDeleteColumn(
	required any spreadsheet,
  required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.deleteColumn( arguments.spreadsheet, arguments.column )
}
</cfscript>