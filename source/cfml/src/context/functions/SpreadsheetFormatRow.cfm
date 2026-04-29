<cfscript>
/**
* Applies formatting to an entire row in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @row Row number to format
*/
void function SpreadsheetFormatRow(
  required any spreadsheet,
  required struct format,
  required numeric row
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatRow( argumentCollection=arguments )
}
</cfscript>