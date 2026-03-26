<cfscript>
void function SpreadsheetSetRowHeight(
	required any spreadsheet,
	required numeric row,
	required numeric height
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setRowHeight( arguments.spreadsheet, arguments.row, arguments.height )
}
</cfscript>