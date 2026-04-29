<cfscript>
/**
* Adds an image to a spreadsheet workbook.
* Can be called with a file path: SpreadsheetAddImage( workbook, filepath, anchor )
* Or with image data: SpreadsheetAddImage( workbook, imageData, imageType, anchor )
* @spreadsheet The spreadsheet workbook object
* @arg2 Image file path or binary image data
* @arg3 Anchor string (if arg2 is a filepath) or image type e.g. "png" (if arg2 is image data)
* @arg4 Anchor string (only when arg2 is image data)
*/
void function SpreadsheetAddImage(
	required any spreadsheet,
	required any arg2,
  required string arg3,
  string arg4
){
  param variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet( loadJavaClassesUsing="javaSettings" );
  // for some reason argumentCollection doesn't work here (required anchor gets lost)
  if( arguments.KeyExists( "arg4" ) ){
    spreadsheetCFML.addImage( workbook: arguments.spreadsheet, imageData: arguments.arg2, imageType: arguments.arg3, anchor: arguments.arg4 )
    return;
  }
  spreadsheetCFML.addImage( workbook: arguments.spreadsheet, filepath: arguments.arg2, anchor: arguments.arg3 )
}
</cfscript>