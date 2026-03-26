<cfscript>
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