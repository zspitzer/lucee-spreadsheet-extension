<cfscript>
/**
* Applies formatting to multiple columns in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @columns Column range (e.g. "1-5" or "1,3,5")
*/
void function SpreadsheetFormatColumns(
  required any spreadsheet,
  required struct format,
  required string columns
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatColumns( arguments.spreadsheet, arguments.format, arguments.columns )
}
</cfscript>