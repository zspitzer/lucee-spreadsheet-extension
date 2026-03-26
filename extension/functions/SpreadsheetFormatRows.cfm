<cfscript>
void function SpreadsheetFormatRows(
  required any spreadsheet,
  required struct format,
  required string rows // -> range in SpreadsheetCFML
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatRows( arguments.spreadsheet, arguments.format, arguments.rows )
}
</cfscript>