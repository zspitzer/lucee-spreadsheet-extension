<cfscript>
void function SpreadsheetSetCellComment(
	required any spreadsheet,
	required struct comment,
	required numeric row,
	required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setCellComment(
    arguments.spreadsheet,
    arguments.comment,
    arguments.row,
    arguments.column
  )
}
</cfscript>