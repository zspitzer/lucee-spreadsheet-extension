component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetRead", ()=>{

			it( "Can read an XLS file into a workbook object", ()=>{
				var path = getTestFilePath( "test.xls" )
				var workbook = SpreadsheetRead( path )
				expect( s.isBinaryFormat( workbook ) ).toBeTrue()
			})

			it( "Can read an XLSX file into a workbook object", ()=>{
				var path = getTestFilePath( "test.xlsx" )
				var workbook = SpreadsheetRead( path )
				expect( s.isXmlFormat( workbook ) ).toBeTrue()
			})

		})

	}

}
