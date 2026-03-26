<cfscript>
void function SpreadsheetFormatColumn(
  required any spreadsheet,
  required struct format,
  required numeric column
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatColumn( argumentCollection=arguments )
}
</cfscript>