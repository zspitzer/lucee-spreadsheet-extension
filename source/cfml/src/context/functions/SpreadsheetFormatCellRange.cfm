<cfscript>
/**
* Applies formatting to a range of cells in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @startRow First row of the range
* @startColumn First column of the range
* @endRow Last row of the range
* @endColumn Last column of the range
*/
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
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.formatCellRange( argumentCollection=arguments )
}
</cfscript>