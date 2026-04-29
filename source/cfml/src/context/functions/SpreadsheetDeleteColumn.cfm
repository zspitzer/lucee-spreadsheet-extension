<cfscript>
/**
* Deletes a column from a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @column Column number to delete
*/
void function SpreadsheetDeleteColumn(
	required any spreadsheet,
  required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.deleteColumn( arguments.spreadsheet, arguments.column )
}
</cfscript>