<cfscript>
/**
* Removes a sheet from a spreadsheet workbook by number.
* @spreadsheet The spreadsheet workbook object
* @sheetNumber Number of the sheet to remove (1-based)
*/
void function SpreadsheetRemoveSheetNumber(
	required any spreadsheet,
  required numeric sheetNumber
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.removeSheetNumber( arguments.spreadsheet, arguments.sheetNumber )
}
</cfscript>