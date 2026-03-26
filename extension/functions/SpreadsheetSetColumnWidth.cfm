<cfscript>
void function SpreadsheetSetColumnWidth(
	required any spreadsheet,
	required numeric column,
	required numeric width
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setColumnWidth( arguments.spreadsheet, arguments.column, arguments.width )
}
</cfscript>