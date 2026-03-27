<cfscript>
/**
* Applies formatting to a single cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @row Row number of the cell
* @column Column number of the cell
*/
void function SpreadsheetFormatCell(
  required any spreadsheet,
  required struct format,
  required numeric row,
  required numeric column
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatCell( argumentCollection=arguments )
}
</cfscript>