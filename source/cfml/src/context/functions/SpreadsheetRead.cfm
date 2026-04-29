<cfscript>
/**
* Reads a spreadsheet file into a workbook object.
* @src Path to the spreadsheet file to read
*/
any function SpreadsheetRead( required string src ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet();
  return spreadsheetCFML.read( src=arguments.src )
}
</cfscript>