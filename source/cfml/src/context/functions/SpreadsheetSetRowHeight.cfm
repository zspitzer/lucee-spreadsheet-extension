<cfscript>
/**
* Sets the height of a row in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @row Row number
* @height Height in points
*/
void function SpreadsheetSetRowHeight(
	required any spreadsheet,
	required numeric row,
	required numeric height
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.setRowHeight( arguments.spreadsheet, arguments.row, arguments.height )
}
</cfscript>