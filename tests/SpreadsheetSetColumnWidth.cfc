component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

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
