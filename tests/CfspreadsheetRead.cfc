component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "cfspreadsheet action=read", ()=>{

			it( "Can read an XLS file into a workbook object", ()=>{
				var path = getTestFilePath( "test.xls" )
				```
				<cfspreadsheet action="read" src="#path#" name="result">
				```
				expect( s.isBinaryFormat( result ) ).toBeTrue()
			})

			it( "Can read an XLSX file into a workbook object", ()=>{
				var path = getTestFilePath( "test.xlsx" )
				```
				<cfspreadsheet action="read" src="#path#" name="result">
				```
				expect( s.isXmlFormat( result ) ).toBeTrue()
			})

			it( "can read a spreadsheet into a query", ()=>{
				var data = [ [ "Frumpo McNugget", "12345" ] ]
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).addRows( data ).write( path, true )
					// default columns names are different in spreadsheet-cfml
					var expected = QueryNew( "column1,column2", "VarChar,VarChar", data )
					```
					<cfspreadsheet action="read" src="#path#" query="actual">
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "includes the specified headerRow by default (unlike spreadsheet-cfml)", ()=>{
				var columns = [ "name", "number" ]
				var data = [ "Frumpo McNugget", "12345" ]
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).addRow( columns ).addRow( data ).write( path, true )
					var expected = QueryNew( columns.ToList(), "VarChar,VarChar", [ columns, data ] )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" headerRow=1>
					```
					expect( actual ).toBe( expected )
					// explicitly exclude the header row
					var expected = QueryNew( columns.ToList(), "VarChar,VarChar", [ data ] )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" headerRow=1 excludeHeaderRow=true>
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "Can read a spreadsheet and return a CSV string", ()=>{
				var data = [ [ "Frumpo McNugget" ], [ "Susi Sorglos" ] ]
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).addRows( data ).write( path, true )
					var expected = "Frumpo McNugget" & Chr( 10 ) & "Susi Sorglos" & Chr( 10 )
					```
					<cfspreadsheet action="read" src="#path#" format="csv" name="actual" excludeHeaderRow=true>
					```
					expect( actual.replace( Chr( 13 ), "", "all" ) ).toBe( expected )
				})
			})

			it( "Can read a spreadsheet and return HTML", ()=>{
				var data = [ [ "Frumpo McNugget" ], [ "Susi Sorglos" ] ]
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).addRows( data ).write( path, true )
					var expected = "<tbody><tr><td>Frumpo McNugget</td></tr><tr><td>Susi Sorglos</td></tr></tbody>"
					```
					<cfspreadsheet action="read" src="#path#" format="html" name="actual" excludeHeaderRow=true>
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "Reads from the specified sheet name or number", ()=>{
				var data = [ [ "Frumpo McNugget", "12345" ] ]
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type )
						.createSheet( "sheet2" )
						.setActiveSheet( "sheet2" )
						.addRows( data )
						.write( path, true )
					var expected = QueryNew( "column1,column2", "VarChar,VarChar", data )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" sheetName="sheet2">
					```
					expect( actual ).toBe( expected )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" sheet="2">
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "Can read specific rows only", ()=>{
				var data = [ [ "row1" ], [ "row2" ] ]
				variables.spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type )
						.addRows( data )
						.write( path, true )
					var expected = QueryNew( "column1", "VarChar", [ [ "row2" ] ] )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" rows="2">
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "Can read specific columns only", ()=>{
				var data = [ [ "a", "b" ] ]
				variables.spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type )
						.addRows( data )
						.write( path, true )
					var expected = QueryNew( "column1", "VarChar", [ [ "b" ] ] )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" columns="2">
					```
					expect( actual ).toBe( expected )
				})
			})

			it( "Allows query column names to be specified", ()=>{
				var columns = [ "Name", "Number" ]
				var data = [ [ "Frumpo McNugget", "12345" ] ]
				variables.spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type )
						.addRows( data )
						.write( path, true )
					expected = QueryNew( "Name,Number", "VarChar,VarChar", data )
					```
					<cfspreadsheet action="read" src="#path#" query="actual" columnNames="Name,Number">
					```
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
