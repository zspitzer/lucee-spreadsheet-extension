<cfscript>
/**
* Sets the width of a column in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @column Column number
* @width Width in characters
*/
void function SpreadsheetSetColumnWidth(
	required any spreadsheet,
	required numeric column,
	required numeric width
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setColumnWidth( arguments.spreadsheet, arguments.column, arguments.width )
}
</cfscript>