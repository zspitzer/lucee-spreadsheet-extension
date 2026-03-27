component extends="testAdditional.SpreadsheetTestCase" labels="spreadsheet" {

	function run( testResults, testBox ){

		describe( "SpreadsheetReadBinary", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Returns a binary object", ()=>{
				workbooks.Each( ( type, wb )=>{
					expect( IsBinary( SpreadsheetReadBinary( wb ) ) ).toBeTrue()
				})
			})

		})

	}

}
