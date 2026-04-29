<cfscript>
/**
* Reads a spreadsheet file into a workbook object.
* @src Path to the spreadsheet file to read
* @password Password to open a password-protected file
*/
any function SpreadsheetRead( required string src, string password ){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
  return spreadsheetCFML.read( argumentCollection=arguments )
}
</cfscript>
