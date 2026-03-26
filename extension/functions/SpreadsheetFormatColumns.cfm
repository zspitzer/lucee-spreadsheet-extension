<cfscript>
void function SpreadsheetFormatColumns(
  required any spreadsheet,
  required struct format,
  required string columns // -> range in SpreadsheetCFML
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatColumns( arguments.spreadsheet, arguments.format, arguments.columns )
}
</cfscript>