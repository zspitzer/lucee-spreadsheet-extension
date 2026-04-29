<cfscript>
/**
* Shifts rows up or down in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @start First row to shift
* @end Last row to shift
* @rows Number of rows to shift (positive = down, negative = up)
*/
void function SpreadsheetShiftRows(
	required any spreadsheet,
	required numeric start,
  numeric end,
  numeric rows
){
  arguments.workbook = arguments.spreadsheet
  if( arguments.KeyExists( "rows" ) )
    arguments.offset = arguments.rows
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.shiftRows( argumentCollection=arguments )
}
</cfscript>