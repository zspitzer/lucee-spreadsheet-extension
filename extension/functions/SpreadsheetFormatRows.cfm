<cfscript>
/**
* Applies formatting to multiple rows in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @rows Row range (e.g. "1-5" or "1,3,5")
*/
void function SpreadsheetFormatRows(
  required any spreadsheet,
  required struct format,
  required string rows
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatRows( arguments.spreadsheet, arguments.format, arguments.rows )
}
</cfscript>