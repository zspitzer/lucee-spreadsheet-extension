<cfscript>
void function SpreadsheetShiftColumns(
	required any spreadsheet,
	required numeric start,
  numeric end,
  numeric columns
){
  arguments.workbook = arguments.spreadsheet
  if( arguments.KeyExists( "columns" ) )
    arguments.offset = arguments.columns
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.shiftColumns( argumentCollection=arguments )
}
</cfscript>