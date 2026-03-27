component extends="org.lucee.cfml.test.LuceeTestCase" labels="spreadsheet" {

	function beforeAll(){
		variables.helper = New testAdditional.SpreadsheetTestCase( variables )
	}

	function getTestFilePath( required string filename ){
		return variables.helper.getTestFilePath( arguments.filename )
	}

	function run( testResults, testBox ){

		describe( "SpreadsheetAddImage", ()=>{

			beforeEach( ()=>{
				variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
			})

			it( "Doesn't error when adding an image to a spreadsheet", ()=>{
				var imagePath = getTestFilePath( "test.png" )
				workbooks.Each( ( type, wb )=>{
					SpreadsheetAddImage( wb, imagePath, "1,1,2,2" )
					var imageData = ImageNew( "", 10, 10, "rgb", "blue" )
					SpreadsheetAddImage( wb, imageData, "png", "1,2,2,3" )
					expect( wb.getAllPictures() ).toHaveLength( 2 )
				})
			})

		})

	}

}
