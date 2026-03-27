component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetAddRows", ()=>{

			beforeEach( ()=>{
				variables.data = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "a", "b" ], [ "c", "d" ] ] )
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Appends multiple rows from a query with the minimum arguments", ()=>{
				var expected = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "x", "y" ], [ "a", "b" ], [ "c", "d" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addRow( wb, "x,y" )
					SpreadsheetAddRows( wb, data )
					var actual = s.getSheetHelper().sheetToQuery( wb )
					expect( actual ).toBe( expected )
				})
			})

			it( "Inserts multiple rows at a specifed position", ()=>{
				var expected = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "", "a", "b" ], [ "", "c", "d" ], [ "e", "f", "" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addRow( wb, "e,f" )
					SpreadsheetAddRows( wb, data, 1, 2 )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

			it( "Replaces rows if insert is false", ()=>{
				var expected = data
				var rowsToReplace = QueryNew( "column1,column2", "VarChar,VarChar", [ [ "e", "f" ], [ "g", "h" ] ] )
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddRows( wb, rowsToReplace )
					SpreadsheetAddRows( spreadsheet=wb, data=data, row=1, insert=false )
					var actual = s.getSheetHelper().sheetToQuery( wb )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
