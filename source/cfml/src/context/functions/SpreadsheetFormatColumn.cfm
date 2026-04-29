<cfscript>
/**
* Applies formatting to an entire column in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @format A struct containing format properties (e.g. bold, italic, font, color)
* @column Column number to format
*/
void function SpreadsheetFormatColumn(
  required any spreadsheet,
  required struct format,
  required numeric column
){
  arguments.workbook = arguments.spreadsheet
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.formatColumn( argumentCollection=arguments )
}
</cfscript>