/**
 * 
 */
function checkValue(fObj) {
	var maxNum = fObj.elements.length;

	var result = "";
	for (var i = 0; i < maxNum; i++) {
		var eObj = fObj.elements[i];
		if (i % 2 == 1 && i != maxNum - 1) {
			var checkNum = new Number(eObj.value);
			try{
			if (isNaN(checkNum)) {
				alert("숫자입력안해?");
				eObj.value = "";
				eObj.focus();
				return false;
			}
			}catch(e){
				alert(e);
				throw e;
			}
		}
		if (eObj.value != "전송") {			
			result += eObj.value;
		}
		if (i == maxNum - 1) {
			eObj.value = result;
		}
	}
	return false;
}