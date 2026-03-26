component name="cfspreadsheet" {

  variables.spreadsheetCFML = New com.github.cfsimplicity.Spreadsheet()

  public void function init( required boolean hasEndTag, component parent ){
    variables.hasEndTag = arguments.hasEndTag
		variables.parent = arguments.parent
  }

  public boolean function onStartTag( struct attributes, struct caller ){
    // PRE-ACTION VALIDATION ETC
    variables.attributes = arguments.attributes
		var isModifyAction = ( ListFindNoCase( "write,update", getAttribute( "action" ) ) ? true : false )
    // before we go any further, ensure the action is valid
		if( !ListFindNoCase( "read,write,update", getAttribute( "action" ) ) )
			Throw( type="application", message="Invalid or Missing Action Attribute", detail="Valid actions are 'read', 'update', or 'write'." )
		// query and format are mutually exclusive in ACF
		if( attributeExists( "name" ) && attributeExists( "query" ) )
			Throw( type="application", message="Invalid Attribute Combination", detail="Only one of either 'name' or 'query' may be provided, not both" )
		// name or query are required for all operations
		if( !attributeExists( "name" ) && !attributeExists( "query" ) )
			Throw( type="application", message="A 'name' or 'query' Attribute Is Required", detail="Either 'name' or 'query' must be provided" )
		// sheet only applies to action 'read'
		if( ( getAttribute( "action" ) != "read" ) && attributeExists( "sheet" ) )
			Throw( type="application", message="Invalid Attribute Combination", detail="'Sheet' attribute only applies to action 'read'" )
    //common validation for "write" and "update" actions (only)
    if( isModifyAction ){
      if( attributeExists( "sheetNameConflict" ) && !ListFindNoCase( "error,overwrite", attributes.sheetNameConflict ) )
        Throw( type="application", message="Invalid 'SheetNameConflict'", detail="Allowed values for 'SheetNameConflict' are: Error or Overwrite" )
      if( !attributeExists( "filename" ) )
        Throw( type="application", message="Filename Attribute is Required", detail="The 'filename' attribute must be provided for write and update actions" )
      // use the file extension to determine if the format is XSSF
      attributes.xmlFormat = ListLast( Trim( attributes.filename ), "." ) == "xlsx"
      if( attributeExists( "query" ) ){
        var qry = caller[ attributes.query ]
        if( !IsQuery( qry?:"" ) )
          Throw( type="application", message="Invalid 'Query' Attribute", detail="The specified query [#attributes.query#] was not found or is not a query object" )
      }
      if( attributeExists( "columnFormats" ) && !attributeExists( "query" ) )
        Throw( type="application", message="Invalid Attribute Combination", detail="The 'columnFormats' attribute can only be used in conjunction with a 'query' object" )
      if( attributeExists( "name" ) ){
        var nameAttributeValue = caller[ attributes.name ]
        if( IsNull( nameAttributeValue ) )
          Throw( type="application", message="Invalid 'Name' Attribute", detail="The specified variable [#attributes.name#] was not found" )
        if( !( IsSpreadSheetObject( nameAttributeValue ) || IsSimpleValue( nameAttributeValue ) ) )
          Throw( type="application", message="Invalid 'Name' Attribute", detail="'Name' attribute [#attributes.name#] must contain a CSV string or a Spreadsheet object" )
        if( IsSimpleValue( nameAttributeValue ) && !attributeExists( "format" ) )
          Throw( type="application", message="Missing Attribute", detail="Missing required attribute 'format'." )
      }
      if( attributeExists( "autosize" ) )
        attributes.autoSizeColumns = attributes.autosize //spreadsheetCFML uses autoSizeColumns
    }
    // ACTIONS
    if( getAttribute( "action" ) == "read" ){
      if( !attributeExists( "src" ) )
        Throw( type="application", message="Attribute 'src' is Required", detail="The 'src' attribute is required for the read action." )
      if( !FileExists( attributes.src ) )
        Throw( type="application", message="Invalid 'Src' Attribute", detail="The specified 'src' file does not exist [#attributes.src#]." )
      if( attributeExists( "sheet" ) && attributeExists( "sheetName" ) )
        Throw( type="application", message="Both 'sheet' and 'sheetname' Attributes May Not Be Provided", detail="Only one of either 'sheet' or 'sheetname' may be provided" )
      if( attributeExists( "query" ) && attributeExists( "format" ) )
        Throw( type="application", message="Both 'query' and 'format' Attributes May Not Be Provided", detail="Only one of either 'query' or 'format' may be provided" )
      // Map spreadsheet-cfml differences
      // sheet -> sheetNumber
      if( attributeExists( "sheet" ) )
        attributes.sheetNumber = attributes.sheet
      // excludeHeaderRow -> includeHeaderRow, default is the opposite
      if( attributes.KeyExists( "excludeHeaderRow" ) )
        attributes.includeHeaderRow = !attributes.excludeHeaderRow
      else
        attributes.includeHeaderRow = true
      //  Read file into a CSV/HTML string
      if( attributeExists( "format" ) )
        caller[ attributes.name ] = spreadsheetCFML.read( argumentcollection=attributes )
      else if( attributeExists( "query" ) ){
        attributes.format = "query"
        // spreadsheet-cfml will reject a "query" arg
        var queryName = attributes.query
        attributes.Delete( "query" )
        caller[ queryName ] = spreadsheetCFML.read( argumentcollection=attributes )
      }
      else //Read into Spreadsheet object
        caller[ attributes.name ] = SpreadsheetRead( src=attributes.src )
      return true
    }
    if( getAttribute( "action" ) == "write" ){
      attributes.filepath = attributes.filename
      attributes.data = attributeExists( "query" )? caller[ attributes.query ]: caller[ attributes.name ]
      if( IsQuery( attributes.data ) ){
        writeNewFileFromQuery( caller, attributes )
        return true
      }
      if( IsSimpleValue( attributes.data ) ){
        writeNewFileFromCsv( caller, attributes )
        return true
      }
      // workbook
      attributes.workbook = caller[ attributes.name ]
      spreadsheetCFML.write( argumentCollection=attributes )
      return true
    }
    if( getAttribute( "action" ) == "update" ){
      attributes.overwrite = true
      attributes.filepath = attributes.filename
      attributes.data = attributeExists( "query" )? caller[ attributes.query ]: caller[ attributes.name ]
      var fileDoesNotExist = !FileExists( attributes.filepath )
      if( fileDoesNotExist && IsQuery( attributes.data ) ){
        writeNewFileFromQuery( caller, attributes )
        return true
      }
      var dataIsCsv = IsSimpleValue( attributes.data )
      if( fileDoesNotExist && dataIsCsv ){
        writeNewFileFromCsv( caller, attributes )
        return true
      }
      if( dataIsCsv )
        attributes.data = spreadsheetCFML.csvToQuery( attributes.data )
      attributes.workbook = spreadsheetCFML.read( src=attributes.filepath )
      //TODO this internal method needs to be added to the public API
      attributes.sheetName = spreadsheetCFML.getSheetHelper().createOrValidateSheetName( argumentCollection=attributes )
      spreadsheetCFML
        .createSheet( argumentCollection=attributes )
        .setActiveSheet( argumentCollection=attributes )
        .addRows( argumentCollection=attributes )
        .write( argumentCollection=attributes )
      return true
    }
    return true
  }

  public boolean function onEndTag( struct attributes, struct caller ){
    return false
  }

  private void function writeNewFileFromQuery( required struct caller, required struct attributes ){
    arguments.attributes.workbook = spreadsheetCFML.workbookFromQuery( argumentCollection=arguments.attributes )
    if( arguments.attributes.KeyExists( "sheetname" ) )
      spreadsheetCFML.renameSheet( arguments.attributes.workbook, arguments.attributes.sheetname, 1 )
    spreadsheetCFML.write( argumentCollection=arguments.attributes )
  }

  private void function writeNewFileFromCsv( required struct caller, required struct attributes ){
    arguments.attributes.workbook = spreadsheetCFML.workbookFromCsv( csv=arguments.attributes.data )
    if( arguments.attributes.KeyExists( "sheetname" ) )
      spreadsheetCFML.renameSheet( arguments.attributes.workbook, arguments.attributes.sheetname, 1 )
    spreadsheetCFML.write( argumentCollection=arguments.attributes )
  }

  private any function getAttribute( required string key ){
    return variables.attributes[ arguments.key ]
  }

  private boolean function attributeExists( required string key ){
    return variables.attributes.KeyExists( arguments.key )
  }

}