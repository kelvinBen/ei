function setScale( value , scale )
{
	if( isNaN( value ) || isNaN( scale ) || parseInt( scale ) < 0 )
		return new String( value ) ;

	var strValue = new String( value ) ;
	 
	var fValue = parseFloat( value ) ;
	
	var iScale = parseInt( scale ) ;
	
	if( iScale == 0 )
		return new String( ( fValue < 0.0 ? "-" : "" ) + Math.round( Math.abs( fValue ) ) ) ;
		
	if( fValue == parseInt( strValue ) )  //����Ĳ���û��С������
	{	
		strValue = new String( parseInt( strValue ) ) + "." ;
     
		for( var i = 0 ; i < iScale ; i ++ )
			strValue += "0" ;
			
	}
	else 
	{
		var fDecimal = Math.abs( fValue - parseInt( strValue ) ) ;
		fDecimal = Math.round( fDecimal * Math.pow( 10 , iScale ) ) ;
		var strDecimal = new String( fDecimal ) ;
		//������ new String( Math.round( 0.07 * Math.pow( 10 , 2 ) ) ) == "7" but not "07" �����������Ҫ�����²��㴦��
		if( strDecimal.length < iScale ) 
		{
			var iDecimalLength = strDecimal.length ;
			
			for( var i = 0 ; i < iScale - iDecimalLength ; i ++ )
				strDecimal = "0" + strDecimal ;
	
			strValue = new String( parseInt( strValue ) ) + "." + strDecimal ;
			
		}
		//������ new String( Math.round( 0.995 * Math.pow( 10 , 2 ) ) ) == "100" �����������Ҫ�����²��㴦��
		else if( strDecimal.length > iScale ) 
		{
			strValue = new String( parseInt( strValue ) + 1 ) ;			
			
			strValue += "." ;
			for( var i = 0 ; i < iScale ; i ++ )
				strValue += "0" ;
		}
		else
			
			if(parseFloat(strValue)>-1&&parseFloat(strValue)<0)
			{
				
				
				strValue = new String("-"+ parseInt( strValue ) ) + "." + strDecimal ;
				
			}
			else
			{
				
				strValue = new String( parseInt( strValue ) ) + "." + strDecimal ;
				
			}
			
			
	}
	
	return strValue ;
}

