component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "cfspreadsheet action=update", ()=>{

			it( "Creates a new sheet in an existing spreadsheet file and populates it from a query", ()=>{
				var data = QueryNew( "column1", "VarChar", [ [ "Frumpo" ] ] )
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).write( path, true )
					```
					<cfspreadsheet action="update" query="data" filename="#path#" overwrite="true">
					```
					var expected = data
					var actual = s.read( src=path, format="query", sheetNumber="2" )
					expect( actual ).toBe( expected )
				})
			})

			it( "Creates a new sheet in an existing spreadsheet file and populates it from a CSV string", ()=>{
				var csvString = 'column1,column2#NewLine()#Frumpo,McNugget'
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).write( path, true )
					```
					<cfspreadsheet action="update" format="csv" name="csvString" filename="#path#" overwrite="true">
					```
					var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "Frumpo", "McNugget" ] ] )
					var actual = s.read( src=path, format="query", sheetNumber="2", headerRow=1, excludeHeaderRow=true )
					expect( actual ).toBe( expected )
				})
			})

			it( "Can use the specified name for the new sheet", ()=>{
				var data = QueryNew( "column1", "VarChar", [ [ "Frumpo" ] ] )
				spreadsheetTypes.Each( ( type )=>{
					var path = variables[ "temp" & type & "Path" ]
					s.newChainable( type ).write( path, true )
					```
					<cfspreadsheet action="update" query="data" sheetName="secondSheet" filename="#path#" overwrite="true">
					```
					var expected = data
					var actual = s.read( src=path, format="query", sheetName="secondSheet" )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
