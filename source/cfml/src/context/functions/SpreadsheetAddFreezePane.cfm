<cfscript>
/**
* Adds a freeze pane to a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @freezeColumn Number of columns to freeze
* @freezeRow Number of rows to freeze
* @column Leftmost visible column in the scrollable region
* @row Top visible row in the scrollable region
*/
void function SpreadsheetAddFreezePane(
	required any spreadsheet,
	required numeric freezeColumn,
  required numeric freezeRow,
  numeric column,
  numeric row
){
	arguments.workbook = arguments.spreadsheet
	if( arguments.KeyExists( "column" ) )
		arguments.leftmostColumn = arguments.column
	if( arguments.KeyExists( "row" ) )
		arguments.topRow = arguments.row
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.addFreezePane( argumentCollection=arguments )
}
</cfscript>