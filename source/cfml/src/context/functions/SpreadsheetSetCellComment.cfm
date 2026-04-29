<cfscript>
/**
* Sets a comment on a cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @comment A struct with comment properties (e.g. comment, author)
* @row Row number of the cell
* @column Column number of the cell
*/
void function SpreadsheetSetCellComment(
	required any spreadsheet,
	required struct comment,
	required numeric row,
	required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.setCellComment(
    arguments.spreadsheet,
    arguments.comment,
    arguments.row,
    arguments.column
  )
}
</cfscript>