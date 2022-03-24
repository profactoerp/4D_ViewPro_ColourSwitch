
Case of 
	: (Form event code:C388=On VP Ready:K2:59)
		
		OBJECT SET ENABLED:C1123(*; "Popup Dropdown List"; True:C214)
		pageLocation:=WA Evaluate JavaScript:C1029(*; "ViewProArea"; "window.location.href")
		
End case 
