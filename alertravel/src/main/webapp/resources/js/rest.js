async function rest_get(url) {
	try {
		let res = await fetch(url);
		return await res.json();
	} catch(e) {
	console.log(e);
	} 
}
/*이클립스의 자바스크립트 분석기가 await가 뭔지 몰라서 나는 에러이므로 브라우저에서는 괜찮다.*/

/*fetch의 메서드 옵션을 post로 지정*/

async function rest_create(url, data) {
	try {
		let res = await fetch(url, {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify(data),
		})
		return await res.json();
	} catch(e) {
		console.log(e);
	} 
}

/* PUT */

async function rest_modify(url, data){
	try {
		let res = await fetch(url, {
			method: "PUT",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify(data),
		})
		return await res.json();
	} catch(e) {
		console.log(e);
	} 
}

/* DELETE */
async function rest_delete(url) {
	try {
		let res = await fetch(url, { method: "DELETE" });
		return await res.text(); 
	} catch(e) {
		console.log(e);
		}
	}


