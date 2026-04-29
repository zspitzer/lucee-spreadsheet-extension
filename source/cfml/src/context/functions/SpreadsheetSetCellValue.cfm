<cfscript>
/**
* Sets the value of a single cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @value The value to set
* @row Row number of the cell
* @column Column number of the cell
*/
void function SpreadsheetSetCellValue(
	required any spreadsheet,
	required any value,
	required numeric row,
	required numeric column
){
	arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.setCellValue( argumentCollection=arguments )
}
</cfscript>