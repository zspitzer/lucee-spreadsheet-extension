<cfscript>
void function SpreadsheetShiftRows(
	required any spreadsheet,
	required numeric start,
  numeric end,
  numeric rows
){
  arguments.workbook = arguments.spreadsheet
  if( arguments.KeyExists( "rows" ) )
    arguments.offset = arguments.rows
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
	spreadsheetCFML.shiftRows( argumentCollection=arguments )
}
</cfscript>