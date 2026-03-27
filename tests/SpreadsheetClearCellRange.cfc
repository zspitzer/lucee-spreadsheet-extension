component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetClearCellRange", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Clears the specified range of cells", ()=>{
				var data = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a","b","c" ], [ "d","e","f" ], [ "g","h","i" ] ] )
				var expected = QueryNew( "column1,column2,column3", "VarChar,VarChar,VarChar", [ [ "a","b","c" ], [ "d","","" ], [ "g","","" ] ] )
				workbooks.Each( ( type, wb )=>{
					s.addRows( wb, data )
					SpreadsheetClearCellRange( wb, 2, 2, 3, 3 )
					var actual = s.getSheetHelper().sheetToQuery( workbook=wb, includeBlankRows=true )
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
