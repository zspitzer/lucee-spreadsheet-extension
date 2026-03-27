component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetInfo", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Can get metadata from a workbook", ()=>{
				var properties = { author: "Bob" }
				workbooks.Each( ( type, wb )=>{
					s.addInfo( wb, properties )
					var expected = "Bob"
					var actual = SpreadsheetInfo( wb ).author
					expect( actual ).toBe( expected )
				})
			})

		})

	}

}
