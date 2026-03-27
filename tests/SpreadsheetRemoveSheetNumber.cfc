component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetRemoveSheetNumber", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Deletes the sheet number specified", ()=>{
				workbooks.Each( ( type, wb )=>{
					s.createSheet( wb, "test" )
					SpreadsheetRemoveSheetNumber( wb, 2 )
					expect( wb.getNumberOfSheets() ).toBe( 1 )
				})
			})

		})

	}

}
