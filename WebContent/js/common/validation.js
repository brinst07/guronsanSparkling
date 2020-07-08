/**
 * 
 */
//정규식 패턴 : http://ryanswanson.com/regexp/#start
//if(/^[a-z][0-9]{3}$/.test('a001')){}
String.prototype.validationID = function(){
	//<input type=test name = mem_id/>
	// "a001".validationID();
	return /^[a-z][0-9]{3}$/.test(this);
};

String.prototype.validationPWD = function(){
	//<input type=test name = mem_id/>
	// "a001".validationID();
	return /^[a-z0-9]{4,20}$/.test(this);
};

String.prototype.validationBIR = function(){
	//<input type=test name = mem_id/>
	// "a001".validationID();
	return /^(19\d{2}|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2]\d|3[0-1])$/.test(this);
};

String.prototype.validationREGNO = function(){
	//<input type=test name = mem_id/>
	// "a001".validationID();
	var moto = this.replace('-','');
	var magicNum = this.substr(12,1);
	var sum = 0;
	var checkSum = '234567892345';
	for(var i=0; i<12; i++){
		sum += moto.charAt(i) * checkSum.charAt(i);
	}
	
	var finalValue = (11-(sum%11))%10;
	if(finalValue == parseInt(magicNum)){
		return true;
	}else{
		return false;
	}
};

String.prototype.validationLIKE = function(){
	return /^[가-힣]{1,10}$/.test(this);
};
String.prototype.validationJOB = function(){
	return /^[가-힣]{1,10}$/.test(this);
};
String.prototype.validationHOMETEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationHOMETEL2 = function(){
	return /^[0-9]{3,4}$/.test(this);
};
String.prototype.validationHOMETEL3 = function(){
	return /^[0-9]{4}$/.test(this);
};
String.prototype.validationCOMTEL = function(){
	return /^0\d{1,2}-\d{3,4}-\d{4}$/.test(this);
};
String.prototype.validationCOMTEL2 = function(){
	return /^[0-9]{3,4}$/.test(this);
};
String.prototype.validationCOMTEL3 = function(){
	return /^[0-9]{4}$/.test(this);
};
String.prototype.validationHP2 = function(){
	return /^[0-9]{3,4}$/.test(this);
};
String.prototype.validationHP3 = function(){
	return /^[0-9]{4}$/.test(this);
};
String.prototype.validationMAIL = function(){
	return /^[a-z0-9]+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};

String.prototype.validationHP = function(){
	return /^01(0|1|6|7|9)-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationDONG = function(){
	// '대흥동'.validationDONG();
	return /^[가-힣]{2,6}$/.test(this);
};

String.prototype.validationprodID = function(){
	//<input type=test name = mem_id/>
	// "a001".validationID();
	return /^[P]{1}[0-9]{9}$/.test(this);
};

String.prototype.validationTITLE = function(){
	return /^[가-힣a-zA-Z]{1,30}$/.test(this);
};

String.prototype.validationNICKNAME = function(){
	return /^[가-힣]{2,5}$/.test(this);
};

String.prototype.validationNAME = function(){
	return /^[가-힣]{2,5}$/.test(this);
};
String.prototype.validationREGNO1 = function(){
	return /^[0-9]{6}$/.test(this);
};
String.prototype.validationREGNO2 = function(){
	return /^[0-9]{7}$/.test(this);
};
String.prototype.validationBIR1 = function(){
	return /^[0-9]{4}$/.test(this);
};
String.prototype.validationBIR2 = function(){
	return /^[0-9]{2}$/.test(this);
};
String.prototype.validationBIR3 = function(){
	return /^[0-9]{2}$/.test(this);
};


