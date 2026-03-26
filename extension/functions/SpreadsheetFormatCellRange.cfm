<cfscript>
void function SpreadsheetFormatCellRange(
  required any spreadsheet,
  required struct format,
  required numeric startRow,
  required numeric startColumn,
  required numeric endRow,
  required numeric endColumn
){
  // NOTE: the order of arguments is different in SpreadsheetCFML
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.formatCellRange( argumentCollection=arguments )
}
</cfscript>