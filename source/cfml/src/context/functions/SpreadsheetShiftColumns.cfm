<cfscript>
/**
* Shifts columns left or right in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @start First column to shift
* @end Last column to shift
* @columns Number of columns to shift (positive = right, negative = left)
*/
void function SpreadsheetShiftColumns(
	required any spreadsheet,
	required numeric start,
  numeric end,
  numeric columns
){
  arguments.workbook = arguments.spreadsheet
  if( arguments.KeyExists( "columns" ) )
    arguments.offset = arguments.columns
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.shiftColumns( argumentCollection=arguments )
}
</cfscript>