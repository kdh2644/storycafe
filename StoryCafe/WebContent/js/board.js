var control = "";

function listArticle(bcode, pg, key, word) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = pg;
	document.getElementById("key").value = key;
	document.getElementById("word").value = word;
	
	document.getElementById("commonForm").action = root + control + "/list.cafe";
	document.getElementById("commonForm").submit();
}

function moveWrite(bcode) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = "1";
	document.getElementById("key").value = "";
	document.getElementById("word").value = "";
	
	document.getElementById("commonForm").action = root + control + "/write.cafe";
	document.getElementById("commonForm").submit();
}


function viewArticle(bcode, pg, key, word, seq) {
	document.getElementById("bcode").value = bcode;
	document.getElementById("pg").value = pg;
	document.getElementById("key").value = key;
	document.getElementById("word").value = word;
	document.getElementById("seq").value = seq;
	
	document.getElementById("commonForm").action = root + control + "/view.cafe";
	document.getElementById("commonForm").submit();
}

