<cfscript>
describe( "SpreadsheetSetFooter", ()=>{

	beforeEach( ()=>{
		variables.workbooks = { xls: s.newXls(), xlsx: s.newXlsx() }
	})

	it( "adds text to the left, centre or right footer", ()=>{
		workbooks.Each( ( type, wb )=>{
			var leftText = "I'm on the left"
			var centerText = "I'm in the middle"
			var rightText = "I'm on the right"
			SpreadsheetSetFooter(spreadsheet=wb, leftFooter=leftText, centerFooter=centerText, rightFooter=rightText )
			var footer = s.getSheetHelper().getActiveSheetFooter( wb )
			expect( footer.getLeft() ).toBe( leftText )
			expect( footer.getCenter() ).toBe( centerText )
			expect( footer.getRight() ).toBe( rightText )
		})
	})

})	
</cfscript>