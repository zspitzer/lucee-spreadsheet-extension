<cfscript>
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