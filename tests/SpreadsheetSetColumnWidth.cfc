component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetSetColumnWidth", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "can set and get column width", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.addRow( wb, "a" )
					SpreadsheetSetColumnWidth( wb, 1, 10 )
					expect( s.getColumnWidth( wb, 1 ) ).toBe( 10 )
					expect( Round( s.getColumnWidthInPixels( wb, 1 ) ) ).toBe( 70 )
				})
			})

		})

	}

}
