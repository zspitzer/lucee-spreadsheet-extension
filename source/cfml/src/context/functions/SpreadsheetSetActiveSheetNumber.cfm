<cfscript>
/**
* Sets the active sheet in a spreadsheet workbook by number.
* @spreadsheet The spreadsheet workbook object
* @sheetNumber Number of the sheet to make active (1-based)
*/
void function SpreadsheetSetActiveSheetNumber(
	required any spreadsheet,
  required numeric sheetNumber
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.setActiveSheetNumber( arguments.spreadsheet, arguments.sheetNumber )
}
</cfscript>