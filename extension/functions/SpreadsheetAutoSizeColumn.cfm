<cfscript>
void function SpreadsheetAutoSizeColumn(
  required any spreadsheet,
  required numeric column,
  boolean useMergedCells=false
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.autoSizeColumn( argumentCollection=arguments )
}
</cfscript>