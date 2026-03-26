<cfscript>
describe( "SpreadsheetSetHeader", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "adds text to the left, centre or right header", ()=>{
		workbooks.Each( ( type, wb )=>{
			var leftText = "I'm on the left"
			var centerText = "I'm in the middle"
			var rightText = "I'm on the right"
			SpreadsheetSetHeader( spreadsheet=wb, leftHeader=leftText, centerHeader=centerText, rightHeader=rightText )
			var header = s.getSheetHelper().getActiveSheetHeader( wb )
			expect( header.getLeft() ).toBe( leftText )
			expect( header.getCenter() ).toBe( centerText )
			expect( header.getRight() ).toBe( rightText )
		})
	})

})
</cfscript>