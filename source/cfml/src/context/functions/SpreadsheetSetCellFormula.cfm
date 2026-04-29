<cfscript>
/**
* Sets a formula on a single cell in a spreadsheet workbook.
* @spreadsheet The spreadsheet workbook object
* @formula The formula to set (without leading '=')
* @row Row number of the cell
* @column Column number of the cell
*/
void function SpreadsheetSetCellFormula(
	required any spreadsheet,
	required string formula,
	required numeric row,
	required numeric column
){
	param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
	spreadsheetCFML.setCellFormula(
    arguments.spreadsheet,
    arguments.formula,
    arguments.row,
    arguments.column
  )
}
</cfscript>