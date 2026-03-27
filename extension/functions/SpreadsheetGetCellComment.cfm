<cfscript>
/**
* Returns the comment on a cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @row Row number of the cell
* @column Column number of the cell
*/
any function SpreadsheetGetCellComment(
	required any spreadsheet,
	numeric row,
	numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	return spreadsheetCFML.getCellComment( argumentCollection=arguments )
}
</cfscript>