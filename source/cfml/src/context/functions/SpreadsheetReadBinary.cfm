<cfscript>
/**
* Returns a spreadsheet workbook as binary data.
* @spreadsheet The spreadsheet workbook object
*/
any function SpreadsheetReadBinary( required any spreadsheet ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
  return spreadsheetCFML.readBinary( arguments.spreadsheet )
}
</cfscript>